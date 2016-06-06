//
//  ReadInfoViewController.h
//  ProjectA
//
//  Created by lanou on 16/6/1.
//  Copyright © 2016年 Aliu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReadInfoViewController : UIViewController
@property(nonatomic,strong)NSString *contentid;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
