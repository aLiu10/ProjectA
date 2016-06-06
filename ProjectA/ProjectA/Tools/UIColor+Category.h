//
//  UIColor+Category.h
//  ProjectA
//
//  Created by lanou on 16/5/30.
//  Copyright © 2016年 Aliu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Category)

+ (UIColor *)colorWithHex:(long)hexColor;
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity;

@end
