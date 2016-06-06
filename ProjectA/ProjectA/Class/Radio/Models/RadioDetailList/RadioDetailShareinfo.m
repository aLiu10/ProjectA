//
//  RadioDetailShareinfo.m
//
//  Created by lanou  on 16/5/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioDetailShareinfo.h"


NSString *const kRadioDetailShareinfoTitle = @"title";
NSString *const kRadioDetailShareinfoPic = @"pic";
NSString *const kRadioDetailShareinfoUrl = @"url";
NSString *const kRadioDetailShareinfoText = @"text";


@interface RadioDetailShareinfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioDetailShareinfo

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
            self.title = [self objectOrNilForKey:kRadioDetailShareinfoTitle fromDictionary:dict];
            self.pic = [self objectOrNilForKey:kRadioDetailShareinfoPic fromDictionary:dict];
            self.url = [self objectOrNilForKey:kRadioDetailShareinfoUrl fromDictionary:dict];
            self.text = [self objectOrNilForKey:kRadioDetailShareinfoText fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kRadioDetailShareinfoTitle];
    [mutableDict setValue:self.pic forKey:kRadioDetailShareinfoPic];
    [mutableDict setValue:self.url forKey:kRadioDetailShareinfoUrl];
    [mutableDict setValue:self.text forKey:kRadioDetailShareinfoText];

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

    self.title = [aDecoder decodeObjectForKey:kRadioDetailShareinfoTitle];
    self.pic = [aDecoder decodeObjectForKey:kRadioDetailShareinfoPic];
    self.url = [aDecoder decodeObjectForKey:kRadioDetailShareinfoUrl];
    self.text = [aDecoder decodeObjectForKey:kRadioDetailShareinfoText];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kRadioDetailShareinfoTitle];
    [aCoder encodeObject:_pic forKey:kRadioDetailShareinfoPic];
    [aCoder encodeObject:_url forKey:kRadioDetailShareinfoUrl];
    [aCoder encodeObject:_text forKey:kRadioDetailShareinfoText];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioDetailShareinfo *copy = [[RadioDetailShareinfo alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.pic = [self.pic copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
    }
    
    return copy;
}


@end
