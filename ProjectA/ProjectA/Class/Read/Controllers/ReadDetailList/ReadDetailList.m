//
//  ReadDetailList.m
//
//  Created by lanou  on 16/5/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadDetailList.h"


NSString *const kReadDetailListId = @"id";
NSString *const kReadDetailListTitle = @"title";
NSString *const kReadDetailListContent = @"content";
NSString *const kReadDetailListName = @"name";
NSString *const kReadDetailListCoverimg = @"coverimg";


@interface ReadDetailList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadDetailList

@synthesize listIdentifier = _listIdentifier;
@synthesize title = _title;
@synthesize content = _content;
@synthesize name = _name;
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
            self.listIdentifier = [self objectOrNilForKey:kReadDetailListId fromDictionary:dict];
            self.title = [self objectOrNilForKey:kReadDetailListTitle fromDictionary:dict];
            self.content = [self objectOrNilForKey:kReadDetailListContent fromDictionary:dict];
            self.name = [self objectOrNilForKey:kReadDetailListName fromDictionary:dict];
            self.coverimg = [self objectOrNilForKey:kReadDetailListCoverimg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.listIdentifier forKey:kReadDetailListId];
    [mutableDict setValue:self.title forKey:kReadDetailListTitle];
    [mutableDict setValue:self.content forKey:kReadDetailListContent];
    [mutableDict setValue:self.name forKey:kReadDetailListName];
    [mutableDict setValue:self.coverimg forKey:kReadDetailListCoverimg];

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

    self.listIdentifier = [aDecoder decodeObjectForKey:kReadDetailListId];
    self.title = [aDecoder decodeObjectForKey:kReadDetailListTitle];
    self.content = [aDecoder decodeObjectForKey:kReadDetailListContent];
    self.name = [aDecoder decodeObjectForKey:kReadDetailListName];
    self.coverimg = [aDecoder decodeObjectForKey:kReadDetailListCoverimg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_listIdentifier forKey:kReadDetailListId];
    [aCoder encodeObject:_title forKey:kReadDetailListTitle];
    [aCoder encodeObject:_content forKey:kReadDetailListContent];
    [aCoder encodeObject:_name forKey:kReadDetailListName];
    [aCoder encodeObject:_coverimg forKey:kReadDetailListCoverimg];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadDetailList *copy = [[ReadDetailList alloc] init];
    
    if (copy) {

        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.content = [self.content copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.coverimg = [self.coverimg copyWithZone:zone];
    }
    
    return copy;
}


@end
