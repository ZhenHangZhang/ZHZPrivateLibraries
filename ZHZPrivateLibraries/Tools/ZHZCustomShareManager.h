//
//  ZHZCustomShareManager.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/18.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/**
 *  三方类型
 */
typedef NS_ENUM(NSUInteger, ZHZCustomShareType) {
    /** QQ*/
    ZHZCustomShareTypeQQ = 1,
    /** QQ空间*/
    ZHZCustomShareTypeQZone,
    /** 微信会话*/
    ZHZCustomShareTypeWechatSession,
    /** 微信朋友圈*/
    ZHZCustomShareTypeWechat,
    /** 微博*/
    ZHZCustomShareTypeWeibo,
};




@interface ZHZCustomShareManager : NSObject


- (void)shareWithSharedType:(ZHZCustomShareType)shareType
                      image:(UIImage *)image
                        url:(NSString *)url
                    content:(NSString *)content
                 controller:(UIViewController *)controller;

- (void)registerAllPlatForms;

@end
