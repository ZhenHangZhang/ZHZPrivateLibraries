//
//  ThreeViewController.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 2016/10/25.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "ThreeViewController.h"
#import "Singleton.h"
#import "YQCalendarView.h"
#import <MagicalRecord/MagicalRecord.h>
#import "Person.h"




@interface ThreeViewController ()
{
    YQCalendarView*view;
}
@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    view = [[YQCalendarView alloc]initWithFrame:CGRectMake(20,
                                                           100,
                                                           self.view.frame.size.width-40,
                                                           300)];
//    [self.view addSubview:view];
    
    //设置选中的日期，格式 yyyy-MM-dd (数组)
    view.selectedArray = @[@"2016-08-23",
                           @"2016-08-21",
                           @"2016-08-20",
                           @"2016-08-15",
                           @"2016-08-12",
                           @"2016-08-05",
                           @"2016-07-26",
                           @"2016-07-29",
                           @"2016-09-14",
                           @"2016-09-20",
                           @"2016-09-23",
                           ];
    
    //单独添加选中个某一天
    [view AddToChooseOneDay:@"2016-10-25"];
    
    //--------------------------------------------------自定义显示
    
    
    //整体背景色
    view.backgroundColor   = [UIColor whiteColor];
    //选中的日期的背景颜色
    view.selectedBackColor = [UIColor lightGrayColor];
    //选中的日期下方的图标
    view.selectedIcon      = [UIImage imageNamed:@""];
    //下一页按钮的图标
    view.nextBTNIcon       = [UIImage imageNamed:@""];
    //前一页按钮的图标
    view.preBTNIcon        = [UIImage imageNamed:@""];
    //上方日期标题的字体
    view.titleFont         = [UIFont systemFontOfSize:17];
    //上方日期标题的颜色
    view.titleColor        = [UIColor blackColor];
    //下方日历的每一天的字体
    view.dayFont           = [UIFont systemFontOfSize:17];
    //下方日历的每一天的字体颜色
    view.dayColor          = [UIColor blackColor];

    
    
    
    
//    [Singleton sharedInstance].socketHost = @"192.186.100.21";// host设定
//    [Singleton sharedInstance].socketPort = 10045;// port设定
//    // 在连接前先进行手动断开
//    [Singleton sharedInstance].socket.userData = SocketOfflineByUser;
//    [[Singleton sharedInstance] cutOffSocket];
//    // 确保断开后再连，如果对一个正处于连接状态的socket进行连接，会出现崩溃
//    [Singleton sharedInstance].socket.userData = SocketOfflineByServer;
//    [[Singleton sharedInstance] socketConnectHost];

    
    
    [self setBadgeValue:100 atIndex:3];
    [self setNavigationBarBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] tintColor:[UIColor redColor] textColor:[UIColor purpleColor] statusBarStyle:UIStatusBarStyleLightContent];
}
- (IBAction)test:(id)sender {
    [self showErrorWithStatus:@"网络获取失败"];
    [self setBadgeValue:0 atIndex:3];
    
    NSLog(@"%@",[ZHZUtils md5HexDigest:@"网络获取失败"]);
 
    
}


@end
