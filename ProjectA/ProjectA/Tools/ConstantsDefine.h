//
//  ConstantsDefine.h
//  ProjectA
//
//  Created by lanou on 16/5/31.
//  Copyright © 2016年 Aliu. All rights reserved.
//

#ifndef ConstantsDefine_h
#define ConstantsDefine_h

#define NSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
//判断字符串是否为空
#define IsEmptyString(str) (([str isKindOfClass:[NSNull class]] || str == nil || [str length]<=0)? YES : NO )

//屏幕宽高
#define ScreenWidth  [[UIScreen mainScreen]bounds].size.width
#define ScreenHeight [[UIScreen mainScreen]bounds].size.height
#define NavagationBarHeight  44.0
#define WEAKSELF typeof(self) __weak weakSelf = self;

#endif /* ConstantsDefine_h */
