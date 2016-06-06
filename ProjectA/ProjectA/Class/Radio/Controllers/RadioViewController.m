//
//  RadioViewController.m
//  ChoutiTest1
//
//  Created by lanou on 16/5/31.
//  Copyright © 2016年 Aliu. All rights reserved.
//

#import "RadioViewController.h"
#import "NetWorkRequsetManager.h"
#import "RadioList.h"
#import "RadioDetailViewController.h"
#import "RadioTableViewCell.h"
#import "RadioMore.h"

@interface RadioViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    RadioBaseClass *_radilBaseModel;
    RadioMoreListBaseClass *_radioMoreBaeModel;
    UIScrollView *_scrollView;
    NSInteger _start;
    NSMutableArray *_addItemArray;
}

@end

@implementation RadioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _addItemArray = [NSMutableArray array];
    [self loadUI];
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        _start = 0;
        [self loadData];
    }];
    [_tableView.mj_header beginRefreshing];
    _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        _start +=9;
        NSDictionary *dic = @{@"client":@"1",@"deviceid":@"63A94D37-33F9-40FF-9EBB-481182338873",@"auth":@"", @"start":[NSString stringWithFormat:@"%ld", _start]};
        [NetWorkRequsetManager requestWithType:POST url:RADIOMLISTORE_URL para:dic finish:^(NSData *data) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            _radioMoreBaeModel = [RadioMoreListBaseClass modelObjectWithDictionary:dic];
            
            for (RadioMoreListList *all in _radioMoreBaeModel.data.list) {
                [_addItemArray addObject:all];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [_tableView reloadData];
                [self reloadCycle];
                [_tableView.mj_footer endRefreshing];
                
            });
        } error:^(NSError *error) {
            NSLog(@"error__%@",[error description]);
        }];
    }];
     
    [self loadData];
}

#pragma mark 加载view
-(void)loadUI{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 224)];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    //注册xib
    [_tableView registerNib:[UINib nibWithNibName:@"RadioTableViewCell" bundle:nil] forCellReuseIdentifier:@"RadioTableViewCell"];
    _tableView.tableHeaderView = _scrollView;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
}
#pragma mark 网络请求数据
-(void)loadData{
    NSDictionary *dic = @{@"client":@"1",@"deviceid":@"63A94D37-33F9-40FF-9EBB-481182338873",@"auth":@""};
    [NetWorkRequsetManager requestWithType:POST url:RADIOLIST_URL para:dic finish:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        _radilBaseModel = [RadioBaseClass modelObjectWithDictionary:dic];
        if (_start == 0) {
            [_addItemArray removeAllObjects];
            for (RadioBaseClass *all in _radilBaseModel.data.alllist) {
                [_addItemArray addObject:all];
            }
        }else{
            for (RadioBaseClass *all in _radilBaseModel.data.alllist) {
                [_addItemArray addObject:all];
            }
        }
       dispatch_async(dispatch_get_main_queue(), ^{
           [_tableView reloadData];
           [self reloadCycle];
           [_tableView.mj_header endRefreshing];
       });
    } error:^(NSError *error) {
        NSLog(@"error__%@",[error description]);
    }];
    
   
}
#pragma mark tableViewDelegate dataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _addItemArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //cell数据
    static NSString *cellIdentifier = @"RadioTableViewCell";
    RadioTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[RadioTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    RadioAlllist *listModel = _addItemArray[indexPath.row];
    cell.titleLabel.text = listModel.title;
    cell.subTitleLabel.text = listModel.userinfo.uname;
    cell.contentLabel.text = listModel.desc;
    NSNumber *num = [NSNumber numberWithInt:listModel.count];
    cell.numLabel.text = [num stringValue];
    [cell.imaView sd_setImageWithURL:[NSURL URLWithString:listModel.coverimg]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    RadioDetailViewController *detailVC = [RadioDetailViewController new];
    RadioAlllist *listModel = _addItemArray[indexPath.row];
    
    detailVC.radioID = listModel.radioid;
    detailVC.urlStr = listModel.coverimg;
    detailVC.headerTitle = listModel.userinfo.uname;
    detailVC.desc = listModel.desc;
    detailVC.count = [NSString stringWithFormat:@"%.f",listModel.count];
    
    
    [self.navigationController pushViewController:detailVC animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  110;
}

#pragma mark 轮播图数据
-(void)reloadCycle{
    //轮播图图片资源
    NSMutableArray *urlStrArray = [NSMutableArray new];
    for (RadioCarousel *carou in _radilBaseModel.data.carousel) {
        [urlStrArray addObject:carou.img];
        NSLog(@"url___%@",urlStrArray);
    }
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth,224) shouldInfiniteLoop:YES imageNamesGroup:urlStrArray];
    [_scrollView addSubview:cycleScrollView];
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
