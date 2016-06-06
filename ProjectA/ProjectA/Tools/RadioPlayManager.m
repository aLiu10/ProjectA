//
//  RadioPlayManager.m
//  ProjectA
//
//  Created by lanou on 16/6/6.
//  Copyright © 2016年 Aliu. All rights reserved.
//

#import "RadioPlayManager.h"

@implementation RadioPlayManager

+ (instancetype)defaultManager{
    static RadioPlayManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[RadioPlayManager alloc]init];
        
    });
    return manager;
}
-(instancetype)init{
    self = [super init];
    if (self) {
        _musicArray = [NSMutableArray array];
    }
    return  self;
}

//通过播放列表数组  初始化_avPlayer（通过AVPlayerItem来初始化）
-(void)setMusicArray:(NSMutableArray *)musicArray{
    [_musicArray removeAllObjects];
    _musicArray = musicArray;
    RadioDetailList *listmodel = _musicArray[_playIndex];
    
    
    AVPlayerItem *avPlayerItem = [[AVPlayerItem alloc]initWithURL:[NSURL URLWithString:listmodel.musicUrl]];
    if (_avPlayer) {
        //切换的时候 AVPlayer要用到AVPlayerItem来切换
        [_avPlayer replaceCurrentItemWithPlayerItem:avPlayerItem];
    }
    else{
        //初始化的时候 AVPlayer要用到AVPlayerItem来初始化
        _avPlayer = [[AVPlayer alloc]initWithPlayerItem:avPlayerItem];
    }
    
}

//当前时间
-(float)currentTime
{
    //  当前基数为零
    if (_avPlayer.currentItem.timebase == 0) {
        return 0;
    }
    return _avPlayer.currentTime.value / _avPlayer.currentTime.timescale;
    
}
//总时间
-(float)totalTime
{
    if (_avPlayer.currentItem.duration.timescale == 0) {
        return 0;
    }
    return _avPlayer.currentItem.duration.value / _avPlayer
    .currentItem.duration.timescale;
    
}

#pragma mark - 播放控制

-(void)play{
    [_avPlayer play];
    _isPlay = YES;
}

-(void)pause
{
    [_avPlayer pause];
    _isPlay = NO;
}

-(void)seekTotime:(float)time
{
    [self pause];
    CMTime newtime = _avPlayer.currentTime;
    newtime.value = newtime.timescale * time;
    [_avPlayer seekToTime:newtime];
    [self play];
}


//切歌
-(void)changeMusicWithIndex:(NSInteger)index
{
    _playIndex = index;
    RadioDetailList *listmodel = _musicArray[_playIndex];
    //AVPlayerItem 初始化 要用到一个URL
    AVPlayerItem *avPlayerItem = [[AVPlayerItem alloc]initWithURL:[NSURL URLWithString:listmodel.musicUrl]];
    [_avPlayer replaceCurrentItemWithPlayerItem:avPlayerItem];
    [self play];
}

-(void)lastMusic
{
    _playIndex --;
    if (_playIndex<0) {
        _playIndex = _musicArray.count -1;
    }
    [self changeMusicWithIndex:_playIndex];
    
}


-(void)nextMusic{
    _playIndex ++;
    _playIndex = _playIndex % _musicArray.count;
    [self changeMusicWithIndex:_playIndex];
}

-(void)playerDidFinish
{
    [self nextMusic];
    
}


@end
