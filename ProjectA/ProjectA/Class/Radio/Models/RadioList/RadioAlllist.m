//
//  RadioAlllist.m
//
//  Created by lanou  on 16/5/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioAlllist.h"
#import "RadioUserinfo.h"


NSString *const kRadioAlllistCoverimg = @"coverimg";
NSString *const kRadioAlllistIsnew = @"isnew";
NSString *const kRadioAlllistUserinfo = @"userinfo";
NSString *const kRadioAlllistTitle = @"title";
NSString *const kRadioAlllistCount = @"count";
NSString *const kRadioAlllistDesc = @"desc";
NSString *const kRadioAlllistRadioid = @"radioid";


@interface RadioAlllist ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioAlllist

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
            self.coverimg = [self objectOrNilForKey:kRadioAlllistCoverimg fromDictionary:dict];
            self.isnew = [[self objectOrNilForKey:kRadioAlllistIsnew fromDictionary:dict] boolValue];
            self.userinfo = [RadioUserinfo modelObjectWithDictionary:[dict objectForKey:kRadioAlllistUserinfo]];
            self.title = [self objectOrNilForKey:kRadioAlllistTitle fromDictionary:dict];
            self.count = [[self objectOrNilForKey:kRadioAlllistCount fromDictionary:dict] doubleValue];
            self.desc = [self objectOrNilForKey:kRadioAlllistDesc fromDictionary:dict];
            self.radioid = [self objectOrNilForKey:kRadioAlllistRadioid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.coverimg forKey:kRadioAlllistCoverimg];
    [mutableDict setValue:[NSNumber numberWithBool:self.isnew] forKey:kRadioAlllistIsnew];
    [mutableDict setValue:[self.userinfo dictionaryRepresentation] forKey:kRadioAlllistUserinfo];
    [mutableDict setValue:self.title forKey:kRadioAlllistTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kRadioAlllistCount];
    [mutableDict setValue:self.desc forKey:kRadioAlllistDesc];
    [mutableDict setValue:self.radioid forKey:kRadioAlllistRadioid];

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

    self.coverimg = [aDecoder decodeObjectForKey:kRadioAlllistCoverimg];
    self.isnew = [aDecoder decodeBoolForKey:kRadioAlllistIsnew];
    self.userinfo = [aDecoder decodeObjectForKey:kRadioAlllistUserinfo];
    self.title = [aDecoder decodeObjectForKey:kRadioAlllistTitle];
    self.count = [aDecoder decodeDoubleForKey:kRadioAlllistCount];
    self.desc = [aDecoder decodeObjectForKey:kRadioAlllistDesc];
    self.radioid = [aDecoder decodeObjectForKey:kRadioAlllistRadioid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_coverimg forKey:kRadioAlllistCoverimg];
    [aCoder encodeBool:_isnew forKey:kRadioAlllistIsnew];
    [aCoder encodeObject:_userinfo forKey:kRadioAlllistUserinfo];
    [aCoder encodeObject:_title forKey:kRadioAlllistTitle];
    [aCoder encodeDouble:_count forKey:kRadioAlllistCount];
    [aCoder encodeObject:_desc forKey:kRadioAlllistDesc];
    [aCoder encodeObject:_radioid forKey:kRadioAlllistRadioid];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioAlllist *copy = [[RadioAlllist alloc] init];
    
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
