//
//  RadioPlayInfoView.m
//  
//
//  Created by lanou on 16/6/6.
//
//

#import "RadioPlayInfoView.h"
#import "RadioPlayManager.h"

@implementation RadioPlayInfoView

-(void)setListModel:(RadioDetailList *)listModel{
    [self.palyImgView sd_setImageWithURL:[NSURL URLWithString:listModel.coverimg]];
    self.titleLabel.text = listModel.title;
}
- (IBAction)sliderValueChanged:(UISlider *)sender {
    RadioPlayManager *manager= [RadioPlayManager defaultManager];
    [manager seekTotime:sender.value];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
