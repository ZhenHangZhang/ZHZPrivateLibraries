//
//  AppDelegate.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/7.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "AppDelegate.h"
#import "ZHZRootViewControllerManager.h"
#import <IQKeyboardManager/IQKeyboardManager.h>
#import "iflyMSC/IFlySpeechSynthesizer.h"
#import "iflyMSC/IFlySpeechSynthesizerDelegate.h"
#import "iflyMSC/IFlySpeechConstant.h"
#import "iflyMSC/IFlySpeechUtility.h"
#import "iflyMSC/IFlySetting.h"
/**
 *  3D Touch 出发事件
 */
#define KCutItem1 @"muBaiDuMap"
#define KCutItem2 @"MulScroll"
#define KCutItem3 @"ownPayment"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)configIFlySpeech
{
    [IFlySpeechUtility createUtility:[NSString stringWithFormat:@"appid=%@,timeout=%@",@"5678ba3a",@"20000"]];
    
    [IFlySetting setLogFile:LVL_NONE];
    [IFlySetting showLogcat:NO];
    
    // 设置语音合成的参数
    [[IFlySpeechSynthesizer sharedInstance] setParameter:@"50" forKey:[IFlySpeechConstant SPEED]];//合成的语速,取值范围 0~100
    [[IFlySpeechSynthesizer sharedInstance] setParameter:@"50" forKey:[IFlySpeechConstant VOLUME]];//合成的音量;取值范围 0~100
    
    // 发音人,默认为”xiaoyan”;可以设置的参数列表可参考个 性化发音人列表;
    [[IFlySpeechSynthesizer sharedInstance] setParameter:@"xiaoyan" forKey:[IFlySpeechConstant VOICE_NAME]];
    
    // 音频采样率,目前支持的采样率有 16000 和 8000;
    [[IFlySpeechSynthesizer sharedInstance] setParameter:@"8000" forKey:[IFlySpeechConstant SAMPLE_RATE]];
    
    // 当你再不需要保存音频时，请在必要的地方加上这行。
    [[IFlySpeechSynthesizer sharedInstance] setParameter:nil forKey:[IFlySpeechConstant TTS_AUDIO_PATH]];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    //设置全局的键盘处理,不显示工具条
    [[IQKeyboardManager sharedManager] setEnable:YES];
    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:YES];

    [MagicalRecord setupCoreDataStackWithStoreNamed:@"Person.sqlite"];
    
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


/**
  *  手动添加3D touch功能
  */
-(void)init3DTouchActionShow:(BOOL)isShow{
    
    /** type 该item 唯一标识符
     localizedTitle ：标题
     localizedSubtitle：副标题
     icon：icon图标 可以使用系统类型 也可以使用自定义的图片
     userInfo：用户信息字典 自定义参数，完成具体功能需求
     */
    UIApplication *application = [UIApplication sharedApplication];
    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeLove];
    UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc]initWithType:KCutItem1 localizedTitle:@"百度地图" localizedSubtitle:@"" icon:icon1 userInfo:nil];
    
    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeShare];
    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc]initWithType:KCutItem2 localizedTitle:@"多视图滚动" localizedSubtitle:@"" icon:icon2 userInfo:nil];
    
    UIApplicationShortcutIcon *icon3 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeCompose];
    UIApplicationShortcutItem *item3 = [[UIApplicationShortcutItem alloc]initWithType:KCutItem3 localizedTitle:@"个人支付" localizedSubtitle:@"" icon:icon3 userInfo:nil];
    if (isShow) {
        application.shortcutItems = @[item1,item2,item3];
        
    }else{
        application.shortcutItems = @[];
    }
}

#pragma mark -3Dtouch功能
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler{
    //判断先前我们设置的唯一标识
    UIViewController *myVC;
    if ([shortcutItem.type isEqualToString:@"muBaiDuMap"]) {
    }else if ([shortcutItem.type isEqualToString:@"MulScroll"]){
    }else if ([shortcutItem.type isEqualToString:@"ownPayment"]){
    }
    //设置当前的VC 为rootVC
    [self.window.rootViewController presentViewController:myVC animated:YES completion:nil];
    
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
      [MagicalRecord cleanUp];
}

@end
