//
//  RadioDetailList.h
//
//  Created by lanou  on 16/5/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RadioDetailPlayInfo;

@interface RadioDetailList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *tingid;
@property (nonatomic, assign) BOOL isnew;
@property (nonatomic, strong) NSString *musicUrl;
@property (nonatomic, strong) NSString *musicVisit;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) RadioDetailPlayInfo *playInfo;
@property (nonatomic, strong) NSString *coverimg;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
