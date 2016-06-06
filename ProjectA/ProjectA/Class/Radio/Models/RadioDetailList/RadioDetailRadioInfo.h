//
//  RadioDetailRadioInfo.h
//
//  Created by lanou  on 16/5/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RadioDetailUserinfo;

@interface RadioDetailRadioInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) RadioDetailUserinfo *userinfo;
@property (nonatomic, assign) double musicvisitnum;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *radioid;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *coverimg;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
