//
//  ZHZCustomMenu.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/20.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZHZCustomMenuItem.h"

typedef void(^ZHZMenuSelectedItem)(NSInteger index, ZHZCustomMenuItem *item);

typedef enum {

    ZHZMenuBackgrounColorEffectSolid      = 0, //!<背景显示效果.纯色
    ZHZMenuBackgrounColorEffectGradient   = 1, //!<背景显示效果.渐变叠加
} ZHZMenuBackgrounColorEffect;



@interface ZHZCustomMenu : NSObject

+ (void)showMenuInView:(UIView *)view fromRect:(CGRect)rect menuItems:(NSArray *)menuItems selected:(ZHZMenuSelectedItem)selectedItem;

+ (void)dismissMenu;
+ (BOOL)isShow;

// 主题色
+ (UIColor *)tintColor;
+ (void)setTintColor:(UIColor *)tintColor;

// 标题字体
+ (UIFont *)titleFont;
+ (void)setTitleFont:(UIFont *)titleFont;

// 背景效果
+ (ZHZMenuBackgrounColorEffect)backgrounColorEffect;
+ (void)setBackgrounColorEffect:(ZHZMenuBackgrounColorEffect)effect;

// 是否显示阴影
+ (BOOL)hasShadow;
+ (void)setHasShadow:(BOOL)flag;






@end
