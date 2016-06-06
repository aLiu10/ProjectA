//
//  RadioDetailPlayInfo.h
//
//  Created by lanou  on 16/5/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RadioDetailUserinfo, RadioDetailAuthorinfo, RadioDetailShareinfo;

@interface RadioDetailPlayInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *tingid;
@property (nonatomic, strong) NSString *tingContentid;
@property (nonatomic, strong) NSString *sharepic;
@property (nonatomic, strong) RadioDetailUserinfo *userinfo;
@property (nonatomic, strong) NSString *imgUrl;
@property (nonatomic, strong) NSString *musicUrl;
@property (nonatomic, strong) RadioDetailAuthorinfo *authorinfo;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *sharetext;
@property (nonatomic, strong) NSString *shareurl;
@property (nonatomic, strong) RadioDetailShareinfo *shareinfo;
@property (nonatomic, strong) NSString *webviewUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
