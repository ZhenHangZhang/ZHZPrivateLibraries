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
#import "ZHZBackGroundAnimatedImagesView.h"


#import "ZHZTableViewCell.h"




//设备物理尺寸
#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_height [UIScreen mainScreen].bounds.size.height
@interface OneViewController ()<CAAnimationDelegate,ZHZAnimatedImagesViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *ImagV;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property(nonatomic,strong)ZHZBackGroundAnimatedImagesView *animatedImagesView;
@property (weak, nonatomic) IBOutlet UITableView *table;

@end


//第一中cell的复用标识
static  NSString* firseCellid = @"firseCell";
//第2中cell的复用标识
static  NSString* secCellid = @"secCellid";
//第3中cell的复用标识
static  NSString* threeCellid = @"threeCellid";
//第4中cell的复用标识
static  NSString* fourCellid = @"fourCellid";

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, -20, self.navigationController.navigationBar.frame.size.width, 64)];
    bg.backgroundColor = [UIColor colorWithWhite:0 alpha:1];
    
    [self.navigationController.navigationBar insertSubview:bg atIndex:0];
    
    [self.table registerNib:[UINib nibWithNibName:@"ZHZTableViewCell" bundle:nil] forCellReuseIdentifier:threeCellid];
 
    //添加动态图
    self.animatedImagesView = [[ZHZBackGroundAnimatedImagesView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.view addSubview:self.animatedImagesView];
    self.animatedImagesView.delegate = self;
    [self.view insertSubview:self.animatedImagesView belowSubview:self.label];
    [self.animatedImagesView startAnimating];

    
    
//self.label.text = @"iOS9 3D Touch 使用教程";
    
//    [self.label setColorText:@"<iOS9> 3D Touch 使用教程"];
//    [self.label setFontText:@"iOS9 [3D] Touch 使用教程"];
//    [self.label setColorFontText:@"<iOS9 [3D] Touch> 使用教程"];
    
    
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 60;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    ZHZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:firseCellid];
    if (!cell) {
        cell = [[ZHZTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:firseCellid];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MainViewController * fc = [[MainViewController alloc]init];
    fc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:fc animated:NO];
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
- (NSUInteger)animatedImagesNumberOfImages:(ZHZBackGroundAnimatedImagesView*)animatedImagesView
{
    return 2;
}

- (UIImage*)animatedImagesView:(ZHZBackGroundAnimatedImagesView*)animatedImagesView imageAtIndex:(NSUInteger)index
{
    
    if (index == 0) {
        return [UIImage imageNamed:@"bg1"];
        
    }else{
        
        return [UIImage imageNamed:@"bg2"];
        
    }
    
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
