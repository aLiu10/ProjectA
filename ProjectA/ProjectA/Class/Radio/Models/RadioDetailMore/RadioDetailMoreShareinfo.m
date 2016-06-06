//
//  RadioDetailMoreShareinfo.m
//
//  Created by lanou  on 16/6/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioDetailMoreShareinfo.h"


NSString *const kRadioDetailMoreShareinfoTitle = @"title";
NSString *const kRadioDetailMoreShareinfoPic = @"pic";
NSString *const kRadioDetailMoreShareinfoUrl = @"url";
NSString *const kRadioDetailMoreShareinfoText = @"text";


@interface RadioDetailMoreShareinfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioDetailMoreShareinfo

@synthesize title = _title;
@synthesize pic = _pic;
@synthesize url = _url;
@synthesize text = _text;


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
            self.title = [self objectOrNilForKey:kRadioDetailMoreShareinfoTitle fromDictionary:dict];
            self.pic = [self objectOrNilForKey:kRadioDetailMoreShareinfoPic fromDictionary:dict];
            self.url = [self objectOrNilForKey:kRadioDetailMoreShareinfoUrl fromDictionary:dict];
            self.text = [self objectOrNilForKey:kRadioDetailMoreShareinfoText fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kRadioDetailMoreShareinfoTitle];
    [mutableDict setValue:self.pic forKey:kRadioDetailMoreShareinfoPic];
    [mutableDict setValue:self.url forKey:kRadioDetailMoreShareinfoUrl];
    [mutableDict setValue:self.text forKey:kRadioDetailMoreShareinfoText];

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

    self.title = [aDecoder decodeObjectForKey:kRadioDetailMoreShareinfoTitle];
    self.pic = [aDecoder decodeObjectForKey:kRadioDetailMoreShareinfoPic];
    self.url = [aDecoder decodeObjectForKey:kRadioDetailMoreShareinfoUrl];
    self.text = [aDecoder decodeObjectForKey:kRadioDetailMoreShareinfoText];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kRadioDetailMoreShareinfoTitle];
    [aCoder encodeObject:_pic forKey:kRadioDetailMoreShareinfoPic];
    [aCoder encodeObject:_url forKey:kRadioDetailMoreShareinfoUrl];
    [aCoder encodeObject:_text forKey:kRadioDetailMoreShareinfoText];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioDetailMoreShareinfo *copy = [[RadioDetailMoreShareinfo alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.pic = [self.pic copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
    }
    
    return copy;
}


@end
