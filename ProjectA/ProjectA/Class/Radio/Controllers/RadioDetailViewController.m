//
//  RadioDetailViewController.m
//  ProjectA
//
//  Created by lanou on 16/5/31.
//  Copyright © 2016年 Aliu. All rights reserved.
//

#import "RadioDetailViewController.h"
#import "RadioDetailModel.h"
#import "RadioDetailCell.h"
#import "RadioDetailHeader.h"
#import "RadioDetailMore.h"
#import "RadioPlayInfoViewController.h"

@interface RadioDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    RadioDetailBaseClass *_baseModel;
    RadioDetailMoreBaseClass *_detailMoreBaseModel;
    UITableView *_tableView;
    RadioDetailHeader *_headerView;
    NSInteger _start;
    NSMutableArray *_addItemArray;
}

@property (nonatomic,assign) NSInteger selectIndex;

//单选
@property (nonatomic,assign) NSInteger index;
@end

@implementation RadioDetailViewController

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
        _start +=10;
        NSDictionary *dic = @{@"radioid":_radioID, @"auth":@"Wc06FCrkoq1DCMVzGMTikDJxQ8bm3Mrm2NpT9qWjwzcWP23tBKQx1c4P", @"start":[NSString stringWithFormat:@"%ld", _start]};
        [NetWorkRequsetManager requestWithType:POST url:RADIODETAILMORE_URL para:dic finish:^(NSData *data) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            _detailMoreBaseModel = [RadioDetailMoreBaseClass modelObjectWithDictionary:dic];
            for (RadioDetailMoreList *list in _detailMoreBaseModel.data.list) {
                [_addItemArray addObject:list];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [_tableView reloadData];
                _headerView.authorLabel.text = _headerTitle;
                _headerView.descLabel.text = _desc;
                _headerView.countLabel.text = _count;
                [_headerView.imgView sd_setImageWithURL:[NSURL URLWithString:_baseModel.data.radioInfo.coverimg]];
                [_tableView.mj_footer endRefreshing];
            });
            NSLog(@"result___%.f",_baseModel.result);
        } error:^(NSError *error) {
            NSLog(@"error__%@",[error description]);
        }];
    }];
    [self loadData];
    
}
-(void)loadUI{
    _headerView = [[NSBundle mainBundle]loadNibNamed:@"RadioDetailHeader" owner:nil options:nil][0];
   
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
//    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 224)];
//    [imageView setContentMode:UIViewContentModeScaleToFill];
//    [imageView sd_setImageWithURL:[NSURL URLWithString:_urlStr]];
    [_tableView registerNib:[UINib nibWithNibName:@"RadioDetailCell" bundle:nil] forCellReuseIdentifier:@"RadioDetailCell"];
    _tableView.tableHeaderView = _headerView;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    //_tableView.bounces = NO;
    [self.view addSubview:_tableView];
}
-(void)loadData{
    NSDictionary *dict = @{@"radioid":_radioID,@"auth":@"Wc06FCrkoq1DCMVzGMTikDJxQ8bm3Mrm2NpT9qWjwzcWP23tBKQx1c4P"};
    [NetWorkRequsetManager requestWithType:POST url:RADIODETAILLIST_URL para:dict finish:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        _baseModel = [RadioDetailBaseClass modelObjectWithDictionary:dic];
        if (_start == 0) {
            [_addItemArray removeAllObjects];
            for (RadioDetailList *list in _baseModel.data.list) {
                [_addItemArray addObject:list];
            }
        }else{
            for (RadioDetailList *list in _baseModel.data.list) {
                [_addItemArray addObject:list];
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [_tableView reloadData];
            _headerView.authorLabel.text = _headerTitle;
            _headerView.descLabel.text = _desc;
            _headerView.countLabel.text = _count;
            [_headerView.imgView sd_setImageWithURL:[NSURL URLWithString:_baseModel.data.radioInfo.coverimg]];
            [_tableView.mj_footer endRefreshing];
            [_tableView.mj_header endRefreshing];
        });
        NSLog(@"result___%.f",_baseModel.result);
    } error:^(NSError *error) {
        NSLog(@"error__%@",[error description]);
    }];
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _addItemArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"RadioDetailCell";
    RadioDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[RadioDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    if (_index == indexPath.row) {
        [cell.seletBtn setImage:[UIImage imageNamed:@"3"] forState:UIControlStateNormal];
    }
    else
    {
        [cell.seletBtn setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
    }
    
    //typeof(cell) __weak weakcell = cell;
    
    typeof(self) __weak weakself = self;
    
    
    cell.imagSelectBlcok = ^()
    {
        weakself.index = indexPath.row;
        
    };
    
    RadioDetailList *listModel = _addItemArray[indexPath.row];
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:listModel.coverimg]];
    cell.titleLabel.text = listModel.title;
    cell.countLabel.text = listModel.musicVisit;
    
    
    return cell;
}
-(void)setIndex:(NSInteger)index
{
    if (_index != index) {
        
        NSLog(@"frontindex_______%ld  backindex______%ld",_index,index);
        NSIndexPath *indexpath = [NSIndexPath indexPathForRow:index inSection:0];
        RadioDetailCell *indexcell = [_tableView cellForRowAtIndexPath:indexpath];
        [indexcell.seletBtn setImage:[UIImage imageNamed:@"3"] forState:UIControlStateNormal];
        
        
        NSIndexPath *indexpath2 = [NSIndexPath indexPathForRow:_index inSection:0];
        RadioDetailCell *indexcell2 = [_tableView cellForRowAtIndexPath:indexpath2];
        [indexcell2.seletBtn setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
        _index = index;
    }
}
/*
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 224)];
    [imageView sd_setImageWithURL:[NSURL URLWithString:_urlStr]];
    return imageView;
}
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.selectIndex = indexPath.row;
    RadioPlayInfoViewController *palyViewVc = [RadioPlayInfoViewController new];
    
    palyViewVc.radioListArray = _addItemArray;
    palyViewVc.selectIndex = indexPath.row;
    [self.navigationController pushViewController:palyViewVc animated:YES];
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
