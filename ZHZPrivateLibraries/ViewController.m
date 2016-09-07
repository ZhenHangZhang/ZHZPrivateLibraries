//
//  ViewController.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/7.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "ViewController.h"
#import "ZHZTools.h"
#import "ZHZCustomAlertView.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)tan:(id)sender {
    ZHZCustomAlertView * alertView = [[ZHZCustomAlertView alloc] initWithTitle:@"弹窗" message:@"这是我自己定义的弹窗" cancelButtonTitle:@"取消" otherButtonTitle:@"OK"];
    alertView.shouldDismissOnOutsideTapped = YES;
    alertView.appearAnimationType = ZHZAlertViewAnimationTypeFlyLeft;
    alertView.disappearAnimationType = ZHZAlertViewAnimationTypeFlyRight;
    alertView.appearTime = 1;
    alertView.disappearTime = 1;
    [alertView show];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if ([ZHZTools isPhoneNumber:@"13323819717"]) {
        NSLog(@"这是一个手机号");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
