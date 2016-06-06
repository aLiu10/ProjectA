//
//  RadioPlayCell.m
//  ProjectA
//
//  Created by lanou on 16/6/6.
//  Copyright © 2016年 Aliu. All rights reserved.
//

#import "RadioPlayCell.h"

@implementation RadioPlayCell

-(void)setListModel:(RadioDetailList *)listModel
{
    self.titlelabel.text = listModel.title;
    self.byLabel.text = [NSString stringWithFormat:@"by:%@",listModel.playInfo.userinfo.uname];
}

- (void)awakeFromNib {
    // Initialization code
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
