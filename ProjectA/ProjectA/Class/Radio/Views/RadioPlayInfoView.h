//
//  RadioPlayInfoView.h
//  
//
//  Created by lanou on 16/6/6.
//
//

#import <UIKit/UIKit.h>
#import "RadioDetailModel.h"

@interface RadioPlayInfoView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *palyImgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UISlider *progressSlider;
@property (weak, nonatomic) IBOutlet UILabel *shengyuLabel;
@property(nonatomic,strong) RadioDetailList *listModel;

@end
