//
//  ZHZBaseNavViewController.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/8.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "ZHZBaseNavViewController.h"
#import "ZHZHeader.h"
#import "ZHZImageCustom.h"



@interface ZHZBaseNavViewController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation ZHZBaseNavViewController

+ (void)initialize
{
    // 设置UINavigationBarTheme的主
    [self setupNavigationBarTheme];
    
    // 设置UIBarButtonItem的主题
    [self setupBarButtonItemTheme];
}
/**
 *  设置UINavigationBarTheme的主题
 */
+ (void)setupNavigationBarTheme
{
    UINavigationBar *appearance = [UINavigationBar appearance];
    // 设置导航栏 以及状态栏的背景颜色背景
    if (!iOS7) {
        [appearance setBackgroundImage:[ZHZImageCustom imageWithColor:[UIColor redColor]] forBarMetrics:UIBarMetricsDefault];
    }else{
     appearance.barTintColor = [UIColor redColor];
    }
    /**设置导航栏背景颜色，状态栏默认
     [appearance setBackgroundImage:[ZHZImageCustom imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
     appearance.backgroundColor = [UIColor redColor];
     appearance.shadowImage = [ZHZImageCustom imageWithColor:[UIColor clearColor]];
     */
    
    // 设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = ZHZ_RGBValue(41, 45, 103);
    // UITextAttributeFont  --> NSFontAttributeName(iOS7)
//    textAttrs[NSFontAttributeName] = HMNavigationTitleFont;
    // UIOffsetZero是结构体, 只要包装成NSValue对象, 才能放进字典\数组中
//    textAttrs[NSShadowAttributeName] = [NSValue valueWithUIOffset:UIOffsetZero];
    [appearance setTitleTextAttributes:textAttrs];
}
/**
 *  设置UIBarButtonItem的主题
 */
+ (void)setupBarButtonItemTheme
{
    // 通过appearance对象能修改整个项目中所有UIBarButtonItem的样式
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    /**设置文字属性**/
    // 设置普通状态的文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = ZHZ_RGBValue(41, 45, 103);
//    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
//    textAttrs[NSShadowAttributeName] = [NSValue valueWithUIOffset:UIOffsetZero];
    [appearance setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置高亮状态的文字属性
    NSMutableDictionary *highTextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
    highTextAttrs[NSForegroundColorAttributeName] = ZHZ_RGBValue(41, 45, 103);
    [appearance setTitleTextAttributes:highTextAttrs forState:UIControlStateHighlighted];
    
    // 设置不可用状态(disable)的文字属性
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [appearance setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
    
    /**设置背景**/
    // 技巧: 为了让某个按钮的背景消失, 可以设置一张完全透明的背景图片
    [appearance setBackgroundImage:[ZHZImageCustom imageWithColor:[UIColor clearColor]] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = self;
}
/**
 *  能拦截所有push进来的子控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) { // 如果现在push的不是栈底控制器(最先push进来的那个控制器)
        viewController.hidesBottomBarWhenPushed = YES;
        // 设置导航栏按钮
//        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
//        viewController.navigationItem.backBarButtonItem.title = @"";
//        viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"顶部" style:UIBarButtonItemStylePlain target:self action:@selector(more)];
    }
    [super pushViewController:viewController animated:animated];
}


#pragma mark - UIGestureRecognizerDelegate
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    
    return self.childViewControllers.count > 1;
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
