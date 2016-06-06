//
//  RadioPlayInfoViewController.m
//  ProjectA
//
//  Created by lanou on 16/6/6.
//  Copyright © 2016年 Aliu. All rights reserved.
//

#import "RadioPlayInfoViewController.h"
#import "RadioPlayInfoView.h"
#import "RadioPlayMenuView.h"
#import "RadioPlayManager.h"
#import "RadioPlayCell.h"

@interface RadioPlayInfoViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    
    UIScrollView *_backScrollView;
    UITableView *_radioListTable;
    UIWebView *_webView;
    RadioPlayInfoView *_palyInfoView;
    RadioPlayMenuView *_palyMenuView;
    NSTimer *_timer;
    NSInteger _flag;//来标识是push过来还是点击歌曲列表做的切换
}
@property (nonatomic,assign) NSInteger musicIndex;

@end

@implementation RadioPlayInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _musicIndex = _selectIndex;
    [self initUI];
    [self creatPlayManager];
}
-(void)creatPlayManager{
    RadioPlayManager *manager = [RadioPlayManager defaultManager];
    
    _palyInfoView.progressSlider.minimumValue = 0;
    
    manager.playIndex = _musicIndex;
    manager.musicArray = [_radioListArray mutableCopy];
    
    [manager play];
    // 创建计时器对象，在计时器方法中获取播放的时长
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerHandle) userInfo:nil repeats:YES];
    
}
//定时器中设置slider的进度
-(void)timerHandle
{
    RadioPlayManager *manager = [RadioPlayManager defaultManager];
    
    //初始化slider大小
    
    _palyInfoView.progressSlider.maximumValue = manager.totalTime;
    
    
    _palyInfoView.progressSlider.value = manager.currentTime;
    // 显示剩余时长
    _palyInfoView.shengyuLabel.text = [NSString stringWithFormat:@"%02lld : %02lld",(int64_t)(manager.totalTime -manager.currentTime) / 60, (int64_t)(manager.totalTime - manager.currentTime) % 60];
    
    //播放完成切换 音频 并且切换UI的数据
    if (manager.currentTime == manager.totalTime && manager.totalTime!= 0) {
        [manager playerDidFinish];
        _musicIndex += 1;
        _musicIndex = _musicIndex % _radioListArray.count;
        [self loadUIWithData];
    }
}

//切换之后刷新UI
-(void)loadUIWithData{
    [_radioListTable reloadData];
    RadioDetailList *listmodel =  _radioListArray[_musicIndex];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:listmodel.playInfo.webviewUrl]]];
    _palyInfoView.listModel = listmodel;
}

//-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
//    self = [super initWithNibName:@"RadioPlayInfo" bundle:nil];
//    return self;
//}

//push过来之后初始化UI上的数据
-(void)initUI{
    _backScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 200)];
    _backScrollView.delegate = self;
    _backScrollView.contentSize = CGSizeMake(ScreenWidth*3, ScreenHeight - 200);
//    _backScrollView.showsVerticalScrollIndicator = NO;
//    _backScrollView.showsHorizontalScrollIndicator = NO;
//    _backScrollView.bounces = NO;
    _backScrollView.pagingEnabled = YES;
    
    //左侧tableView
    _radioListTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight - 200)];
    _radioListTable.delegate = self;
    _radioListTable.dataSource = self;
    _radioListTable.backgroundColor = [UIColor blueColor];
    [_backScrollView addSubview:_radioListTable];
    
    //当中信息View
    _palyInfoView = [[NSBundle mainBundle]loadNibNamed:@"RadioPlayInfoView" owner:nil options:nil][0];
    _palyInfoView.frame = CGRectMake(ScreenWidth, 64, ScreenWidth, ScreenHeight-200);
    _palyInfoView.listModel = _radioListArray[_musicIndex];
    [_backScrollView addSubview:_palyInfoView];
    
    //右侧webView
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(ScreenWidth*2, 0, ScreenWidth, ScreenHeight-200)];
    _webView.backgroundColor = [UIColor redColor];
    RadioDetailList *listmodel =  _radioListArray[_musicIndex];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:listmodel.playInfo.webviewUrl]]];
    [_backScrollView addSubview:_webView];
    
    [self.view addSubview:_backScrollView];
    
    _backScrollView.contentOffset = CGPointMake(ScreenWidth, 0);
    
    _palyMenuView = [[NSBundle mainBundle]loadNibNamed:@"RadioPlayMenuView" owner:nil options:nil][0];
    
    WEAKSELF
    _palyMenuView.changeblock = ^(NSInteger state){
        if (state == 1) {
            //上一首
            _musicIndex -= 1;
            if (_musicIndex <0) {
                _musicIndex = _radioListArray.count -1;
            }
            RadioPlayManager *manager = [RadioPlayManager defaultManager];
            [manager changeMusicWithIndex:weakSelf.musicIndex];
            
            
            
            [weakSelf loadUIWithData];
        }else if(state == 2){
            //暂停
            RadioPlayManager *manager = [RadioPlayManager defaultManager];
            if (manager.isPlay) {
                [manager pause];
            }
            else{
                [manager play];
            }
        }else{
            //下一首
            _musicIndex += 1;
            _musicIndex = _musicIndex % _radioListArray.count;
            
            
            RadioPlayManager *manager = [RadioPlayManager defaultManager];
            [manager changeMusicWithIndex:weakSelf.musicIndex];
            
            [weakSelf loadUIWithData];
        }
    };
    
    _palyMenuView.frame = CGRectMake(100, ScreenHeight - 200, ScreenWidth, 200);
    [self.view addSubview:_palyMenuView];
    
}

#pragma mark - UITableViewDelegate DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _radioListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    static NSString *cellIdentifier = @"RadioPlayCell";
    RadioPlayCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"RadioPlayCell" owner:nil options:nil];
        cell = [array objectAtIndex:0];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    RadioDetailList *listmodel = _radioListArray[indexPath.row];
    cell.listModel = listmodel;
    
    if (_musicIndex == indexPath.row) {
        cell.greenView.hidden = NO;
    }else{
        cell.greenView.hidden = YES;
    }
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _flag=100;
    self.musicIndex = indexPath.row;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self loadUIWithData];
}

#pragma mark - musicIndex

-(void)setMusicIndex:(NSInteger)musicIndex{
    if (_musicIndex!= musicIndex) {
        
        if (_flag==100) {
            //选择不同的话进行播放
            RadioPlayManager *manager = [RadioPlayManager defaultManager];
            [manager changeMusicWithIndex:musicIndex];
        }
        
        
        RadioPlayCell *cell1 = [_radioListTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:_musicIndex inSection:0]];
        cell1.greenView.hidden = YES;
        
        RadioPlayCell *cell2 = [_radioListTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:musicIndex inSection:0]];
        cell2.greenView.hidden = NO;
        _musicIndex = musicIndex;
    }
    
}



#pragma mark -UIScrollView代理方法-

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    if (scrollView == _backScrollView) {
//        NSInteger num = (scrollView.contentOffset.x / scrollView.frame.size.width);
//        [_palyMenuView changeTypeView:num];
//    }
    NSInteger num = (_backScrollView.contentOffset.x / _backScrollView.frame.size.width);
    [_palyMenuView changeTypeView:num];
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
