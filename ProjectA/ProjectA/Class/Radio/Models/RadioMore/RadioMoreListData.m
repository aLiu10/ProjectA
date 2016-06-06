//
//  RadioMoreListData.m
//
//  Created by lanou  on 16/6/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioMoreListData.h"
#import "RadioMoreListList.h"


NSString *const kRadioMoreListDataTotal = @"total";
NSString *const kRadioMoreListDataList = @"list";


@interface RadioMoreListData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioMoreListData

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
            self.total = [[self objectOrNilForKey:kRadioMoreListDataTotal fromDictionary:dict] doubleValue];
    NSObject *receivedRadioMoreListList = [dict objectForKey:kRadioMoreListDataList];
    NSMutableArray *parsedRadioMoreListList = [NSMutableArray array];
    if ([receivedRadioMoreListList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRadioMoreListList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRadioMoreListList addObject:[RadioMoreListList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRadioMoreListList isKindOfClass:[NSDictionary class]]) {
       [parsedRadioMoreListList addObject:[RadioMoreListList modelObjectWithDictionary:(NSDictionary *)receivedRadioMoreListList]];
    }

    self.list = [NSArray arrayWithArray:parsedRadioMoreListList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.total] forKey:kRadioMoreListDataTotal];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kRadioMoreListDataList];

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

    self.total = [aDecoder decodeDoubleForKey:kRadioMoreListDataTotal];
    self.list = [aDecoder decodeObjectForKey:kRadioMoreListDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_total forKey:kRadioMoreListDataTotal];
    [aCoder encodeObject:_list forKey:kRadioMoreListDataList];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioMoreListData *copy = [[RadioMoreListData alloc] init];
    
    if (copy) {

        copy.total = self.total;
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
