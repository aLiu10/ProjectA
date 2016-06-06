//
//  RadioDetailData.m
//
//  Created by lanou  on 16/5/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioDetailData.h"
#import "RadioDetailRadioInfo.h"
#import "RadioDetailList.h"


NSString *const kRadioDetailDataTotal = @"total";
NSString *const kRadioDetailDataRadioInfo = @"radioInfo";
NSString *const kRadioDetailDataList = @"list";


@interface RadioDetailData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioDetailData

@synthesize total = _total;
@synthesize radioInfo = _radioInfo;
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
            self.total = [[self objectOrNilForKey:kRadioDetailDataTotal fromDictionary:dict] doubleValue];
            self.radioInfo = [RadioDetailRadioInfo modelObjectWithDictionary:[dict objectForKey:kRadioDetailDataRadioInfo]];
    NSObject *receivedRadioDetailList = [dict objectForKey:kRadioDetailDataList];
    NSMutableArray *parsedRadioDetailList = [NSMutableArray array];
    if ([receivedRadioDetailList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRadioDetailList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRadioDetailList addObject:[RadioDetailList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRadioDetailList isKindOfClass:[NSDictionary class]]) {
       [parsedRadioDetailList addObject:[RadioDetailList modelObjectWithDictionary:(NSDictionary *)receivedRadioDetailList]];
    }

    self.list = [NSArray arrayWithArray:parsedRadioDetailList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.total] forKey:kRadioDetailDataTotal];
    [mutableDict setValue:[self.radioInfo dictionaryRepresentation] forKey:kRadioDetailDataRadioInfo];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kRadioDetailDataList];

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

    self.total = [aDecoder decodeDoubleForKey:kRadioDetailDataTotal];
    self.radioInfo = [aDecoder decodeObjectForKey:kRadioDetailDataRadioInfo];
    self.list = [aDecoder decodeObjectForKey:kRadioDetailDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_total forKey:kRadioDetailDataTotal];
    [aCoder encodeObject:_radioInfo forKey:kRadioDetailDataRadioInfo];
    [aCoder encodeObject:_list forKey:kRadioDetailDataList];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioDetailData *copy = [[RadioDetailData alloc] init];
    
    if (copy) {

        copy.total = self.total;
        copy.radioInfo = [self.radioInfo copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
