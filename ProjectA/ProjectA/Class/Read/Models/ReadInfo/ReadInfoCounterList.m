//
//  ReadInfoCounterList.m
//
//  Created by lanou  on 16/6/1
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadInfoCounterList.h"


NSString *const kReadInfoCounterListComment = @"comment";
NSString *const kReadInfoCounterListLike = @"like";


@interface ReadInfoCounterList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadInfoCounterList

@synthesize comment = _comment;
@synthesize like = _like;


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
            self.comment = [[self objectOrNilForKey:kReadInfoCounterListComment fromDictionary:dict] doubleValue];
            self.like = [[self objectOrNilForKey:kReadInfoCounterListLike fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.comment] forKey:kReadInfoCounterListComment];
    [mutableDict setValue:[NSNumber numberWithDouble:self.like] forKey:kReadInfoCounterListLike];

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

    self.comment = [aDecoder decodeDoubleForKey:kReadInfoCounterListComment];
    self.like = [aDecoder decodeDoubleForKey:kReadInfoCounterListLike];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_comment forKey:kReadInfoCounterListComment];
    [aCoder encodeDouble:_like forKey:kReadInfoCounterListLike];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadInfoCounterList *copy = [[ReadInfoCounterList alloc] init];
    
    if (copy) {

        copy.comment = self.comment;
        copy.like = self.like;
    }
    
    return copy;
}


@end
