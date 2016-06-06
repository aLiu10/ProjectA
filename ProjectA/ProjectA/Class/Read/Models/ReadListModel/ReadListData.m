//
//  ReadListData.m
//
//  Created by lanou  on 16/5/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadListData.h"
#import "ReadListCarousel.h"
#import "ReadListList.h"


NSString *const kReadListDataCarousel = @"carousel";
NSString *const kReadListDataList = @"list";


@interface ReadListData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadListData

@synthesize carousel = _carousel;
@synthesize list = _list;


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
    NSObject *receivedReadListCarousel = [dict objectForKey:kReadListDataCarousel];
    NSMutableArray *parsedReadListCarousel = [NSMutableArray array];
    if ([receivedReadListCarousel isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedReadListCarousel) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedReadListCarousel addObject:[ReadListCarousel modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedReadListCarousel isKindOfClass:[NSDictionary class]]) {
       [parsedReadListCarousel addObject:[ReadListCarousel modelObjectWithDictionary:(NSDictionary *)receivedReadListCarousel]];
    }

    self.carousel = [NSArray arrayWithArray:parsedReadListCarousel];
    NSObject *receivedReadListList = [dict objectForKey:kReadListDataList];
    NSMutableArray *parsedReadListList = [NSMutableArray array];
    if ([receivedReadListList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedReadListList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedReadListList addObject:[ReadListList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedReadListList isKindOfClass:[NSDictionary class]]) {
       [parsedReadListList addObject:[ReadListList modelObjectWithDictionary:(NSDictionary *)receivedReadListList]];
    }

    self.list = [NSArray arrayWithArray:parsedReadListList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCarousel] forKey:kReadListDataCarousel];
    NSMutableArray *tempArrayForList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.list) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kReadListDataList];

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

    self.carousel = [aDecoder decodeObjectForKey:kReadListDataCarousel];
    self.list = [aDecoder decodeObjectForKey:kReadListDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_carousel forKey:kReadListDataCarousel];
    [aCoder encodeObject:_list forKey:kReadListDataList];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadListData *copy = [[ReadListData alloc] init];
    
    if (copy) {

        copy.carousel = [self.carousel copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
