//
//  FactoryTableViewCell.m
//  ProjectA
//
//  Created by lanou on 16/6/1.
//  Copyright © 2016年 Aliu. All rights reserved.
//

#import "FactoryTableViewCell.h"

@implementation FactoryTableViewCell

+(BaseTableViewCell *)dequeueWithIdentify:(BaseModel *)model withTableView:(UITableView *)tableView index:(NSIndexPath *)indexPath{
    NSString *modelName = NSStringFromClass([model class]);
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"%@Cell",modelName]  forIndexPath:indexPath];
    return cell;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
