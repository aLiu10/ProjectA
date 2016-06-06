//
//  RadioPlayMenuView.m
//  ProjectA
//
//  Created by lanou on 16/6/6.
//  Copyright © 2016年 Aliu. All rights reserved.
//

#import "RadioPlayMenuView.h"

@implementation RadioPlayMenuView

-(void)changeTypeView:(NSInteger)num{
    
    for (UIView *view in self.subviews) {
        if ([view isMemberOfClass:[UIView class]]) {
            view.backgroundColor = [UIColor lightGrayColor];
        }
    }
    //  然后根据scrollview的位置修改成显示状态
    UIView *markView = [self viewWithTag:1000 + num];
    markView.backgroundColor = [UIColor greenColor];
}
- (IBAction)backBtnHandle:(id)sender {
    if (self.changeblock) {
        self.changeblock(1);
    }
}
- (IBAction)stopAndPlayBtnHandle:(id)sender {
    if (self.changeblock) {
        self.changeblock(2);
    }
}
- (IBAction)nextBtnHandle:(id)sender {
    if (self.changeblock) {
        self.changeblock(3);
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
