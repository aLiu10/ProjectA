//
//  ReadInfoCounterList.h
//
//  Created by lanou  on 16/6/1
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ReadInfoCounterList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double comment;
@property (nonatomic, assign) double like;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
