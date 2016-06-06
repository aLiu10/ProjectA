//
//  ReadDetailColumnsInfo.m
//
//  Created by lanou  on 16/5/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadDetailColumnsInfo.h"


NSString *const kReadDetailColumnsInfoTypename = @"typename";
NSString *const kReadDetailColumnsInfoTypeid = @"typeid";


@interface ReadDetailColumnsInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadDetailColumnsInfo

@synthesize typename = _typename;
@synthesize typeid = _typeid;


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
            self.typename = [self objectOrNilForKey:kReadDetailColumnsInfoTypename fromDictionary:dict];
            self.typeid = [[self objectOrNilForKey:kReadDetailColumnsInfoTypeid fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.typename forKey:kReadDetailColumnsInfoTypename];
    [mutableDict setValue:[NSNumber numberWithDouble:self.typeid] forKey:kReadDetailColumnsInfoTypeid];

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

    self.typename = [aDecoder decodeObjectForKey:kReadDetailColumnsInfoTypename];
    self.typeid = [aDecoder decodeDoubleForKey:kReadDetailColumnsInfoTypeid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_typename forKey:kReadDetailColumnsInfoTypename];
    [aCoder encodeDouble:_typeid forKey:kReadDetailColumnsInfoTypeid];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadDetailColumnsInfo *copy = [[ReadDetailColumnsInfo alloc] init];
    
    if (copy) {

        copy.typename = [self.typename copyWithZone:zone];
        copy.typeid = self.typeid;
    }
    
    return copy;
}


@end
