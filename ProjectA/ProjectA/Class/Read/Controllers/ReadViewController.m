//
//  ReadViewController.m
//  ChoutiTest1
//
//  Created by lanou on 16/5/31.
//  Copyright © 2016年 Aliu. All rights reserved.
//

#import "ReadViewController.h"
#import "ReadListDataModel.h"
#import "NetWorkRequsetManager.h"
#import "MMDrawerBarButtonItem.h"
#import "ReadDetailViewController.h"
#import "ReadListCell.h"
#import "ReadInfoViewController.h"


@interface ReadViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate,SDCycleScrollViewDelegate>
{
    ReadListBaseClass *_baseModel;
    UICollectionView *_collectionView;
    UIScrollView *_scrollView;
    
    
}

@end

@implementation ReadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent= NO;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithWhite:0.902 alpha:1.000];
    
    [self initCollectionView];
    [self netWorkRequset];
    
    
}
#pragma mark 自定义方法
#pragma mark 轮播图数据
-(void)reloadCycle{
    NSMutableArray *urlStrArray = [NSMutableArray array];
    for (ReadListCarousel *carou in _baseModel.data.carousel) {
        [urlStrArray addObject:carou.img];
    }
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 64, ScreenWidth, 226) delegate:self placeholderImage:nil];
    cycleScrollView.imageURLStringsGroup = urlStrArray;
    [self.view addSubview:cycleScrollView];
}





-(void)initCollectionView{
    
    //屏幕适配
    //让高是宽的60% 确定比例之后，屏幕怎么变化 图片都不会变形
    self.navigationController.navigationBar.translucent = YES;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 2;
    layout.minimumInteritemSpacing = 2;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake(ScreenWidth/3-10, ScreenWidth/3);
    layout.sectionInset = UIEdgeInsetsMake(10,10,10,10);
    
    //让collectionView紧跟着scrollView，底部贴紧屏幕(随着屏幕变化)
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, ScreenWidth*0.6+64, ScreenWidth, ScreenHeight-ScreenWidth*0.6-64) collectionViewLayout:layout];
    [_collectionView registerNib:[UINib nibWithNibName:@"ReadListCell" bundle:nil] forCellWithReuseIdentifier:@"ReadListCell"];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    //_collectionView.bounces = NO;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
    _collectionView.backgroundColor = [UIColor colorWithWhite:0.902 alpha:1.000];
    
    [self.view addSubview:_collectionView];
}

-(void)netWorkRequset{
    NSDictionary *dic = @{@"client":@"1"};
    [NetWorkRequsetManager requestWithType:POST url:READLIST_URL para:dic finish:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        _baseModel = [ReadListBaseClass modelObjectWithDictionary:dic];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self reloadCycle];
            [_collectionView reloadData];
            
        });
        NSLog(@"result___%.f",_baseModel.result);
    } error:^(NSError *error) {
        NSLog(@"error___%@",[error description]);
    }];
}

#pragma mark - CollectionViewDelegate DataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _baseModel.data.list.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ReadListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ReadListCell" forIndexPath:indexPath];
    //解决滚动的时候item会重叠的bug
    /*
    for (UIView *view in cell.subviews) {
        if ([view isKindOfClass:[UILabel class]]) {
            [view removeFromSuperview];
        }
    }
    UILabel *label = [[UILabel alloc]initWithFrame:cell.bounds];
    label.font = [UIFont systemFontOfSize:17];
    label.text = listModel.name;
    label.textAlignment = NSTextAlignmentCenter;
     */
     ReadListList *listModel = _baseModel.data.list[indexPath.row];
    [cell.imaView sd_setImageWithURL:[NSURL URLWithString:listModel.coverimg]];
    cell.cnNameLabel.text = listModel.name;
    cell.enNameLabel.text = listModel.enname;
    //cell.backgroundColor = [UIColor greenColor];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ReadDetailViewController *readDeVC = [ReadDetailViewController new];
    ReadListList *list = _baseModel.data.list[indexPath.row];
    readDeVC.typeID = [NSString stringWithFormat:@"%.f",list.type];
    [self.navigationController pushViewController:readDeVC animated:YES];
}
#pragma mark SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    ReadListCarousel *caroul = _baseModel.data.carousel[index];
   
    ReadInfoViewController *webViewVC = [ReadInfoViewController new];
    webViewVC.contentid = [caroul.url substringFromIndex:17];
    [self.navigationController pushViewController:webViewVC animated:YES];
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
