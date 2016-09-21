//
//  AppDelegate.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/7.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "AppDelegate.h"
#import "ZHZRootViewControllerManager.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"垃圾git客户端竟然不显示");
    NSLog(@"是否是通过Schemes打开的%@",launchOptions);
    if (launchOptions[UIApplicationLaunchOptionsURLKey]) {
        
    }
    //这个模式特别好减少APPdelegate的代码量，更直观的看到框架结构，所有的操作是放在Manager里面 进行逻辑判断的
    [ZHZRootViewControllerManager manager].window = self.window ;
    [self.window makeKeyWindow];
    NSLog(@"这是iphone7plus测试用的");
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    //
    NSLog(@"%@",options);
    NSLog(@"%s====>%@++++++%@=====>%@",__func__,url.host,url.path,url.query);
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
