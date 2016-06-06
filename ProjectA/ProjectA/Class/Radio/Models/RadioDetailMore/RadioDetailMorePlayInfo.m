//
//  RadioDetailMorePlayInfo.m
//
//  Created by lanou  on 16/6/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioDetailMorePlayInfo.h"
#import "RadioDetailMoreUserinfo.h"
#import "RadioDetailMoreAuthorinfo.h"
#import "RadioDetailMoreShareinfo.h"


NSString *const kRadioDetailMorePlayInfoTingid = @"tingid";
NSString *const kRadioDetailMorePlayInfoTingContentid = @"ting_contentid";
NSString *const kRadioDetailMorePlayInfoSharepic = @"sharepic";
NSString *const kRadioDetailMorePlayInfoUserinfo = @"userinfo";
NSString *const kRadioDetailMorePlayInfoImgUrl = @"imgUrl";
NSString *const kRadioDetailMorePlayInfoMusicUrl = @"musicUrl";
NSString *const kRadioDetailMorePlayInfoAuthorinfo = @"authorinfo";
NSString *const kRadioDetailMorePlayInfoTitle = @"title";
NSString *const kRadioDetailMorePlayInfoSharetext = @"sharetext";
NSString *const kRadioDetailMorePlayInfoShareurl = @"shareurl";
NSString *const kRadioDetailMorePlayInfoShareinfo = @"shareinfo";
NSString *const kRadioDetailMorePlayInfoWebviewUrl = @"webview_url";


@interface RadioDetailMorePlayInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioDetailMorePlayInfo

@synthesize tingid = _tingid;
@synthesize tingContentid = _tingContentid;
@synthesize sharepic = _sharepic;
@synthesize userinfo = _userinfo;
@synthesize imgUrl = _imgUrl;
@synthesize musicUrl = _musicUrl;
@synthesize authorinfo = _authorinfo;
@synthesize title = _title;
@synthesize sharetext = _sharetext;
@synthesize shareurl = _shareurl;
@synthesize shareinfo = _shareinfo;
@synthesize webviewUrl = _webviewUrl;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.tingid = [self objectOrNilForKey:kRadioDetailMorePlayInfoTingid fromDictionary:dict];
            self.tingContentid = [self objectOrNilForKey:kRadioDetailMorePlayInfoTingContentid fromDictionary:dict];
            self.sharepic = [self objectOrNilForKey:kRadioDetailMorePlayInfoSharepic fromDictionary:dict];
            self.userinfo = [RadioDetailMoreUserinfo modelObjectWithDictionary:[dict objectForKey:kRadioDetailMorePlayInfoUserinfo]];
            self.imgUrl = [self objectOrNilForKey:kRadioDetailMorePlayInfoImgUrl fromDictionary:dict];
            self.musicUrl = [self objectOrNilForKey:kRadioDetailMorePlayInfoMusicUrl fromDictionary:dict];
            self.authorinfo = [RadioDetailMoreAuthorinfo modelObjectWithDictionary:[dict objectForKey:kRadioDetailMorePlayInfoAuthorinfo]];
            self.title = [self objectOrNilForKey:kRadioDetailMorePlayInfoTitle fromDictionary:dict];
            self.sharetext = [self objectOrNilForKey:kRadioDetailMorePlayInfoSharetext fromDictionary:dict];
            self.shareurl = [self objectOrNilForKey:kRadioDetailMorePlayInfoShareurl fromDictionary:dict];
            self.shareinfo = [RadioDetailMoreShareinfo modelObjectWithDictionary:[dict objectForKey:kRadioDetailMorePlayInfoShareinfo]];
            self.webviewUrl = [self objectOrNilForKey:kRadioDetailMorePlayInfoWebviewUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tingid forKey:kRadioDetailMorePlayInfoTingid];
    [mutableDict setValue:self.tingContentid forKey:kRadioDetailMorePlayInfoTingContentid];
    [mutableDict setValue:self.sharepic forKey:kRadioDetailMorePlayInfoSharepic];
    [mutableDict setValue:[self.userinfo dictionaryRepresentation] forKey:kRadioDetailMorePlayInfoUserinfo];
    [mutableDict setValue:self.imgUrl forKey:kRadioDetailMorePlayInfoImgUrl];
    [mutableDict setValue:self.musicUrl forKey:kRadioDetailMorePlayInfoMusicUrl];
    [mutableDict setValue:[self.authorinfo dictionaryRepresentation] forKey:kRadioDetailMorePlayInfoAuthorinfo];
    [mutableDict setValue:self.title forKey:kRadioDetailMorePlayInfoTitle];
    [mutableDict setValue:self.sharetext forKey:kRadioDetailMorePlayInfoSharetext];
    [mutableDict setValue:self.shareurl forKey:kRadioDetailMorePlayInfoShareurl];
    [mutableDict setValue:[self.shareinfo dictionaryRepresentation] forKey:kRadioDetailMorePlayInfoShareinfo];
    [mutableDict setValue:self.webviewUrl forKey:kRadioDetailMorePlayInfoWebviewUrl];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.tingid = [aDecoder decodeObjectForKey:kRadioDetailMorePlayInfoTingid];
    self.tingContentid = [aDecoder decodeObjectForKey:kRadioDetailMorePlayInfoTingContentid];
    self.sharepic = [aDecoder decodeObjectForKey:kRadioDetailMorePlayInfoSharepic];
    self.userinfo = [aDecoder decodeObjectForKey:kRadioDetailMorePlayInfoUserinfo];
    self.imgUrl = [aDecoder decodeObjectForKey:kRadioDetailMorePlayInfoImgUrl];
    self.musicUrl = [aDecoder decodeObjectForKey:kRadioDetailMorePlayInfoMusicUrl];
    self.authorinfo = [aDecoder decodeObjectForKey:kRadioDetailMorePlayInfoAuthorinfo];
    self.title = [aDecoder decodeObjectForKey:kRadioDetailMorePlayInfoTitle];
    self.sharetext = [aDecoder decodeObjectForKey:kRadioDetailMorePlayInfoSharetext];
    self.shareurl = [aDecoder decodeObjectForKey:kRadioDetailMorePlayInfoShareurl];
    self.shareinfo = [aDecoder decodeObjectForKey:kRadioDetailMorePlayInfoShareinfo];
    self.webviewUrl = [aDecoder decodeObjectForKey:kRadioDetailMorePlayInfoWebviewUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tingid forKey:kRadioDetailMorePlayInfoTingid];
    [aCoder encodeObject:_tingContentid forKey:kRadioDetailMorePlayInfoTingContentid];
    [aCoder encodeObject:_sharepic forKey:kRadioDetailMorePlayInfoSharepic];
    [aCoder encodeObject:_userinfo forKey:kRadioDetailMorePlayInfoUserinfo];
    [aCoder encodeObject:_imgUrl forKey:kRadioDetailMorePlayInfoImgUrl];
    [aCoder encodeObject:_musicUrl forKey:kRadioDetailMorePlayInfoMusicUrl];
    [aCoder encodeObject:_authorinfo forKey:kRadioDetailMorePlayInfoAuthorinfo];
    [aCoder encodeObject:_title forKey:kRadioDetailMorePlayInfoTitle];
    [aCoder encodeObject:_sharetext forKey:kRadioDetailMorePlayInfoSharetext];
    [aCoder encodeObject:_shareurl forKey:kRadioDetailMorePlayInfoShareurl];
    [aCoder encodeObject:_shareinfo forKey:kRadioDetailMorePlayInfoShareinfo];
    [aCoder encodeObject:_webviewUrl forKey:kRadioDetailMorePlayInfoWebviewUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioDetailMorePlayInfo *copy = [[RadioDetailMorePlayInfo alloc] init];
    
    if (copy) {

        copy.tingid = [self.tingid copyWithZone:zone];
        copy.tingContentid = [self.tingContentid copyWithZone:zone];
        copy.sharepic = [self.sharepic copyWithZone:zone];
        copy.userinfo = [self.userinfo copyWithZone:zone];
        copy.imgUrl = [self.imgUrl copyWithZone:zone];
        copy.musicUrl = [self.musicUrl copyWithZone:zone];
        copy.authorinfo = [self.authorinfo copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.sharetext = [self.sharetext copyWithZone:zone];
        copy.shareurl = [self.shareurl copyWithZone:zone];
        copy.shareinfo = [self.shareinfo copyWithZone:zone];
        copy.webviewUrl = [self.webviewUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
