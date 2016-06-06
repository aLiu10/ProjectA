//
//  ReadDetailData.m
//
//  Created by lanou  on 16/5/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadDetailData.h"
#import "ReadDetailColumnsInfo.h"
#import "ReadDetailList.h"


NSString *const kReadDetailDataTotal = @"total";
NSString *const kReadDetailDataColumnsInfo = @"columnsInfo";
NSString *const kReadDetailDataList = @"list";


@interface ReadDetailData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadDetailData

@synthesize total = _total;
@synthesize columnsInfo = _columnsInfo;
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
            self.total = [[self objectOrNilForKey:kReadDetailDataTotal fromDictionary:dict] doubleValue];
            self.columnsInfo = [ReadDetailColumnsInfo modelObjectWithDictionary:[dict objectForKey:kReadDetailDataColumnsInfo]];
    NSObject *receivedReadDetailList = [dict objectForKey:kReadDetailDataList];
    NSMutableArray *parsedReadDetailList = [NSMutableArray array];
    if ([receivedReadDetailList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedReadDetailList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedReadDetailList addObject:[ReadDetailList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedReadDetailList isKindOfClass:[NSDictionary class]]) {
       [parsedReadDetailList addObject:[ReadDetailList modelObjectWithDictionary:(NSDictionary *)receivedReadDetailList]];
    }

    self.list = [NSArray arrayWithArray:parsedReadDetailList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.total] forKey:kReadDetailDataTotal];
    [mutableDict setValue:[self.columnsInfo dictionaryRepresentation] forKey:kReadDetailDataColumnsInfo];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kReadDetailDataList];

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

    self.total = [aDecoder decodeDoubleForKey:kReadDetailDataTotal];
    self.columnsInfo = [aDecoder decodeObjectForKey:kReadDetailDataColumnsInfo];
    self.list = [aDecoder decodeObjectForKey:kReadDetailDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_total forKey:kReadDetailDataTotal];
    [aCoder encodeObject:_columnsInfo forKey:kReadDetailDataColumnsInfo];
    [aCoder encodeObject:_list forKey:kReadDetailDataList];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadDetailData *copy = [[ReadDetailData alloc] init];
    
    if (copy) {

        copy.total = self.total;
        copy.columnsInfo = [self.columnsInfo copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
