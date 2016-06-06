//
//  RadioUserinfo.m
//
//  Created by lanou  on 16/5/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioUserinfo.h"


NSString *const kRadioUserinfoUid = @"uid";
NSString *const kRadioUserinfoUname = @"uname";
NSString *const kRadioUserinfoIcon = @"icon";


@interface RadioUserinfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioUserinfo

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
            self.uid = [[self objectOrNilForKey:kRadioUserinfoUid fromDictionary:dict] doubleValue];
            self.uname = [self objectOrNilForKey:kRadioUserinfoUname fromDictionary:dict];
            self.icon = [self objectOrNilForKey:kRadioUserinfoIcon fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kRadioUserinfoUid];
    [mutableDict setValue:self.uname forKey:kRadioUserinfoUname];
    [mutableDict setValue:self.icon forKey:kRadioUserinfoIcon];

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

    self.uid = [aDecoder decodeDoubleForKey:kRadioUserinfoUid];
    self.uname = [aDecoder decodeObjectForKey:kRadioUserinfoUname];
    self.icon = [aDecoder decodeObjectForKey:kRadioUserinfoIcon];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_uid forKey:kRadioUserinfoUid];
    [aCoder encodeObject:_uname forKey:kRadioUserinfoUname];
    [aCoder encodeObject:_icon forKey:kRadioUserinfoIcon];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioUserinfo *copy = [[RadioUserinfo alloc] init];
    
    if (copy) {

        copy.uid = self.uid;
        copy.uname = [self.uname copyWithZone:zone];
        copy.icon = [self.icon copyWithZone:zone];
    }
    
    return copy;
}


@end
