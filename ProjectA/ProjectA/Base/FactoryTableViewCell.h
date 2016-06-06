//
//  FactoryTableViewCell.h
//  ProjectA
//
//  Created by lanou on 16/6/1.
//  Copyright © 2016年 Aliu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FactoryTableViewCell : UITableViewCell

//Modelname+Cell -->name
+(BaseTableViewCell *)dequeueWithIdentify:(BaseModel *)model withTableView:(UITableView *)tableView index:(NSIndexPath *)indexPath;

@end
