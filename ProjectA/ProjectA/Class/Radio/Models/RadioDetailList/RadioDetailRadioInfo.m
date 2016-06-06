//
//  RadioDetailRadioInfo.m
//
//  Created by lanou  on 16/5/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioDetailRadioInfo.h"
#import "RadioDetailUserinfo.h"


NSString *const kRadioDetailRadioInfoUserinfo = @"userinfo";
NSString *const kRadioDetailRadioInfoMusicvisitnum = @"musicvisitnum";
NSString *const kRadioDetailRadioInfoTitle = @"title";
NSString *const kRadioDetailRadioInfoRadioid = @"radioid";
NSString *const kRadioDetailRadioInfoDesc = @"desc";
NSString *const kRadioDetailRadioInfoCoverimg = @"coverimg";


@interface RadioDetailRadioInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioDetailRadioInfo

@synthesize userinfo = _userinfo;
@synthesize musicvisitnum = _musicvisitnum;
@synthesize title = _title;
@synthesize radioid = _radioid;
@synthesize desc = _desc;
@synthesize coverimg = _coverimg;


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
            self.userinfo = [RadioDetailUserinfo modelObjectWithDictionary:[dict objectForKey:kRadioDetailRadioInfoUserinfo]];
            self.musicvisitnum = [[self objectOrNilForKey:kRadioDetailRadioInfoMusicvisitnum fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kRadioDetailRadioInfoTitle fromDictionary:dict];
            self.radioid = [self objectOrNilForKey:kRadioDetailRadioInfoRadioid fromDictionary:dict];
            self.desc = [self objectOrNilForKey:kRadioDetailRadioInfoDesc fromDictionary:dict];
            self.coverimg = [self objectOrNilForKey:kRadioDetailRadioInfoCoverimg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.userinfo dictionaryRepresentation] forKey:kRadioDetailRadioInfoUserinfo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.musicvisitnum] forKey:kRadioDetailRadioInfoMusicvisitnum];
    [mutableDict setValue:self.title forKey:kRadioDetailRadioInfoTitle];
    [mutableDict setValue:self.radioid forKey:kRadioDetailRadioInfoRadioid];
    [mutableDict setValue:self.desc forKey:kRadioDetailRadioInfoDesc];
    [mutableDict setValue:self.coverimg forKey:kRadioDetailRadioInfoCoverimg];

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

    self.userinfo = [aDecoder decodeObjectForKey:kRadioDetailRadioInfoUserinfo];
    self.musicvisitnum = [aDecoder decodeDoubleForKey:kRadioDetailRadioInfoMusicvisitnum];
    self.title = [aDecoder decodeObjectForKey:kRadioDetailRadioInfoTitle];
    self.radioid = [aDecoder decodeObjectForKey:kRadioDetailRadioInfoRadioid];
    self.desc = [aDecoder decodeObjectForKey:kRadioDetailRadioInfoDesc];
    self.coverimg = [aDecoder decodeObjectForKey:kRadioDetailRadioInfoCoverimg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_userinfo forKey:kRadioDetailRadioInfoUserinfo];
    [aCoder encodeDouble:_musicvisitnum forKey:kRadioDetailRadioInfoMusicvisitnum];
    [aCoder encodeObject:_title forKey:kRadioDetailRadioInfoTitle];
    [aCoder encodeObject:_radioid forKey:kRadioDetailRadioInfoRadioid];
    [aCoder encodeObject:_desc forKey:kRadioDetailRadioInfoDesc];
    [aCoder encodeObject:_coverimg forKey:kRadioDetailRadioInfoCoverimg];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioDetailRadioInfo *copy = [[RadioDetailRadioInfo alloc] init];
    
    if (copy) {

        copy.userinfo = [self.userinfo copyWithZone:zone];
        copy.musicvisitnum = self.musicvisitnum;
        copy.title = [self.title copyWithZone:zone];
        copy.radioid = [self.radioid copyWithZone:zone];
        copy.desc = [self.desc copyWithZone:zone];
        copy.coverimg = [self.coverimg copyWithZone:zone];
    }
    
    return copy;
}


@end
