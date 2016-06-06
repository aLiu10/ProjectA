//
//  ReadInfoUserinfo.h
//
//  Created by lanou  on 16/6/1
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ReadInfoUserinfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *icon;
@property (nonatomic, assign) double uid;
@property (nonatomic, strong) NSString *uname;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, assign) BOOL isfollow;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
