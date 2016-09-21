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
//设备物理尺寸
#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_height [UIScreen mainScreen].bounds.size.height
@interface OneViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ImagV;

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];

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
    NSURL *url = [NSURL URLWithString:@"news://"];
    
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
    self.ImagV.image = [UIImage imageOfQRFromURL:@"www.baidu.com" codeSize:self.ImagV.frame.size.width red:0 green:0 blue:0 insertImage:[UIImage new]];
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
