//
//  RadioDetailCell.h
//  ProjectA
//
//  Created by lanou on 16/6/2.
//  Copyright © 2016年 Aliu. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ImagBtnSelectBlock)();
@interface RadioDetailCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UIButton *seletBtn;
@property(nonatomic,copy)ImagBtnSelectBlock imagSelectBlcok;
- (IBAction)clickBtn:(UIButton *)sender;


@end
