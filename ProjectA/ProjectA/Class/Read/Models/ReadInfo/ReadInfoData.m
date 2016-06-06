//
//  ReadInfoData.m
//
//  Created by lanou  on 16/6/1
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadInfoData.h"
#import "ReadInfoUserinfo.h"
#import "ReadInfoCounterList.h"
#import "ReadInfoTingInfo.h"
#import "ReadInfoTopicInfo.h"
#import "ReadInfoShareinfo.h"


NSString *const kReadInfoDataSongid = @"songid";
NSString *const kReadInfoDataHtml = @"html";
NSString *const kReadInfoDataTypename = @"typename";
NSString *const kReadInfoDataUserinfo = @"userinfo";
NSString *const kReadInfoDataCounterList = @"counterList";
NSString *const kReadInfoDataIsfav = @"isfav";
NSString *const kReadInfoDataImglist = @"imglist";
NSString *const kReadInfoDataTingInfo = @"tingInfo";
NSString *const kReadInfoDataTopicInfo = @"topicInfo";
NSString *const kReadInfoDataContentid = @"contentid";
NSString *const kReadInfoDataShareinfo = @"shareinfo";
NSString *const kReadInfoDataIslike = @"islike";
NSString *const kReadInfoDataTypeid = @"typeid";


@interface ReadInfoData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadInfoData

@synthesize songid = _songid;
@synthesize html = _html;
@synthesize typename = _typename;
@synthesize userinfo = _userinfo;
@synthesize counterList = _counterList;
@synthesize isfav = _isfav;
@synthesize imglist = _imglist;
@synthesize tingInfo = _tingInfo;
@synthesize topicInfo = _topicInfo;
@synthesize contentid = _contentid;
@synthesize shareinfo = _shareinfo;
@synthesize islike = _islike;
@synthesize typeid = _typeid;


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
            self.songid = [self objectOrNilForKey:kReadInfoDataSongid fromDictionary:dict];
            self.html = [self objectOrNilForKey:kReadInfoDataHtml fromDictionary:dict];
            self.typename = [self objectOrNilForKey:kReadInfoDataTypename fromDictionary:dict];
            self.userinfo = [ReadInfoUserinfo modelObjectWithDictionary:[dict objectForKey:kReadInfoDataUserinfo]];
            self.counterList = [ReadInfoCounterList modelObjectWithDictionary:[dict objectForKey:kReadInfoDataCounterList]];
            self.isfav = [[self objectOrNilForKey:kReadInfoDataIsfav fromDictionary:dict] boolValue];
            self.imglist = [self objectOrNilForKey:kReadInfoDataImglist fromDictionary:dict];
            self.tingInfo = [ReadInfoTingInfo modelObjectWithDictionary:[dict objectForKey:kReadInfoDataTingInfo]];
            self.topicInfo = [ReadInfoTopicInfo modelObjectWithDictionary:[dict objectForKey:kReadInfoDataTopicInfo]];
            self.contentid = [self objectOrNilForKey:kReadInfoDataContentid fromDictionary:dict];
            self.shareinfo = [ReadInfoShareinfo modelObjectWithDictionary:[dict objectForKey:kReadInfoDataShareinfo]];
            self.islike = [[self objectOrNilForKey:kReadInfoDataIslike fromDictionary:dict] boolValue];
            self.typeid = [[self objectOrNilForKey:kReadInfoDataTypeid fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.songid forKey:kReadInfoDataSongid];
    [mutableDict setValue:self.html forKey:kReadInfoDataHtml];
    [mutableDict setValue:self.typename forKey:kReadInfoDataTypename];
    [mutableDict setValue:[self.userinfo dictionaryRepresentation] forKey:kReadInfoDataUserinfo];
    [mutableDict setValue:[self.counterList dictionaryRepresentation] forKey:kReadInfoDataCounterList];
    [mutableDict setValue:[NSNumber numberWithBool:self.isfav] forKey:kReadInfoDataIsfav];
    NSMutableArray *tempArrayForImglist = [NSMutableArray array];
    for (NSObject *subArrayObject in self.imglist) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForImglist addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForImglist addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForImglist] forKey:kReadInfoDataImglist];
    [mutableDict setValue:[self.tingInfo dictionaryRepresentation] forKey:kReadInfoDataTingInfo];
    [mutableDict setValue:[self.topicInfo dictionaryRepresentation] forKey:kReadInfoDataTopicInfo];
    [mutableDict setValue:self.contentid forKey:kReadInfoDataContentid];
    [mutableDict setValue:[self.shareinfo dictionaryRepresentation] forKey:kReadInfoDataShareinfo];
    [mutableDict setValue:[NSNumber numberWithBool:self.islike] forKey:kReadInfoDataIslike];
    [mutableDict setValue:[NSNumber numberWithDouble:self.typeid] forKey:kReadInfoDataTypeid];

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

    self.songid = [aDecoder decodeObjectForKey:kReadInfoDataSongid];
    self.html = [aDecoder decodeObjectForKey:kReadInfoDataHtml];
    self.typename = [aDecoder decodeObjectForKey:kReadInfoDataTypename];
    self.userinfo = [aDecoder decodeObjectForKey:kReadInfoDataUserinfo];
    self.counterList = [aDecoder decodeObjectForKey:kReadInfoDataCounterList];
    self.isfav = [aDecoder decodeBoolForKey:kReadInfoDataIsfav];
    self.imglist = [aDecoder decodeObjectForKey:kReadInfoDataImglist];
    self.tingInfo = [aDecoder decodeObjectForKey:kReadInfoDataTingInfo];
    self.topicInfo = [aDecoder decodeObjectForKey:kReadInfoDataTopicInfo];
    self.contentid = [aDecoder decodeObjectForKey:kReadInfoDataContentid];
    self.shareinfo = [aDecoder decodeObjectForKey:kReadInfoDataShareinfo];
    self.islike = [aDecoder decodeBoolForKey:kReadInfoDataIslike];
    self.typeid = [aDecoder decodeDoubleForKey:kReadInfoDataTypeid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_songid forKey:kReadInfoDataSongid];
    [aCoder encodeObject:_html forKey:kReadInfoDataHtml];
    [aCoder encodeObject:_typename forKey:kReadInfoDataTypename];
    [aCoder encodeObject:_userinfo forKey:kReadInfoDataUserinfo];
    [aCoder encodeObject:_counterList forKey:kReadInfoDataCounterList];
    [aCoder encodeBool:_isfav forKey:kReadInfoDataIsfav];
    [aCoder encodeObject:_imglist forKey:kReadInfoDataImglist];
    [aCoder encodeObject:_tingInfo forKey:kReadInfoDataTingInfo];
    [aCoder encodeObject:_topicInfo forKey:kReadInfoDataTopicInfo];
    [aCoder encodeObject:_contentid forKey:kReadInfoDataContentid];
    [aCoder encodeObject:_shareinfo forKey:kReadInfoDataShareinfo];
    [aCoder encodeBool:_islike forKey:kReadInfoDataIslike];
    [aCoder encodeDouble:_typeid forKey:kReadInfoDataTypeid];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadInfoData *copy = [[ReadInfoData alloc] init];
    
    if (copy) {

        copy.songid = [self.songid copyWithZone:zone];
        copy.html = [self.html copyWithZone:zone];
        copy.typename = [self.typename copyWithZone:zone];
        copy.userinfo = [self.userinfo copyWithZone:zone];
        copy.counterList = [self.counterList copyWithZone:zone];
        copy.isfav = self.isfav;
        copy.imglist = [self.imglist copyWithZone:zone];
        copy.tingInfo = [self.tingInfo copyWithZone:zone];
        copy.topicInfo = [self.topicInfo copyWithZone:zone];
        copy.contentid = [self.contentid copyWithZone:zone];
        copy.shareinfo = [self.shareinfo copyWithZone:zone];
        copy.islike = self.islike;
        copy.typeid = self.typeid;
    }
    
    return copy;
}


@end
