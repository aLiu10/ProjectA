//
//  NetWorkRequsetManager.h
//  ProjectA
//
//  Created by lanou on 16/5/31.
//  Copyright © 2016年 Aliu. All rights reserved.
//

#import <Foundation/Foundation.h>

//请求方式的枚举值
typedef NS_ENUM(NSInteger,RequestType){
    GET,
    POST
};

//定义2个block当做参数 在请求结果中回调
typedef void(^Success)(NSData *data);
typedef void(^Fail)(NSError *error);

@interface NetWorkRequsetManager : NSObject

//定义一个请求方法
/**
 *  封装网络请求
 *
 *  @param type    请求类型 get post等
 *  @param urlStr  网址
 *  @param dicPara post请求中的url参数
 *  @param success 成功回调方法
 *  @param error   请求失败回调方法
 */
+(void)requestWithType:(RequestType)type url:(NSString *)urlStr para:(NSDictionary *)dicPara finish:(Success)success error:(Fail)fail;

@end
