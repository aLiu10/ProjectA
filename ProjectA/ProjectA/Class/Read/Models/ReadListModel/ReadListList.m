//
//  ReadListList.m
//
//  Created by lanou  on 16/5/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadListList.h"


NSString *const kReadListListName = @"name";
NSString *const kReadListListType = @"type";
NSString *const kReadListListEnname = @"enname";
NSString *const kReadListListCoverimg = @"coverimg";


@interface ReadListList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadListList

@synthesize name = _name;
@synthesize type = _type;
@synthesize enname = _enname;
@synthesize coverimg = _coverimg;


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
            self.name = [self objectOrNilForKey:kReadListListName fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kReadListListType fromDictionary:dict] doubleValue];
            self.enname = [self objectOrNilForKey:kReadListListEnname fromDictionary:dict];
            self.coverimg = [self objectOrNilForKey:kReadListListCoverimg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kReadListListName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kReadListListType];
    [mutableDict setValue:self.enname forKey:kReadListListEnname];
    [mutableDict setValue:self.coverimg forKey:kReadListListCoverimg];

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

    self.name = [aDecoder decodeObjectForKey:kReadListListName];
    self.type = [aDecoder decodeDoubleForKey:kReadListListType];
    self.enname = [aDecoder decodeObjectForKey:kReadListListEnname];
    self.coverimg = [aDecoder decodeObjectForKey:kReadListListCoverimg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kReadListListName];
    [aCoder encodeDouble:_type forKey:kReadListListType];
    [aCoder encodeObject:_enname forKey:kReadListListEnname];
    [aCoder encodeObject:_coverimg forKey:kReadListListCoverimg];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadListList *copy = [[ReadListList alloc] init];
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.type = self.type;
        copy.enname = [self.enname copyWithZone:zone];
        copy.coverimg = [self.coverimg copyWithZone:zone];
    }
    
    return copy;
}


@end
