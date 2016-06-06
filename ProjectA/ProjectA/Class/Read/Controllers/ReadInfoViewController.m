//
//  ReadInfoViewController.m
//  ProjectA
//
//  Created by lanou on 16/6/1.
//  Copyright © 2016年 Aliu. All rights reserved.
//

#import "ReadInfoViewController.h"
#import "ReadInfo.h"
#import "NSString+Html.h"

@interface ReadInfoViewController ()
{
    ReadInfoBaseClass *_baseModel;
}

@end

@implementation ReadInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}

-(void)loadData{
    NSDictionary *dic = @{@"auth" : @"Wc06FCrkoq1DCMVzGMTikDJxQ8bm3Mrm2NpT9qWjwzcWP23tBKQx1c4P", @"contentid": _contentid};
    [NetWorkRequsetManager requestWithType:POST url:READCONTENT_URL para:dic finish:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        _baseModel = [ReadInfoBaseClass modelObjectWithDictionary:dic];
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *htmlStr = _baseModel.data.html;
            NSString *newHtml = [NSString importStyleWithHtmlString:htmlStr];
            //NSString *filePath = [[NSBundle mainBundle]pathForResource:@"style" ofType:@"css"];
            NSURL *url = [NSBundle mainBundle].bundleURL;
            [_webView loadHTMLString:newHtml baseURL:url];
        });
        NSLog(@"result___%.f",_baseModel.result);
    } error:^(NSError *error) {
        NSLog(@"error___%@",[error description]);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
