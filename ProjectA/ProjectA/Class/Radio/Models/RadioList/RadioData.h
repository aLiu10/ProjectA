//
//  RadioData.h
//
//  Created by lanou  on 16/5/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RadioData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *hotlist;
@property (nonatomic, strong) NSArray *alllist;
@property (nonatomic, strong) NSArray *carousel;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
