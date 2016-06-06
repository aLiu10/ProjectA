//
//  NetWorkRequsetManager.m
//  ProjectA
//
//  Created by lanou on 16/5/31.
//  Copyright © 2016年 Aliu. All rights reserved.
//

#import "NetWorkRequsetManager.h"

@implementation NetWorkRequsetManager

+(void)requestWithType:(RequestType)type url:(NSString *)urlStr para:(NSDictionary *)dicPara finish:    (Success)success error:(Fail)fail{
    NSURLSession *session = [NSURLSession sharedSession];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:urlStr]];
    if (type == POST) {
        request.HTTPMethod = @"post";
        NSData *data = [NSJSONSerialization dataWithJSONObject:dicPara options:NSJSONWritingPrettyPrinted error:nil];
        request.HTTPBody = data;
    }
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            success(data);
        }else{
            fail(error);
        }
    }];
    [task resume];
    
    
    
    
}
@end
