//
//  BaseTableViewCell.h
//  ProjectA
//
//  Created by lanou on 16/6/1.
//  Copyright © 2016年 Aliu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell

//声明一个方法给cell上的控件加数据
-(void)setDataWithModel:(BaseModel *)model;

@end
