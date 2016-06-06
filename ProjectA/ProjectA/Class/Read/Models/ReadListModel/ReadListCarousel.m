//
//  ReadListCarousel.m
//
//  Created by lanou  on 16/5/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadListCarousel.h"


NSString *const kReadListCarouselImg = @"img";
NSString *const kReadListCarouselUrl = @"url";


@interface ReadListCarousel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadListCarousel

@synthesize img = _img;
@synthesize url = _url;


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
            self.img = [self objectOrNilForKey:kReadListCarouselImg fromDictionary:dict];
            self.url = [self objectOrNilForKey:kReadListCarouselUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.img forKey:kReadListCarouselImg];
    [mutableDict setValue:self.url forKey:kReadListCarouselUrl];

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

    self.img = [aDecoder decodeObjectForKey:kReadListCarouselImg];
    self.url = [aDecoder decodeObjectForKey:kReadListCarouselUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_img forKey:kReadListCarouselImg];
    [aCoder encodeObject:_url forKey:kReadListCarouselUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadListCarousel *copy = [[ReadListCarousel alloc] init];
    
    if (copy) {

        copy.img = [self.img copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
    }
    
    return copy;
}


@end
