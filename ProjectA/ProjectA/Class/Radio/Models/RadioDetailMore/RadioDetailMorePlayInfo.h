//
//  RadioDetailMorePlayInfo.h
//
//  Created by lanou  on 16/6/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RadioDetailMoreUserinfo, RadioDetailMoreAuthorinfo, RadioDetailMoreShareinfo;

@interface RadioDetailMorePlayInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *tingid;
@property (nonatomic, strong) NSString *tingContentid;
@property (nonatomic, strong) NSString *sharepic;
@property (nonatomic, strong) RadioDetailMoreUserinfo *userinfo;
@property (nonatomic, strong) NSString *imgUrl;
@property (nonatomic, strong) NSString *musicUrl;
@property (nonatomic, strong) RadioDetailMoreAuthorinfo *authorinfo;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *sharetext;
@property (nonatomic, strong) NSString *shareurl;
@property (nonatomic, strong) RadioDetailMoreShareinfo *shareinfo;
@property (nonatomic, strong) NSString *webviewUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
