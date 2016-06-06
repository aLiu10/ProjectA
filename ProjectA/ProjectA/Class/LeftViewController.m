//
//  LeftViewController.m
//  ProjectA
//
//  Created by lanou on 16/5/31.
//  Copyright © 2016年 Aliu. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}
#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"阅读";
            break;
        case 1:
            cell.textLabel.text = @"电台";
            break;
        case 2:
            cell.textLabel.text = @"话题";
            break;
        case 3:
            cell.textLabel.text = @"良品";
            break;
        default:
            break;
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //SubViewController *subVC = [SubViewController new];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *subVC;
    switch (indexPath.row) {
        case 0:
            subVC = [ReadViewController new];
            subVC.title =  @"阅读";
            subVC.view.backgroundColor = [UIColor colorWithWhite:0.902 alpha:1.000];
            break;
        case 1:
            subVC = [RadioViewController new];
            subVC.title = @"电台";
            subVC.view.backgroundColor = [UIColor colorWithRed:0.316 green:1.000 blue:0.742 alpha:1.000];
            break;
        case 2:
            subVC = [TopicViewController new];
            subVC.title = @"话题";
            subVC.view.backgroundColor = [UIColor colorWithRed:0.450 green:0.473 blue:1.000 alpha:1.000];
            break;
        case 3:
            subVC = [GoodsViewController new];
            subVC.title = @"良品";
            subVC.view.backgroundColor = [UIColor whiteColor];
            break;
        default:
            break;
    }
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:subVC];
    [self.mm_drawerController setCenterViewController:nav withFullCloseAnimation:YES completion:nil];
    /*
     [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
    }];
    */
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
