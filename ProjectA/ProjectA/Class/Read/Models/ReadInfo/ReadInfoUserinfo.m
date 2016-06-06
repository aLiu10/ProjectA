//
//  ReadInfoUserinfo.m
//
//  Created by lanou  on 16/6/1
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadInfoUserinfo.h"


NSString *const kReadInfoUserinfoIcon = @"icon";
NSString *const kReadInfoUserinfoUid = @"uid";
NSString *const kReadInfoUserinfoUname = @"uname";
NSString *const kReadInfoUserinfoDesc = @"desc";
NSString *const kReadInfoUserinfoIsfollow = @"isfollow";


@interface ReadInfoUserinfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadInfoUserinfo

@synthesize icon = _icon;
@synthesize uid = _uid;
@synthesize uname = _uname;
@synthesize desc = _desc;
@synthesize isfollow = _isfollow;


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
            self.icon = [self objectOrNilForKey:kReadInfoUserinfoIcon fromDictionary:dict];
            self.uid = [[self objectOrNilForKey:kReadInfoUserinfoUid fromDictionary:dict] doubleValue];
            self.uname = [self objectOrNilForKey:kReadInfoUserinfoUname fromDictionary:dict];
            self.desc = [self objectOrNilForKey:kReadInfoUserinfoDesc fromDictionary:dict];
            self.isfollow = [[self objectOrNilForKey:kReadInfoUserinfoIsfollow fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.icon forKey:kReadInfoUserinfoIcon];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kReadInfoUserinfoUid];
    [mutableDict setValue:self.uname forKey:kReadInfoUserinfoUname];
    [mutableDict setValue:self.desc forKey:kReadInfoUserinfoDesc];
    [mutableDict setValue:[NSNumber numberWithBool:self.isfollow] forKey:kReadInfoUserinfoIsfollow];

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

    self.icon = [aDecoder decodeObjectForKey:kReadInfoUserinfoIcon];
    self.uid = [aDecoder decodeDoubleForKey:kReadInfoUserinfoUid];
    self.uname = [aDecoder decodeObjectForKey:kReadInfoUserinfoUname];
    self.desc = [aDecoder decodeObjectForKey:kReadInfoUserinfoDesc];
    self.isfollow = [aDecoder decodeBoolForKey:kReadInfoUserinfoIsfollow];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_icon forKey:kReadInfoUserinfoIcon];
    [aCoder encodeDouble:_uid forKey:kReadInfoUserinfoUid];
    [aCoder encodeObject:_uname forKey:kReadInfoUserinfoUname];
    [aCoder encodeObject:_desc forKey:kReadInfoUserinfoDesc];
    [aCoder encodeBool:_isfollow forKey:kReadInfoUserinfoIsfollow];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadInfoUserinfo *copy = [[ReadInfoUserinfo alloc] init];
    
    if (copy) {

        copy.icon = [self.icon copyWithZone:zone];
        copy.uid = self.uid;
        copy.uname = [self.uname copyWithZone:zone];
        copy.desc = [self.desc copyWithZone:zone];
        copy.isfollow = self.isfollow;
    }
    
    return copy;
}


@end
