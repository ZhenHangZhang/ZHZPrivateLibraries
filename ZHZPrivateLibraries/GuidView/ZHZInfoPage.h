//
//  ZHZInfoPage.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/7.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^CallBack)();

@interface ZHZInfoPage : NSObject
//背景图像或颜色用于淡入淡出
@property (nonatomic, strong) UIImage *bgImage;
@property (nonatomic, strong) UIColor *bgColor;

// 显示或隐藏  titleView这个页面上(default YES)
@property (nonatomic, assign) BOOL showTitleView;



@property (nonatomic, strong) UIView * titleIconView;

@property (nonatomic, assign) CGFloat titleIconPositionY;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, assign) CGFloat titlePositionY;
@property (nonatomic, assign) NSTextAlignment titleAlignment;

@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) UIFont *descFont;
@property (nonatomic, strong) UIColor *descColor;
@property (nonatomic, assign) CGFloat descPositionY;
@property (nonatomic, assign) CGFloat descSideMargin;
@property (nonatomic, assign) NSTextAlignment descAlignment;

@property (nonatomic, strong) NSArray *subviews;
@property (nonatomic, assign) CGFloat alpha;

@property (nonatomic,copy) CallBack onPageDidLoad;
@property (nonatomic,copy) CallBack onPageDidAppear;
@property (nonatomic,copy) CallBack onPageDidDisappear;

//如果设置customView——所有其他默认属性将被忽略
@property (nonatomic, strong) UIView *customView;

@property(nonatomic, strong, readonly) UIView *pageView;

+ (instancetype)page;

+ (instancetype)pageWithCustomView:(UIView *)customV;
+ (instancetype)pageWithCustomViewFromNibNamed:(NSString *)nibName;
+ (instancetype)pageWithCustomViewFromNibNamed:(NSString *)nibName bundle:(NSBundle*)aBundle;

@end
