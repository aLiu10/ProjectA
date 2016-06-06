//
//  RadioDetailMoreUserinfo.m
//
//  Created by lanou  on 16/6/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioDetailMoreUserinfo.h"


NSString *const kRadioDetailMoreUserinfoUid = @"uid";
NSString *const kRadioDetailMoreUserinfoUname = @"uname";
NSString *const kRadioDetailMoreUserinfoIcon = @"icon";


@interface RadioDetailMoreUserinfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioDetailMoreUserinfo

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
            self.uid = [[self objectOrNilForKey:kRadioDetailMoreUserinfoUid fromDictionary:dict] doubleValue];
            self.uname = [self objectOrNilForKey:kRadioDetailMoreUserinfoUname fromDictionary:dict];
            self.icon = [self objectOrNilForKey:kRadioDetailMoreUserinfoIcon fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kRadioDetailMoreUserinfoUid];
    [mutableDict setValue:self.uname forKey:kRadioDetailMoreUserinfoUname];
    [mutableDict setValue:self.icon forKey:kRadioDetailMoreUserinfoIcon];

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

    self.uid = [aDecoder decodeDoubleForKey:kRadioDetailMoreUserinfoUid];
    self.uname = [aDecoder decodeObjectForKey:kRadioDetailMoreUserinfoUname];
    self.icon = [aDecoder decodeObjectForKey:kRadioDetailMoreUserinfoIcon];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_uid forKey:kRadioDetailMoreUserinfoUid];
    [aCoder encodeObject:_uname forKey:kRadioDetailMoreUserinfoUname];
    [aCoder encodeObject:_icon forKey:kRadioDetailMoreUserinfoIcon];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioDetailMoreUserinfo *copy = [[RadioDetailMoreUserinfo alloc] init];
    
    if (copy) {

        copy.uid = self.uid;
        copy.uname = [self.uname copyWithZone:zone];
        copy.icon = [self.icon copyWithZone:zone];
    }
    
    return copy;
}


@end
