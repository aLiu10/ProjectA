//
//  RadioMoreListUserinfo.m
//
//  Created by lanou  on 16/6/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioMoreListUserinfo.h"


NSString *const kRadioMoreListUserinfoUid = @"uid";
NSString *const kRadioMoreListUserinfoUname = @"uname";
NSString *const kRadioMoreListUserinfoIcon = @"icon";


@interface RadioMoreListUserinfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioMoreListUserinfo

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
            self.uid = [[self objectOrNilForKey:kRadioMoreListUserinfoUid fromDictionary:dict] doubleValue];
            self.uname = [self objectOrNilForKey:kRadioMoreListUserinfoUname fromDictionary:dict];
            self.icon = [self objectOrNilForKey:kRadioMoreListUserinfoIcon fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kRadioMoreListUserinfoUid];
    [mutableDict setValue:self.uname forKey:kRadioMoreListUserinfoUname];
    [mutableDict setValue:self.icon forKey:kRadioMoreListUserinfoIcon];

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

    self.uid = [aDecoder decodeDoubleForKey:kRadioMoreListUserinfoUid];
    self.uname = [aDecoder decodeObjectForKey:kRadioMoreListUserinfoUname];
    self.icon = [aDecoder decodeObjectForKey:kRadioMoreListUserinfoIcon];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_uid forKey:kRadioMoreListUserinfoUid];
    [aCoder encodeObject:_uname forKey:kRadioMoreListUserinfoUname];
    [aCoder encodeObject:_icon forKey:kRadioMoreListUserinfoIcon];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioMoreListUserinfo *copy = [[RadioMoreListUserinfo alloc] init];
    
    if (copy) {

        copy.uid = self.uid;
        copy.uname = [self.uname copyWithZone:zone];
        copy.icon = [self.icon copyWithZone:zone];
    }
    
    return copy;
}


@end
