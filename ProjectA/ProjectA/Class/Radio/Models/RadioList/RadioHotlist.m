//
//  RadioHotlist.m
//
//  Created by lanou  on 16/5/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioHotlist.h"
#import "RadioUserinfo.h"


NSString *const kRadioHotlistCoverimg = @"coverimg";
NSString *const kRadioHotlistIsnew = @"isnew";
NSString *const kRadioHotlistUserinfo = @"userinfo";
NSString *const kRadioHotlistTitle = @"title";
NSString *const kRadioHotlistCount = @"count";
NSString *const kRadioHotlistDesc = @"desc";
NSString *const kRadioHotlistRadioid = @"radioid";


@interface RadioHotlist ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioHotlist

@synthesize coverimg = _coverimg;
@synthesize isnew = _isnew;
@synthesize userinfo = _userinfo;
@synthesize title = _title;
@synthesize count = _count;
@synthesize desc = _desc;
@synthesize radioid = _radioid;


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
            self.coverimg = [self objectOrNilForKey:kRadioHotlistCoverimg fromDictionary:dict];
            self.isnew = [[self objectOrNilForKey:kRadioHotlistIsnew fromDictionary:dict] boolValue];
            self.userinfo = [RadioUserinfo modelObjectWithDictionary:[dict objectForKey:kRadioHotlistUserinfo]];
            self.title = [self objectOrNilForKey:kRadioHotlistTitle fromDictionary:dict];
            self.count = [[self objectOrNilForKey:kRadioHotlistCount fromDictionary:dict] doubleValue];
            self.desc = [self objectOrNilForKey:kRadioHotlistDesc fromDictionary:dict];
            self.radioid = [self objectOrNilForKey:kRadioHotlistRadioid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.coverimg forKey:kRadioHotlistCoverimg];
    [mutableDict setValue:[NSNumber numberWithBool:self.isnew] forKey:kRadioHotlistIsnew];
    [mutableDict setValue:[self.userinfo dictionaryRepresentation] forKey:kRadioHotlistUserinfo];
    [mutableDict setValue:self.title forKey:kRadioHotlistTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kRadioHotlistCount];
    [mutableDict setValue:self.desc forKey:kRadioHotlistDesc];
    [mutableDict setValue:self.radioid forKey:kRadioHotlistRadioid];

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

    self.coverimg = [aDecoder decodeObjectForKey:kRadioHotlistCoverimg];
    self.isnew = [aDecoder decodeBoolForKey:kRadioHotlistIsnew];
    self.userinfo = [aDecoder decodeObjectForKey:kRadioHotlistUserinfo];
    self.title = [aDecoder decodeObjectForKey:kRadioHotlistTitle];
    self.count = [aDecoder decodeDoubleForKey:kRadioHotlistCount];
    self.desc = [aDecoder decodeObjectForKey:kRadioHotlistDesc];
    self.radioid = [aDecoder decodeObjectForKey:kRadioHotlistRadioid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_coverimg forKey:kRadioHotlistCoverimg];
    [aCoder encodeBool:_isnew forKey:kRadioHotlistIsnew];
    [aCoder encodeObject:_userinfo forKey:kRadioHotlistUserinfo];
    [aCoder encodeObject:_title forKey:kRadioHotlistTitle];
    [aCoder encodeDouble:_count forKey:kRadioHotlistCount];
    [aCoder encodeObject:_desc forKey:kRadioHotlistDesc];
    [aCoder encodeObject:_radioid forKey:kRadioHotlistRadioid];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioHotlist *copy = [[RadioHotlist alloc] init];
    
    if (copy) {

        copy.coverimg = [self.coverimg copyWithZone:zone];
        copy.isnew = self.isnew;
        copy.userinfo = [self.userinfo copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.count = self.count;
        copy.desc = [self.desc copyWithZone:zone];
        copy.radioid = [self.radioid copyWithZone:zone];
    }
    
    return copy;
}


@end
