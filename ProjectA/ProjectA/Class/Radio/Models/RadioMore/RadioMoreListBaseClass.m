//
//  RadioMoreListBaseClass.m
//
//  Created by lanou  on 16/6/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioMoreListBaseClass.h"
#import "RadioMoreListData.h"


NSString *const kRadioMoreListBaseClassResult = @"result";
NSString *const kRadioMoreListBaseClassData = @"data";


@interface RadioMoreListBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioMoreListBaseClass

@synthesize result = _result;
@synthesize data = _data;


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
            self.result = [[self objectOrNilForKey:kRadioMoreListBaseClassResult fromDictionary:dict] doubleValue];
            self.data = [RadioMoreListData modelObjectWithDictionary:[dict objectForKey:kRadioMoreListBaseClassData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.result] forKey:kRadioMoreListBaseClassResult];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kRadioMoreListBaseClassData];

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

    self.result = [aDecoder decodeDoubleForKey:kRadioMoreListBaseClassResult];
    self.data = [aDecoder decodeObjectForKey:kRadioMoreListBaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_result forKey:kRadioMoreListBaseClassResult];
    [aCoder encodeObject:_data forKey:kRadioMoreListBaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioMoreListBaseClass *copy = [[RadioMoreListBaseClass alloc] init];
    
    if (copy) {

        copy.result = self.result;
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
