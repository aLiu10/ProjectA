//
//  RadioMoreListList.h
//
//  Created by lanou  on 16/6/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RadioMoreListUserinfo;

@interface RadioMoreListList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *desc;
@property (nonatomic, assign) BOOL isnew;
@property (nonatomic, strong) RadioMoreListUserinfo *userinfo;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double count;
@property (nonatomic, strong) NSString *coverimg;
@property (nonatomic, strong) NSString *radioid;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
