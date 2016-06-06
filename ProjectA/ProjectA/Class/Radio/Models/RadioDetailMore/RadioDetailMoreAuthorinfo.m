//
//  RadioDetailMoreAuthorinfo.m
//
//  Created by lanou  on 16/6/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioDetailMoreAuthorinfo.h"


NSString *const kRadioDetailMoreAuthorinfoUid = @"uid";
NSString *const kRadioDetailMoreAuthorinfoUname = @"uname";
NSString *const kRadioDetailMoreAuthorinfoIcon = @"icon";


@interface RadioDetailMoreAuthorinfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioDetailMoreAuthorinfo

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
            self.uid = [[self objectOrNilForKey:kRadioDetailMoreAuthorinfoUid fromDictionary:dict] doubleValue];
            self.uname = [self objectOrNilForKey:kRadioDetailMoreAuthorinfoUname fromDictionary:dict];
            self.icon = [self objectOrNilForKey:kRadioDetailMoreAuthorinfoIcon fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kRadioDetailMoreAuthorinfoUid];
    [mutableDict setValue:self.uname forKey:kRadioDetailMoreAuthorinfoUname];
    [mutableDict setValue:self.icon forKey:kRadioDetailMoreAuthorinfoIcon];

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

    self.uid = [aDecoder decodeDoubleForKey:kRadioDetailMoreAuthorinfoUid];
    self.uname = [aDecoder decodeObjectForKey:kRadioDetailMoreAuthorinfoUname];
    self.icon = [aDecoder decodeObjectForKey:kRadioDetailMoreAuthorinfoIcon];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_uid forKey:kRadioDetailMoreAuthorinfoUid];
    [aCoder encodeObject:_uname forKey:kRadioDetailMoreAuthorinfoUname];
    [aCoder encodeObject:_icon forKey:kRadioDetailMoreAuthorinfoIcon];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioDetailMoreAuthorinfo *copy = [[RadioDetailMoreAuthorinfo alloc] init];
    
    if (copy) {

        copy.uid = self.uid;
        copy.uname = [self.uname copyWithZone:zone];
        copy.icon = [self.icon copyWithZone:zone];
    }
    
    return copy;
}


@end
