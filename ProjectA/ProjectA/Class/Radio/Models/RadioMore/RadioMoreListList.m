//
//  RadioMoreListList.m
//
//  Created by lanou  on 16/6/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioMoreListList.h"
#import "RadioMoreListUserinfo.h"


NSString *const kRadioMoreListListDesc = @"desc";
NSString *const kRadioMoreListListIsnew = @"isnew";
NSString *const kRadioMoreListListUserinfo = @"userinfo";
NSString *const kRadioMoreListListTitle = @"title";
NSString *const kRadioMoreListListCount = @"count";
NSString *const kRadioMoreListListCoverimg = @"coverimg";
NSString *const kRadioMoreListListRadioid = @"radioid";


@interface RadioMoreListList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioMoreListList

@synthesize desc = _desc;
@synthesize isnew = _isnew;
@synthesize userinfo = _userinfo;
@synthesize title = _title;
@synthesize count = _count;
@synthesize coverimg = _coverimg;
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
            self.desc = [self objectOrNilForKey:kRadioMoreListListDesc fromDictionary:dict];
            self.isnew = [[self objectOrNilForKey:kRadioMoreListListIsnew fromDictionary:dict] boolValue];
            self.userinfo = [RadioMoreListUserinfo modelObjectWithDictionary:[dict objectForKey:kRadioMoreListListUserinfo]];
            self.title = [self objectOrNilForKey:kRadioMoreListListTitle fromDictionary:dict];
            self.count = [[self objectOrNilForKey:kRadioMoreListListCount fromDictionary:dict] doubleValue];
            self.coverimg = [self objectOrNilForKey:kRadioMoreListListCoverimg fromDictionary:dict];
            self.radioid = [self objectOrNilForKey:kRadioMoreListListRadioid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.desc forKey:kRadioMoreListListDesc];
    [mutableDict setValue:[NSNumber numberWithBool:self.isnew] forKey:kRadioMoreListListIsnew];
    [mutableDict setValue:[self.userinfo dictionaryRepresentation] forKey:kRadioMoreListListUserinfo];
    [mutableDict setValue:self.title forKey:kRadioMoreListListTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kRadioMoreListListCount];
    [mutableDict setValue:self.coverimg forKey:kRadioMoreListListCoverimg];
    [mutableDict setValue:self.radioid forKey:kRadioMoreListListRadioid];

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

    self.desc = [aDecoder decodeObjectForKey:kRadioMoreListListDesc];
    self.isnew = [aDecoder decodeBoolForKey:kRadioMoreListListIsnew];
    self.userinfo = [aDecoder decodeObjectForKey:kRadioMoreListListUserinfo];
    self.title = [aDecoder decodeObjectForKey:kRadioMoreListListTitle];
    self.count = [aDecoder decodeDoubleForKey:kRadioMoreListListCount];
    self.coverimg = [aDecoder decodeObjectForKey:kRadioMoreListListCoverimg];
    self.radioid = [aDecoder decodeObjectForKey:kRadioMoreListListRadioid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_desc forKey:kRadioMoreListListDesc];
    [aCoder encodeBool:_isnew forKey:kRadioMoreListListIsnew];
    [aCoder encodeObject:_userinfo forKey:kRadioMoreListListUserinfo];
    [aCoder encodeObject:_title forKey:kRadioMoreListListTitle];
    [aCoder encodeDouble:_count forKey:kRadioMoreListListCount];
    [aCoder encodeObject:_coverimg forKey:kRadioMoreListListCoverimg];
    [aCoder encodeObject:_radioid forKey:kRadioMoreListListRadioid];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioMoreListList *copy = [[RadioMoreListList alloc] init];
    
    if (copy) {

        copy.desc = [self.desc copyWithZone:zone];
        copy.isnew = self.isnew;
        copy.userinfo = [self.userinfo copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.count = self.count;
        copy.coverimg = [self.coverimg copyWithZone:zone];
        copy.radioid = [self.radioid copyWithZone:zone];
    }
    
    return copy;
}


@end
