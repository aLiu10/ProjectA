//
//  RadioDetailAuthorinfo.m
//
//  Created by lanou  on 16/5/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioDetailAuthorinfo.h"


NSString *const kRadioDetailAuthorinfoUid = @"uid";
NSString *const kRadioDetailAuthorinfoUname = @"uname";
NSString *const kRadioDetailAuthorinfoIcon = @"icon";


@interface RadioDetailAuthorinfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioDetailAuthorinfo

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
            self.uid = [[self objectOrNilForKey:kRadioDetailAuthorinfoUid fromDictionary:dict] doubleValue];
            self.uname = [self objectOrNilForKey:kRadioDetailAuthorinfoUname fromDictionary:dict];
            self.icon = [self objectOrNilForKey:kRadioDetailAuthorinfoIcon fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kRadioDetailAuthorinfoUid];
    [mutableDict setValue:self.uname forKey:kRadioDetailAuthorinfoUname];
    [mutableDict setValue:self.icon forKey:kRadioDetailAuthorinfoIcon];

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

    self.uid = [aDecoder decodeDoubleForKey:kRadioDetailAuthorinfoUid];
    self.uname = [aDecoder decodeObjectForKey:kRadioDetailAuthorinfoUname];
    self.icon = [aDecoder decodeObjectForKey:kRadioDetailAuthorinfoIcon];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_uid forKey:kRadioDetailAuthorinfoUid];
    [aCoder encodeObject:_uname forKey:kRadioDetailAuthorinfoUname];
    [aCoder encodeObject:_icon forKey:kRadioDetailAuthorinfoIcon];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioDetailAuthorinfo *copy = [[RadioDetailAuthorinfo alloc] init];
    
    if (copy) {

        copy.uid = self.uid;
        copy.uname = [self.uname copyWithZone:zone];
        copy.icon = [self.icon copyWithZone:zone];
    }
    
    return copy;
}


@end
