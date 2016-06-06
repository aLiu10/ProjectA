//
//  RadioDetailMoreList.m
//
//  Created by lanou  on 16/6/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioDetailMoreList.h"
#import "RadioDetailMorePlayInfo.h"


NSString *const kRadioDetailMoreListTingid = @"tingid";
NSString *const kRadioDetailMoreListIsnew = @"isnew";
NSString *const kRadioDetailMoreListMusicUrl = @"musicUrl";
NSString *const kRadioDetailMoreListMusicVisit = @"musicVisit";
NSString *const kRadioDetailMoreListTitle = @"title";
NSString *const kRadioDetailMoreListPlayInfo = @"playInfo";
NSString *const kRadioDetailMoreListCoverimg = @"coverimg";


@interface RadioDetailMoreList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioDetailMoreList

@synthesize tingid = _tingid;
@synthesize isnew = _isnew;
@synthesize musicUrl = _musicUrl;
@synthesize musicVisit = _musicVisit;
@synthesize title = _title;
@synthesize playInfo = _playInfo;
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
            self.tingid = [self objectOrNilForKey:kRadioDetailMoreListTingid fromDictionary:dict];
            self.isnew = [[self objectOrNilForKey:kRadioDetailMoreListIsnew fromDictionary:dict] boolValue];
            self.musicUrl = [self objectOrNilForKey:kRadioDetailMoreListMusicUrl fromDictionary:dict];
            self.musicVisit = [self objectOrNilForKey:kRadioDetailMoreListMusicVisit fromDictionary:dict];
            self.title = [self objectOrNilForKey:kRadioDetailMoreListTitle fromDictionary:dict];
            self.playInfo = [RadioDetailMorePlayInfo modelObjectWithDictionary:[dict objectForKey:kRadioDetailMoreListPlayInfo]];
            self.coverimg = [self objectOrNilForKey:kRadioDetailMoreListCoverimg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tingid forKey:kRadioDetailMoreListTingid];
    [mutableDict setValue:[NSNumber numberWithBool:self.isnew] forKey:kRadioDetailMoreListIsnew];
    [mutableDict setValue:self.musicUrl forKey:kRadioDetailMoreListMusicUrl];
    [mutableDict setValue:self.musicVisit forKey:kRadioDetailMoreListMusicVisit];
    [mutableDict setValue:self.title forKey:kRadioDetailMoreListTitle];
    [mutableDict setValue:[self.playInfo dictionaryRepresentation] forKey:kRadioDetailMoreListPlayInfo];
    [mutableDict setValue:self.coverimg forKey:kRadioDetailMoreListCoverimg];

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

    self.tingid = [aDecoder decodeObjectForKey:kRadioDetailMoreListTingid];
    self.isnew = [aDecoder decodeBoolForKey:kRadioDetailMoreListIsnew];
    self.musicUrl = [aDecoder decodeObjectForKey:kRadioDetailMoreListMusicUrl];
    self.musicVisit = [aDecoder decodeObjectForKey:kRadioDetailMoreListMusicVisit];
    self.title = [aDecoder decodeObjectForKey:kRadioDetailMoreListTitle];
    self.playInfo = [aDecoder decodeObjectForKey:kRadioDetailMoreListPlayInfo];
    self.coverimg = [aDecoder decodeObjectForKey:kRadioDetailMoreListCoverimg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tingid forKey:kRadioDetailMoreListTingid];
    [aCoder encodeBool:_isnew forKey:kRadioDetailMoreListIsnew];
    [aCoder encodeObject:_musicUrl forKey:kRadioDetailMoreListMusicUrl];
    [aCoder encodeObject:_musicVisit forKey:kRadioDetailMoreListMusicVisit];
    [aCoder encodeObject:_title forKey:kRadioDetailMoreListTitle];
    [aCoder encodeObject:_playInfo forKey:kRadioDetailMoreListPlayInfo];
    [aCoder encodeObject:_coverimg forKey:kRadioDetailMoreListCoverimg];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioDetailMoreList *copy = [[RadioDetailMoreList alloc] init];
    
    if (copy) {

        copy.tingid = [self.tingid copyWithZone:zone];
        copy.isnew = self.isnew;
        copy.musicUrl = [self.musicUrl copyWithZone:zone];
        copy.musicVisit = [self.musicVisit copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.playInfo = [self.playInfo copyWithZone:zone];
        copy.coverimg = [self.coverimg copyWithZone:zone];
    }
    
    return copy;
}


@end
