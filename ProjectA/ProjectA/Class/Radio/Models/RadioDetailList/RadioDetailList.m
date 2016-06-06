//
//  RadioDetailList.m
//
//  Created by lanou  on 16/5/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioDetailList.h"
#import "RadioDetailPlayInfo.h"


NSString *const kRadioDetailListTingid = @"tingid";
NSString *const kRadioDetailListIsnew = @"isnew";
NSString *const kRadioDetailListMusicUrl = @"musicUrl";
NSString *const kRadioDetailListMusicVisit = @"musicVisit";
NSString *const kRadioDetailListTitle = @"title";
NSString *const kRadioDetailListPlayInfo = @"playInfo";
NSString *const kRadioDetailListCoverimg = @"coverimg";


@interface RadioDetailList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioDetailList

@synthesize tingid = _tingid;
@synthesize isnew = _isnew;
@synthesize musicUrl = _musicUrl;
@synthesize musicVisit = _musicVisit;
@synthesize title = _title;
@synthesize playInfo = _playInfo;
@synthesize coverimg = _coverimg;

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

}
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
            self.tingid = [self objectOrNilForKey:kRadioDetailListTingid fromDictionary:dict];
            self.isnew = [[self objectOrNilForKey:kRadioDetailListIsnew fromDictionary:dict] boolValue];
            self.musicUrl = [self objectOrNilForKey:kRadioDetailListMusicUrl fromDictionary:dict];
            self.musicVisit = [self objectOrNilForKey:kRadioDetailListMusicVisit fromDictionary:dict];
            self.title = [self objectOrNilForKey:kRadioDetailListTitle fromDictionary:dict];
            self.playInfo = [RadioDetailPlayInfo modelObjectWithDictionary:[dict objectForKey:kRadioDetailListPlayInfo]];
            self.coverimg = [self objectOrNilForKey:kRadioDetailListCoverimg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tingid forKey:kRadioDetailListTingid];
    [mutableDict setValue:[NSNumber numberWithBool:self.isnew] forKey:kRadioDetailListIsnew];
    [mutableDict setValue:self.musicUrl forKey:kRadioDetailListMusicUrl];
    [mutableDict setValue:self.musicVisit forKey:kRadioDetailListMusicVisit];
    [mutableDict setValue:self.title forKey:kRadioDetailListTitle];
    [mutableDict setValue:[self.playInfo dictionaryRepresentation] forKey:kRadioDetailListPlayInfo];
    [mutableDict setValue:self.coverimg forKey:kRadioDetailListCoverimg];

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

    self.tingid = [aDecoder decodeObjectForKey:kRadioDetailListTingid];
    self.isnew = [aDecoder decodeBoolForKey:kRadioDetailListIsnew];
    self.musicUrl = [aDecoder decodeObjectForKey:kRadioDetailListMusicUrl];
    self.musicVisit = [aDecoder decodeObjectForKey:kRadioDetailListMusicVisit];
    self.title = [aDecoder decodeObjectForKey:kRadioDetailListTitle];
    self.playInfo = [aDecoder decodeObjectForKey:kRadioDetailListPlayInfo];
    self.coverimg = [aDecoder decodeObjectForKey:kRadioDetailListCoverimg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tingid forKey:kRadioDetailListTingid];
    [aCoder encodeBool:_isnew forKey:kRadioDetailListIsnew];
    [aCoder encodeObject:_musicUrl forKey:kRadioDetailListMusicUrl];
    [aCoder encodeObject:_musicVisit forKey:kRadioDetailListMusicVisit];
    [aCoder encodeObject:_title forKey:kRadioDetailListTitle];
    [aCoder encodeObject:_playInfo forKey:kRadioDetailListPlayInfo];
    [aCoder encodeObject:_coverimg forKey:kRadioDetailListCoverimg];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioDetailList *copy = [[RadioDetailList alloc] init];
    
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
