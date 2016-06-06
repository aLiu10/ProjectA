//
//  RadioPlayMenuView.h
//  ProjectA
//
//  Created by lanou on 16/6/6.
//  Copyright © 2016年 Aliu. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^changeStateBlock)(NSInteger state);

@interface RadioPlayMenuView : UIView

@property(nonatomic,strong)changeStateBlock changeblock;
//切换绿色view
-(void)changeTypeView:(NSInteger)num;

@end
