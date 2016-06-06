//
//  ReadDetailColumnsInfo.h
//
//  Created by lanou  on 16/5/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ReadDetailColumnsInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *typename;
@property (nonatomic, assign) double typeid;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
