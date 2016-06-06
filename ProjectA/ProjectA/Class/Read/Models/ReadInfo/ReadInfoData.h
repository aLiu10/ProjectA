//
//  ReadInfoData.h
//
//  Created by lanou  on 16/6/1
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ReadInfoUserinfo, ReadInfoCounterList, ReadInfoTingInfo, ReadInfoTopicInfo, ReadInfoShareinfo;

@interface ReadInfoData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *songid;
@property (nonatomic, strong) NSString *html;
@property (nonatomic, strong) NSString *typename;
@property (nonatomic, strong) ReadInfoUserinfo *userinfo;
@property (nonatomic, strong) ReadInfoCounterList *counterList;
@property (nonatomic, assign) BOOL isfav;
@property (nonatomic, strong) NSArray *imglist;
@property (nonatomic, strong) ReadInfoTingInfo *tingInfo;
@property (nonatomic, strong) ReadInfoTopicInfo *topicInfo;
@property (nonatomic, strong) NSString *contentid;
@property (nonatomic, strong) ReadInfoShareinfo *shareinfo;
@property (nonatomic, assign) BOOL islike;
@property (nonatomic, assign) double typeid;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
