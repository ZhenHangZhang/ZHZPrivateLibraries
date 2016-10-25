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


#define iPhone5AndEarlyDevice (([[UIScreen mainScreen] bounds].size.height*[[UIScreen mainScreen] bounds].size.width <= 320*568)?YES:NO)
#define Iphone6 (([[UIScreen mainScreen] bounds].size.height*[[UIScreen mainScreen] bounds].size.width <= 375*667)?YES:NO)

static inline float lengthFit(float iphone6PlusLength)
{
    if (iPhone5AndEarlyDevice) {
        return iphone6PlusLength *320.0f/414.0f;
    }
    if (Iphone6) {
        return iphone6PlusLength *375.0f/414.0f;
    }
    return iphone6PlusLength;
}

#define PAN_DISTANCE 120
#define CARD_WIDTH lengthFit(333)
#define CARD_HEIGHT lengthFit(400)




/** 字体*/
#define SXFont(x) [UIFont systemFontOfSize:x]
#define SXBoldFont(x) [UIFont boldSystemFontOfSize:x]

/** 颜色*/
#define SXRGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define SXRGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define SXRGB16Color(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

/** 输出*/
#ifdef DEBUG
#define SXLog(...) NSLog(__VA_ARGS__)
#else
#define SXLog(...)
#endif

/** 获取硬件信息*/
#define SXSCREEN_W [UIScreen mainScreen].bounds.size.width
#define SXSCREEN_H [UIScreen mainScreen].bounds.size.height
#define SXCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
#define SXCurrentSystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]


/** 适配*/
#define SXiOS_5_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0)
#define SXiOS_6_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define SXiOS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define SXiOS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define SXiOS_9_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)

#define SXiPhone4_OR_4s    (SXSCREEN_H == 480)
#define SXiPhone5_OR_5c_OR_5s   (SXSCREEN_H == 568)
#define SXiPhone6_OR_6s   (SXSCREEN_H == 667)
#define SXiPhone6Plus_OR_6sPlus   (SXSCREEN_H == 736)
#define SXiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/** 弱指针*/
#define SXWeakSelf(weakSelf) __weak __typeof(&*self)weakSelf = self;

/** 加载本地文件*/
#define SXLoadImage(file,type) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:type]]
#define SXLoadArray(file,type) [UIImage arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:type]]
#define SXLoadDict(file,type) [UIImage dictionaryWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:type]]

/** 多线程GCD*/
#define SXGlobalGCD(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define SXMainGCD(block) dispatch_async(dispatch_get_main_queue(),block)

/** 数据存储*/
#define SXUserDefaults [NSUserDefaults standardUserDefaults]
#define SXCacheDir [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]
#define SXDocumentDir [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
#define SXTempDir NSTemporaryDirectory()















#endif /* ZHZHeader_h */
