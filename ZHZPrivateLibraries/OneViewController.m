//
//  OneViewController.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/20.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "OneViewController.h"
#import "UIImage+ZHZCreateBarcode.h"
#import "ZHZViewPager.h"
#import "UILabel+Wonderful.h"
#import <YYKit/YYKit.h>
#import "MainViewController.h"
#import "ZHZCardViewController.h"
#import "ZHZTxtViewController.h"
//设备物理尺寸
#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_height [UIScreen mainScreen].bounds.size.height
@interface OneViewController ()<CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *ImagV;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//self.label.text = @"iOS9 3D Touch 使用教程";
    
    [self.label setColorText:@"<iOS9> 3D Touch 使用教程"];
    [self.label setFontText:@"iOS9 [3D] Touch 使用教程"];
    [self.label setColorFontText:@"<iOS9 [3D] Touch> 使用教程"];
    
    
//    self.automaticallyAdjustsScrollViewInsets = YES;
//    NSMutableArray *imgs = [NSMutableArray array];
//    
//    
//    NSMutableArray *seletedimgs = [NSMutableArray array];
//    NSMutableArray *Views = [NSMutableArray array];
//    for (int i = 0 ; i < 4; i++) {
//        UIImage *mag = [UIImage imageNamed:@"tabbar_message_center_os7@2x"];
//        [imgs addObject:mag];
//        UIImage *seletmag = [UIImage imageNamed:@"tabbar_home_selected_os7@2x"];
//        [seletedimgs addObject:seletmag];
//        UIView *v = [[UIView alloc]init];
//        [Views addObject:v];
//        
//    }
    
//    ZHZViewPager *pagerView = [[ZHZViewPager alloc]initWithFrame:CGRectMake(0, 64, screen_width, screen_height) titles:@[@"微信",@"通讯录",@"发现",@"我"] icons:imgs selectedIcons:seletedimgs views:Views];
    
//    [self.view addSubview:pagerView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)test:(id)sender {
//    NSURL *url = [NSURL URLWithString:@"news://"];
//    
//    if ([[UIApplication sharedApplication] canOpenURL:url]) {
//        [[UIApplication sharedApplication] openURL:url];
//    }
    
    [self show:@"消息通知"];
//    self.ImagV.image = [UIImage imageOfQRFromURL:@"www.baidu.com" codeSize:self.ImagV.frame.size.width red:0 green:0 blue:0 insertImage:[UIImage new]];
    
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    transition.delegate = self;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    ZHZTxtViewController * fc = [[ZHZTxtViewController alloc]init];
    fc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:fc animated:NO];
    
}
-(void)show:(NSString*)msg{
    CGFloat padding = 10;
    
    YYLabel *label = [YYLabel new];
    label.text = msg;
    label.font = [UIFont systemFontOfSize:16];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor colorWithRed:0.033 green:0.685 blue:0.978 alpha:0.730];
    label.width = self.view.width;
    label.textContainerInset = UIEdgeInsetsMake(padding, padding, padding, padding);
    label.height = [msg heightForFont:label.font width:label.width] + 2 * padding;
    
    label.bottom = (kiOS7Later ? 64 : 0);
    [self.view addSubview:label];
    [UIView animateWithDuration:0.3 animations:^{
        label.top = (kiOS7Later ? 64 : 0);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 delay:2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            label.bottom = (kiOS7Later ? 64 : 0);
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
    }];
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
