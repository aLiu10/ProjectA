//
//  ReadDetailListCell.m
//  ProjectA
//
//  Created by lanou on 16/6/1.
//  Copyright © 2016年 Aliu. All rights reserved.
//

#import "ReadDetailListCell.h"
#import "ReadDetailList.h"

@implementation ReadDetailListCell

//重写父类方法
-(void)setDataWithModel:(ReadDetailList *)model{
    self.titleLabel.text = model.title;
    [self.headerImage sd_setImageWithURL:[NSURL URLWithString:model.coverimg]];
    self.contentLabel.text = model.content;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
