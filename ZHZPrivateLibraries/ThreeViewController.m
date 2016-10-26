//
//  ThreeViewController.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 2016/10/25.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "ThreeViewController.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBadgeValue:100 atIndex:3];
    [self setNavigationBarBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] tintColor:[UIColor redColor] textColor:[UIColor purpleColor] statusBarStyle:UIStatusBarStyleLightContent];
}
- (IBAction)test:(id)sender {
    [self showErrorWithStatus:@"网络获取失败"];
    [self setBadgeValue:0 atIndex:3];
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
