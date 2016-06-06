//
//  RadioDetailCell.m
//  ProjectA
//
//  Created by lanou on 16/6/2.
//  Copyright © 2016年 Aliu. All rights reserved.
//

#import "RadioDetailCell.h"

@implementation RadioDetailCell

- (void)awakeFromNib {
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)clickBtn:(UIButton *)sender {
    if (self.imagSelectBlcok) {
        self.imagSelectBlcok();
    }
}
@end
