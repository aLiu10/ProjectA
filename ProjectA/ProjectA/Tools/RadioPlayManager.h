//
//  RadioPlayManager.h
//  ProjectA
//
//  Created by lanou on 16/6/6.
//  Copyright © 2016年 Aliu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "RadioDetailList.h"

@interface RadioPlayManager : NSObject

@property(nonatomic,assign) BOOL isPlay;//播放状态
@property(nonatomic,assign) NSInteger playIndex;//播放歌曲索引
@property(nonatomic,copy) NSMutableArray *musicArray;//播放列表
@property(nonatomic,assign) float currentTime;//当前时间
@property(nonatomic,assign) float totalTime;//总时间
@property(nonatomic,strong) AVPlayer *avPlayer;
+ (instancetype)defaultManager;

-(void)play;  //播放
-(void)pause; //暂停
-(void)seekTotime:(float)time; //跳到指定位置播放

-(void)lastMusic;//上一首
-(void)nextMusic;//下一首

-(void)changeMusicWithIndex:(NSInteger)index;
//切换歌曲
-(void)playerDidFinish;
//播放完成

@end
