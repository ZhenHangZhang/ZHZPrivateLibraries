
//
//  ZHZRootViewControllerManager.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/9.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "ZHZRootViewControllerManager.h"
#import "ZHZCustomGuidViewController.h"
#import "UIImage+ZHZCategory.h"
#import "ZHZTabBarVC.h"

@implementation ZHZRootViewControllerManager

+ (instancetype)manager {
    return [[self alloc]init];
}

- (void)setWindow:(UIWindow *)window {
    _window = window;
    [self prepareForBundleVersionKey];
}

- (void)prepareForBundleVersionKey {
    
    NSString * key = @"CFBundleVersion";
    NSUserDefaults * userDefaults   = [NSUserDefaults standardUserDefaults];
    NSString       * lastVersion    = [[NSUserDefaults standardUserDefaults] stringForKey:key];
    NSString       * currentVersion = [NSBundle mainBundle].infoDictionary[key];
    
    if ([currentVersion isEqualToString:lastVersion]) {
        self.window.rootViewController = [self getTabbarController];
    } else {
        self.window.rootViewController = [self getNewFeatureController];
        [userDefaults setObject:currentVersion forKey:key];
        [userDefaults synchronize];
    }
}
- (ZHZCustomGuidViewController *)getNewFeatureController {
    
    __weak typeof(self) _self = self;
    ZHZCustomGuidViewController * newfeature = [ZHZCustomGuidViewController new];
    newfeature.newfeatureImages = @[@"bg1",@"bg2",@"bg3",@"bg4"];
    newfeature.enterButtonImage = [UIImage imageWithColor:[UIColor clearColor]];
    newfeature.block = ^{
        _self.window.rootViewController = [self getTabbarController];
    };
    return newfeature;
}

- (UITabBarController *)getTabbarController {
    return [[ZHZTabBarVC alloc]init];
    
}
@end
