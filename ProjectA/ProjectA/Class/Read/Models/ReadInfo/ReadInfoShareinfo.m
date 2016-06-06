//
//  ReadInfoShareinfo.m
//
//  Created by lanou  on 16/6/1
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadInfoShareinfo.h"


NSString *const kReadInfoShareinfoTitle = @"title";
NSString *const kReadInfoShareinfoPic = @"pic";
NSString *const kReadInfoShareinfoUrl = @"url";
NSString *const kReadInfoShareinfoText = @"text";


@interface ReadInfoShareinfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadInfoShareinfo

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
            self.title = [self objectOrNilForKey:kReadInfoShareinfoTitle fromDictionary:dict];
            self.pic = [self objectOrNilForKey:kReadInfoShareinfoPic fromDictionary:dict];
            self.url = [self objectOrNilForKey:kReadInfoShareinfoUrl fromDictionary:dict];
            self.text = [self objectOrNilForKey:kReadInfoShareinfoText fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kReadInfoShareinfoTitle];
    [mutableDict setValue:self.pic forKey:kReadInfoShareinfoPic];
    [mutableDict setValue:self.url forKey:kReadInfoShareinfoUrl];
    [mutableDict setValue:self.text forKey:kReadInfoShareinfoText];

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

    self.title = [aDecoder decodeObjectForKey:kReadInfoShareinfoTitle];
    self.pic = [aDecoder decodeObjectForKey:kReadInfoShareinfoPic];
    self.url = [aDecoder decodeObjectForKey:kReadInfoShareinfoUrl];
    self.text = [aDecoder decodeObjectForKey:kReadInfoShareinfoText];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kReadInfoShareinfoTitle];
    [aCoder encodeObject:_pic forKey:kReadInfoShareinfoPic];
    [aCoder encodeObject:_url forKey:kReadInfoShareinfoUrl];
    [aCoder encodeObject:_text forKey:kReadInfoShareinfoText];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadInfoShareinfo *copy = [[ReadInfoShareinfo alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.pic = [self.pic copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
    }
    
    return copy;
}


@end
