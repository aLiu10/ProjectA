//
//  RadioDetailMoreAuthorinfo.h
//
//  Created by lanou  on 16/6/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RadioDetailMoreAuthorinfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double uid;
@property (nonatomic, strong) NSString *uname;
@property (nonatomic, strong) NSString *icon;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
