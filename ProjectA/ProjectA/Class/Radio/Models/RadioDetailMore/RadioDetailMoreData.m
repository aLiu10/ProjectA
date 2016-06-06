//
//  RadioDetailMoreData.m
//
//  Created by lanou  on 16/6/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioDetailMoreData.h"
#import "RadioDetailMoreList.h"


NSString *const kRadioDetailMoreDataTotal = @"total";
NSString *const kRadioDetailMoreDataList = @"list";


@interface RadioDetailMoreData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioDetailMoreData

@synthesize total = _total;
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
            self.total = [[self objectOrNilForKey:kRadioDetailMoreDataTotal fromDictionary:dict] doubleValue];
    NSObject *receivedRadioDetailMoreList = [dict objectForKey:kRadioDetailMoreDataList];
    NSMutableArray *parsedRadioDetailMoreList = [NSMutableArray array];
    if ([receivedRadioDetailMoreList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRadioDetailMoreList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRadioDetailMoreList addObject:[RadioDetailMoreList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRadioDetailMoreList isKindOfClass:[NSDictionary class]]) {
       [parsedRadioDetailMoreList addObject:[RadioDetailMoreList modelObjectWithDictionary:(NSDictionary *)receivedRadioDetailMoreList]];
    }

    self.list = [NSArray arrayWithArray:parsedRadioDetailMoreList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.total] forKey:kRadioDetailMoreDataTotal];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kRadioDetailMoreDataList];

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

    self.total = [aDecoder decodeDoubleForKey:kRadioDetailMoreDataTotal];
    self.list = [aDecoder decodeObjectForKey:kRadioDetailMoreDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_total forKey:kRadioDetailMoreDataTotal];
    [aCoder encodeObject:_list forKey:kRadioDetailMoreDataList];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioDetailMoreData *copy = [[RadioDetailMoreData alloc] init];
    
    if (copy) {

        copy.total = self.total;
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
