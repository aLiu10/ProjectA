//
//  RadioTableViewCell.h
//  ProjectA
//
//  Created by lanou on 16/6/2.
//  Copyright © 2016年 Aliu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RadioTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imaView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;

@end
