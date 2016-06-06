//
//  RadioDetailUserinfo.m
//
//  Created by lanou  on 16/5/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioDetailUserinfo.h"


NSString *const kRadioDetailUserinfoUid = @"uid";
NSString *const kRadioDetailUserinfoUname = @"uname";
NSString *const kRadioDetailUserinfoIcon = @"icon";


@interface RadioDetailUserinfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioDetailUserinfo

@synthesize uid = _uid;
@synthesize uname = _uname;
@synthesize icon = _icon;


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
            self.uid = [[self objectOrNilForKey:kRadioDetailUserinfoUid fromDictionary:dict] doubleValue];
            self.uname = [self objectOrNilForKey:kRadioDetailUserinfoUname fromDictionary:dict];
            self.icon = [self objectOrNilForKey:kRadioDetailUserinfoIcon fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kRadioDetailUserinfoUid];
    [mutableDict setValue:self.uname forKey:kRadioDetailUserinfoUname];
    [mutableDict setValue:self.icon forKey:kRadioDetailUserinfoIcon];

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

    self.uid = [aDecoder decodeDoubleForKey:kRadioDetailUserinfoUid];
    self.uname = [aDecoder decodeObjectForKey:kRadioDetailUserinfoUname];
    self.icon = [aDecoder decodeObjectForKey:kRadioDetailUserinfoIcon];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_uid forKey:kRadioDetailUserinfoUid];
    [aCoder encodeObject:_uname forKey:kRadioDetailUserinfoUname];
    [aCoder encodeObject:_icon forKey:kRadioDetailUserinfoIcon];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioDetailUserinfo *copy = [[RadioDetailUserinfo alloc] init];
    
    if (copy) {

        copy.uid = self.uid;
        copy.uname = [self.uname copyWithZone:zone];
        copy.icon = [self.icon copyWithZone:zone];
    }
    
    return copy;
}


@end
