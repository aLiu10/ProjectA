//
//  ReadDetailViewController.m
//  ProjectA
//
//  Created by lanou on 16/5/31.
//  Copyright © 2016年 Aliu. All rights reserved.
//

#import "ReadDetailViewController.h"
#import "NetWorkRequsetManager.h"
#import "ReadDetail.h"
#import "ReadDetailListCell.h"
#import "FactoryTableViewCell.h"
#import "ReadInfoViewController.h"


@interface ReadDetailViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    ReadDetailBaseClass *_detailBaseModel;
    UITableView *_addtimeTable;
    UITableView *_hotTable;
    BOOL _isShowHot;
    UISegmentedControl *_segmentedControl;
    NSInteger _start;//网络请求参数
    NSMutableArray *_addItemArray;
    
    
}
@property(nonatomic,assign)NSInteger selectIndex;

@end

@implementation ReadDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _addItemArray = [NSMutableArray array];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initScrollView];
    //最新模块下拉刷新
    _addtimeTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        _start = 0;
        [self netWorkRequsetWithSort:@"addtime"];
    }];
    [_addtimeTable.mj_header beginRefreshing];
    //最热模块下拉刷新
    _hotTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        _start = 0;
        [self netWorkRequsetWithSort:@"hot"];
    }];
    //最新模块上拉加载
    _addtimeTable.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        _start +=10;
        [self netWorkRequsetWithSort:@"addtime"];
    }];
  
    //最热模块上拉加载
    _hotTable.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        _start +=10;
        [self netWorkRequsetWithSort:@"hot"];

        
    }];
    
    [self netWorkRequsetWithSort:@"addtime"];
    // Do any additional setup after loading the view.
}

#pragma mark -根据read类型请求数据
-(void)netWorkRequsetWithSort:(NSString *)sort{
    NSDictionary *dic = @{@"typeid":_typeID, @"start":@(_start), @"sort":sort};
    [NetWorkRequsetManager requestWithType:POST url:READDETAILLIST_URL para:dic finish:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        _detailBaseModel = [ReadDetailBaseClass modelObjectWithDictionary:dic];
        if (_isShowHot) {
            if (_start == 0) {
                [_addItemArray removeAllObjects];
                [_addItemArray addObjectsFromArray:_detailBaseModel.data.list];
            }else{
                [_addItemArray addObjectsFromArray:_detailBaseModel.data.list];
            }
        }else{
            //addtime
            if (_start == 0) {
                [_addItemArray removeAllObjects];
                [_addItemArray addObjectsFromArray:_detailBaseModel.data.list];
            }else{
                [_addItemArray addObjectsFromArray:_detailBaseModel.data.list];
            }
            
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            if (_isShowHot) {
                [_hotTable reloadData];
                [_hotTable.mj_header endRefreshing];
                [_hotTable.mj_footer endRefreshing];
        
            }else{
                [_addtimeTable reloadData];
                [_addtimeTable.mj_header endRefreshing];
                [_addtimeTable.mj_footer endRefreshing];
            }
        });
        NSLog(@"result___%.f",_detailBaseModel.result);
    } error:^(NSError *error) {
        NSLog(@"error___%@",[error description]);
    }];
}

-(void)initScrollView{
    self.view.backgroundColor = [UIColor whiteColor];
    _segmentedControl = [[UISegmentedControl alloc]initWithItems:@[@"最新",@"最热"]];
    _segmentedControl.frame = CGRectMake(ScreenWidth/2-60,0, 120, 29);
    _segmentedControl.selectedSegmentIndex = 0;
    [self.view addSubview:_segmentedControl];
    [_segmentedControl addTarget:self action:@selector(DidTapSegementChanged) forControlEvents:UIControlEventValueChanged];
    
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 29, ScreenWidth, ScreenHeight)];
    _scrollView.contentSize = CGSizeMake(ScreenWidth*2, ScreenHeight-29);
    _scrollView.backgroundColor = [UIColor whiteColor];
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    
    _addtimeTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-80)style:UITableViewStylePlain];
    _addtimeTable.showsVerticalScrollIndicator = NO;
    
    
    [_addtimeTable registerNib:[UINib nibWithNibName:@"ReadDetailListCell" bundle:nil] forCellReuseIdentifier:@"ReadDetailListCell"];
    
    [_addtimeTable setDelegate:self];
    [_addtimeTable setDataSource:self];
    _addtimeTable.tag = 10;
    [_scrollView addSubview:_addtimeTable];
    
    _hotTable = [[UITableView alloc]initWithFrame:CGRectMake(ScreenWidth, 0, ScreenWidth, ScreenHeight-80)style:UITableViewStylePlain];
    [_hotTable registerNib:[UINib nibWithNibName:@"ReadDetailListCell" bundle:nil] forCellReuseIdentifier:@"ReadDetailListCell"];
    _hotTable.showsVerticalScrollIndicator = NO;
    _hotTable.tag = 20;
    [_hotTable setDelegate:self];
    [_hotTable setDataSource:self];
    [_scrollView addSubview:_hotTable];
    
    
    [self.view addSubview:_scrollView];
    
}

#pragma mark tableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag == 10) {
        return _addItemArray.count;
    }else{
        return _addItemArray.count;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    /*
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    */
    
    ReadDetailList *list = _addItemArray[indexPath.row];
    BaseTableViewCell *cell = [FactoryTableViewCell dequeueWithIdentify:list withTableView:tableView index:indexPath];
    [cell setDataWithModel:list];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ReadInfoViewController *infoVC = [ReadInfoViewController new];
    ReadDetailList *listModel = _detailBaseModel.data.list[indexPath.row];
    infoVC.contentid = listModel.listIdentifier;
    [self.navigationController pushViewController:infoVC animated:YES];
}

#pragma mark scrollViewDelegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = _scrollView.contentOffset.x/ScreenWidth;
    _segmentedControl.selectedSegmentIndex = index;
    self.selectIndex = index;
}

#pragma mark 判断滑动距离来决定是否刷新数据（利用setter方法优化）
-(void)setSelectIndex:(NSInteger)selectIndex{
    if (_selectIndex!=selectIndex) {
        
        NSLog(@"index____%ld",(long)selectIndex);
        
        if (selectIndex == 0) {
            [self netWorkRequsetWithSort:@"addtime"];
            
            _isShowHot = NO;
        }else{
            [self netWorkRequsetWithSort:@"hot"];
            
            _isShowHot = YES;
        }
        _selectIndex = selectIndex;
    }
}

-(void)DidTapSegementChanged{
    
    //NSLog(@"segement.index___%ld",(long)segement.selectedSegmentIndex);
    if (_segmentedControl.selectedSegmentIndex == 0) {
        [_addtimeTable.mj_header beginRefreshing];
        
        [self netWorkRequsetWithSort:@"addtime"];
        [_scrollView setContentOffset:CGPointMake(0,0) animated:YES];
        _isShowHot = NO;
    }else{
        [_hotTable.mj_header beginRefreshing];
        [self netWorkRequsetWithSort:@"hot"];
        [_scrollView setContentOffset:CGPointMake(ScreenWidth, 0) animated:YES];
        _isShowHot = YES;
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
