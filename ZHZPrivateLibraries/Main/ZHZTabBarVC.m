//
//  ZHZTabBarVC.m
//  parkingTest
//
//  Created by zhanghangzhen on 15/12/29.
//  Copyright © 2015年 zhanghangzhen. All rights reserved.
//

#import "ZHZTabBarVC.h"
#import "ZHZTabBar.h"
#import "AppDelegate.h"
#import "ZHZBaseNavViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"


#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

@interface ZHZTabBarVC ()<ZHZTabBarDelegate>
{

}
@end

@implementation ZHZTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
     [self addItem];
    // 添加所有的子控制器
    [self addAllChildVcs];
    // 创建自定义tabbar
    [self addCustomTabBar];
}

-(void)addItem{
    self.automaticallyAdjustsScrollViewInsets = YES;
     self.title = @"约停车";
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithTitle:@"菜单" style:UIBarButtonItemStylePlain target:self action:@selector(leftView)];
    self.navigationItem.leftBarButtonItem = leftBtn;
}
-(void)leftView{
  
}
-(void)addCustomTabBar{
    // 创建自定义tabbar
    ZHZTabBar *customTabBar = [[ZHZTabBar alloc] init];
    customTabBar.tabBarDelegate = self;
    // 更换系统自带的tabbar
    [self setValue:customTabBar forKeyPath:@"tabBar"];

}
-(void)addAllChildVcs{
    OneViewController *profile = [[OneViewController alloc] initWithNibName:@"OneViewController" bundle:nil];
    
    [self addOneChlildVc:profile title:@"地图" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];

    TwoViewController *discover = [[TwoViewController alloc] init];
    [self addOneChlildVc:discover title:@"用户" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    
    
    
    ThreeViewController*cover = [[ThreeViewController alloc] init];
    [self addOneChlildVc:cover title:@"用户" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    
    }

/**
 *  添加一个子控制器
 *
 *  @param childVc           子控制器对象
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)addOneChlildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 设置标题
    childVc.title = title;
    
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    
//     设置tabBarItem的普通文字颜色
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
//
//    // 设置tabBarItem的选中文字颜色
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    if (iOS7) {
        // 声明这张图片用原图(别渲染)
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    childVc.tabBarItem.selectedImage = selectedImage;
    self.title =  title;
    // 添加为tabbar控制器的子控制器
    ZHZBaseNavViewController *nav = [[ZHZBaseNavViewController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}

-(void)tabBarDidClickedPlusButton:(ZHZTabBar *)tabBar{
  
    NSLog(@"test");
    
    
}
- (void)viewWillDisappear:(BOOL)animated
{
    
}
- (void)viewWillAppear:(BOOL)animated
{
}

 @end
