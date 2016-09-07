//
//  ZHZInfoGuidView.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/7.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHZInfoPage.h"
#import "ZHZInfoGuidScrollView.h"

#define EA_EMPTY_PROPERTY 9999.f

enum ZHZInfoViewTags {
    kTitleLabelTag = 1,
    kDescLabelTag,
    kTitleImageViewTag
};
typedef NS_ENUM(NSUInteger, ZHZViewAlignment) {
    ZHZViewAlignmentLeft,
    ZHZViewAlignmentCenter,
    ZHZViewAlignmentRight,
};

@class ZHZInfoGuidView;

@protocol ZHZGuidViewDelegate <NSObject>

@optional
- (void)introWillFinish:(ZHZInfoGuidView *)introView wasSkipped:(BOOL)wasSkipped;
- (void)introDidFinish:(ZHZInfoGuidView *)introView wasSkipped:(BOOL)wasSkipped;
- (void)intro:(ZHZInfoGuidView *)introView pageAppeared:(ZHZInfoPage *)page withIndex:(NSUInteger)pageIndex;
- (void)intro:(ZHZInfoGuidView *)introView pageStartScrolling:(ZHZInfoPage *)page withIndex:(NSUInteger)pageIndex;
- (void)intro:(ZHZInfoGuidView *)introView pageEndScrolling:(ZHZInfoPage *)page withIndex:(NSUInteger)pageIndex;

// 参数抵消一部分的currentPageIndex currentPageIndex-1和currentPageIndex + 1之间
//例如,滚动左和右从第二页将在范围值(1 . .3),独家
- (void)intro:(ZHZInfoGuidView *)introView didScrollWithOffset:(CGFloat)offset;

@end





@interface ZHZInfoGuidView : UIView<UIScrollViewDelegate>

@property (nonatomic, weak) id<ZHZGuidViewDelegate> delegate;
@property (nonatomic, assign) BOOL swipeToExit;
@property (nonatomic, assign) BOOL tapToNext;
@property (nonatomic, assign) BOOL hideOffscreenPages;
@property (nonatomic, assign) BOOL easeOutCrossDisolves;
@property (nonatomic, assign) BOOL useMotionEffects;
@property (nonatomic, assign) CGFloat motionEffectsRelativeValue;

// 标题视图(Y位置——从屏幕的顶部)
@property (nonatomic, strong) UIView *titleView;
@property (nonatomic, assign) CGFloat titleViewY;

// 背景图片
@property (nonatomic, strong) UIImage *bgImage;
@property (nonatomic, assign) UIViewContentMode bgViewContentMode;

// Page Control(Y位置-从屏幕的底部)
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, assign) CGFloat pageControlY;
@property (nonatomic, assign) NSUInteger currentPageIndex;
@property (nonatomic, assign, readonly) NSUInteger visiblePageIndex;

// Skip 按钮(Y位置-从屏幕的底部)
@property (nonatomic, strong) UIButton *skipButton;
@property (nonatomic, assign) CGFloat skipButtonY;
@property (nonatomic, assign) CGFloat skipButtonSideMargin;
@property (nonatomic, assign) ZHZViewAlignment skipButtonAlignment;
@property (nonatomic, assign) BOOL showSkipButtonOnlyOnLastPage;

@property (nonatomic, assign) NSInteger limitPageIndex;

@property (nonatomic, strong) ZHZInfoGuidScrollView *scrollView;
@property (nonatomic, assign) BOOL scrollingEnabled;
@property (nonatomic, strong) NSArray *pages;

- (id)initWithFrame:(CGRect)frame andPages:(NSArray *)pagesArray;

- (void)showFullscreen;
- (void)showFullscreenWithAnimateDuration:(CGFloat)duration;
- (void)showFullscreenWithAnimateDuration:(CGFloat)duration andInitialPageIndex:(NSUInteger)initialPageIndex;
- (void)showInView:(UIView *)view;
- (void)showInView:(UIView *)view animateDuration:(CGFloat)duration;
- (void)showInView:(UIView *)view animateDuration:(CGFloat)duration withInitialPageIndex:(NSUInteger)initialPageIndex;

- (void)hideWithFadeOutDuration:(CGFloat)duration;

- (void)setCurrentPageIndex:(NSUInteger)currentPageIndex;
- (void)setCurrentPageIndex:(NSUInteger)currentPageIndex animated:(BOOL)animated;


- (void)scrollToPageForIndex:(NSUInteger)newPageIndex animated:(BOOL)animated;



@end
