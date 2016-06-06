//
//  RadioDetailPlayInfo.m
//
//  Created by lanou  on 16/5/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioDetailPlayInfo.h"
#import "RadioDetailUserinfo.h"
#import "RadioDetailAuthorinfo.h"
#import "RadioDetailShareinfo.h"


NSString *const kRadioDetailPlayInfoTingid = @"tingid";
NSString *const kRadioDetailPlayInfoTingContentid = @"ting_contentid";
NSString *const kRadioDetailPlayInfoSharepic = @"sharepic";
NSString *const kRadioDetailPlayInfoUserinfo = @"userinfo";
NSString *const kRadioDetailPlayInfoImgUrl = @"imgUrl";
NSString *const kRadioDetailPlayInfoMusicUrl = @"musicUrl";
NSString *const kRadioDetailPlayInfoAuthorinfo = @"authorinfo";
NSString *const kRadioDetailPlayInfoTitle = @"title";
NSString *const kRadioDetailPlayInfoSharetext = @"sharetext";
NSString *const kRadioDetailPlayInfoShareurl = @"shareurl";
NSString *const kRadioDetailPlayInfoShareinfo = @"shareinfo";
NSString *const kRadioDetailPlayInfoWebviewUrl = @"webview_url";


@interface RadioDetailPlayInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioDetailPlayInfo

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
            self.tingid = [self objectOrNilForKey:kRadioDetailPlayInfoTingid fromDictionary:dict];
            self.tingContentid = [self objectOrNilForKey:kRadioDetailPlayInfoTingContentid fromDictionary:dict];
            self.sharepic = [self objectOrNilForKey:kRadioDetailPlayInfoSharepic fromDictionary:dict];
            self.userinfo = [RadioDetailUserinfo modelObjectWithDictionary:[dict objectForKey:kRadioDetailPlayInfoUserinfo]];
            self.imgUrl = [self objectOrNilForKey:kRadioDetailPlayInfoImgUrl fromDictionary:dict];
            self.musicUrl = [self objectOrNilForKey:kRadioDetailPlayInfoMusicUrl fromDictionary:dict];
            self.authorinfo = [RadioDetailAuthorinfo modelObjectWithDictionary:[dict objectForKey:kRadioDetailPlayInfoAuthorinfo]];
            self.title = [self objectOrNilForKey:kRadioDetailPlayInfoTitle fromDictionary:dict];
            self.sharetext = [self objectOrNilForKey:kRadioDetailPlayInfoSharetext fromDictionary:dict];
            self.shareurl = [self objectOrNilForKey:kRadioDetailPlayInfoShareurl fromDictionary:dict];
            self.shareinfo = [RadioDetailShareinfo modelObjectWithDictionary:[dict objectForKey:kRadioDetailPlayInfoShareinfo]];
            self.webviewUrl = [self objectOrNilForKey:kRadioDetailPlayInfoWebviewUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tingid forKey:kRadioDetailPlayInfoTingid];
    [mutableDict setValue:self.tingContentid forKey:kRadioDetailPlayInfoTingContentid];
    [mutableDict setValue:self.sharepic forKey:kRadioDetailPlayInfoSharepic];
    [mutableDict setValue:[self.userinfo dictionaryRepresentation] forKey:kRadioDetailPlayInfoUserinfo];
    [mutableDict setValue:self.imgUrl forKey:kRadioDetailPlayInfoImgUrl];
    [mutableDict setValue:self.musicUrl forKey:kRadioDetailPlayInfoMusicUrl];
    [mutableDict setValue:[self.authorinfo dictionaryRepresentation] forKey:kRadioDetailPlayInfoAuthorinfo];
    [mutableDict setValue:self.title forKey:kRadioDetailPlayInfoTitle];
    [mutableDict setValue:self.sharetext forKey:kRadioDetailPlayInfoSharetext];
    [mutableDict setValue:self.shareurl forKey:kRadioDetailPlayInfoShareurl];
    [mutableDict setValue:[self.shareinfo dictionaryRepresentation] forKey:kRadioDetailPlayInfoShareinfo];
    [mutableDict setValue:self.webviewUrl forKey:kRadioDetailPlayInfoWebviewUrl];

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

    self.tingid = [aDecoder decodeObjectForKey:kRadioDetailPlayInfoTingid];
    self.tingContentid = [aDecoder decodeObjectForKey:kRadioDetailPlayInfoTingContentid];
    self.sharepic = [aDecoder decodeObjectForKey:kRadioDetailPlayInfoSharepic];
    self.userinfo = [aDecoder decodeObjectForKey:kRadioDetailPlayInfoUserinfo];
    self.imgUrl = [aDecoder decodeObjectForKey:kRadioDetailPlayInfoImgUrl];
    self.musicUrl = [aDecoder decodeObjectForKey:kRadioDetailPlayInfoMusicUrl];
    self.authorinfo = [aDecoder decodeObjectForKey:kRadioDetailPlayInfoAuthorinfo];
    self.title = [aDecoder decodeObjectForKey:kRadioDetailPlayInfoTitle];
    self.sharetext = [aDecoder decodeObjectForKey:kRadioDetailPlayInfoSharetext];
    self.shareurl = [aDecoder decodeObjectForKey:kRadioDetailPlayInfoShareurl];
    self.shareinfo = [aDecoder decodeObjectForKey:kRadioDetailPlayInfoShareinfo];
    self.webviewUrl = [aDecoder decodeObjectForKey:kRadioDetailPlayInfoWebviewUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tingid forKey:kRadioDetailPlayInfoTingid];
    [aCoder encodeObject:_tingContentid forKey:kRadioDetailPlayInfoTingContentid];
    [aCoder encodeObject:_sharepic forKey:kRadioDetailPlayInfoSharepic];
    [aCoder encodeObject:_userinfo forKey:kRadioDetailPlayInfoUserinfo];
    [aCoder encodeObject:_imgUrl forKey:kRadioDetailPlayInfoImgUrl];
    [aCoder encodeObject:_musicUrl forKey:kRadioDetailPlayInfoMusicUrl];
    [aCoder encodeObject:_authorinfo forKey:kRadioDetailPlayInfoAuthorinfo];
    [aCoder encodeObject:_title forKey:kRadioDetailPlayInfoTitle];
    [aCoder encodeObject:_sharetext forKey:kRadioDetailPlayInfoSharetext];
    [aCoder encodeObject:_shareurl forKey:kRadioDetailPlayInfoShareurl];
    [aCoder encodeObject:_shareinfo forKey:kRadioDetailPlayInfoShareinfo];
    [aCoder encodeObject:_webviewUrl forKey:kRadioDetailPlayInfoWebviewUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioDetailPlayInfo *copy = [[RadioDetailPlayInfo alloc] init];
    
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
