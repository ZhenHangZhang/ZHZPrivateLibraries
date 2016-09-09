//
//  ZHZHeader.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/7.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#ifndef ZHZHeader_h
#define ZHZHeader_h

#import "ZHZFactory.h"
//宏定义请求接口，
#define URL_INFODICT       (@"http://b2c.ezparking.com.cn/rtpi-service/misc/token.do?deviceId=%@&app=com.ezparking.ios.qibutingche&version=%@")
//宏定义一个颜色RGB的
#define ZHZ_RGBValue(r, g, b)    [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]
//宏定义宽高
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
// 是否为机型iPhone5
#define IS_IPHONE5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
// 是否为系统版本iOS7
#define iOS7    ([[UIDevice currentDevice].systemVersion doubleValue] > 7.0)
//数据储存
#define ZHZUserDefaults [NSUserDefaults standardUserDefaults]
//解决循环引用的问题
#define DefineWeakSelf __weak __typeof(self) weakSelf = self
//导航栏的字体
#define HMNavigationTitleFont [UIFont boldSystemFontOfSize:20]





#endif /* ZHZHeader_h */
