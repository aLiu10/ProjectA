//
//  RadioData.m
//
//  Created by lanou  on 16/5/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioData.h"
#import "RadioHotlist.h"
#import "RadioAlllist.h"
#import "RadioCarousel.h"


NSString *const kRadioDataHotlist = @"hotlist";
NSString *const kRadioDataAlllist = @"alllist";
NSString *const kRadioDataCarousel = @"carousel";


@interface RadioData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioData

@synthesize hotlist = _hotlist;
@synthesize alllist = _alllist;
@synthesize carousel = _carousel;


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
    NSObject *receivedRadioHotlist = [dict objectForKey:kRadioDataHotlist];
    NSMutableArray *parsedRadioHotlist = [NSMutableArray array];
    if ([receivedRadioHotlist isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRadioHotlist) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRadioHotlist addObject:[RadioHotlist modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRadioHotlist isKindOfClass:[NSDictionary class]]) {
       [parsedRadioHotlist addObject:[RadioHotlist modelObjectWithDictionary:(NSDictionary *)receivedRadioHotlist]];
    }

    self.hotlist = [NSArray arrayWithArray:parsedRadioHotlist];
    NSObject *receivedRadioAlllist = [dict objectForKey:kRadioDataAlllist];
    NSMutableArray *parsedRadioAlllist = [NSMutableArray array];
    if ([receivedRadioAlllist isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRadioAlllist) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRadioAlllist addObject:[RadioAlllist modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRadioAlllist isKindOfClass:[NSDictionary class]]) {
       [parsedRadioAlllist addObject:[RadioAlllist modelObjectWithDictionary:(NSDictionary *)receivedRadioAlllist]];
    }

    self.alllist = [NSArray arrayWithArray:parsedRadioAlllist];
    NSObject *receivedRadioCarousel = [dict objectForKey:kRadioDataCarousel];
    NSMutableArray *parsedRadioCarousel = [NSMutableArray array];
    if ([receivedRadioCarousel isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRadioCarousel) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRadioCarousel addObject:[RadioCarousel modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRadioCarousel isKindOfClass:[NSDictionary class]]) {
       [parsedRadioCarousel addObject:[RadioCarousel modelObjectWithDictionary:(NSDictionary *)receivedRadioCarousel]];
    }

    self.carousel = [NSArray arrayWithArray:parsedRadioCarousel];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForHotlist = [NSMutableArray array];
    for (NSObject *subArrayObject in self.hotlist) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForHotlist addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForHotlist addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHotlist] forKey:kRadioDataHotlist];
    NSMutableArray *tempArrayForAlllist = [NSMutableArray array];
    for (NSObject *subArrayObject in self.alllist) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAlllist addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAlllist addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAlllist] forKey:kRadioDataAlllist];
    NSMutableArray *tempArrayForCarousel = [NSMutableArray array];
    for (NSObject *subArrayObject in self.carousel) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCarousel addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCarousel addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCarousel] forKey:kRadioDataCarousel];

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

    self.hotlist = [aDecoder decodeObjectForKey:kRadioDataHotlist];
    self.alllist = [aDecoder decodeObjectForKey:kRadioDataAlllist];
    self.carousel = [aDecoder decodeObjectForKey:kRadioDataCarousel];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_hotlist forKey:kRadioDataHotlist];
    [aCoder encodeObject:_alllist forKey:kRadioDataAlllist];
    [aCoder encodeObject:_carousel forKey:kRadioDataCarousel];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioData *copy = [[RadioData alloc] init];
    
    if (copy) {

        copy.hotlist = [self.hotlist copyWithZone:zone];
        copy.alllist = [self.alllist copyWithZone:zone];
        copy.carousel = [self.carousel copyWithZone:zone];
    }
    
    return copy;
}


@end
