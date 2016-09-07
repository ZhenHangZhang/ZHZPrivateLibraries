//
//  ZHZCustomAlertView.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/7.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZHZCustomAlertViewDelegate;


typedef enum
{
    ZHZAlertViewAnimationTypeNone        = 0,
    ZHZAlertViewAnimationTypeDefault     = 1,
    ZHZAlertViewAnimationTypeFadeIn      = 2,
    ZHZAlertViewAnimationTypeFaceOut     = 3,
    ZHZAlertViewAnimationTypeFlyTop      = 4,
    ZHZAlertViewAnimationTypeFlyBottom   = 5,
    ZHZAlertViewAnimationTypeFlyLeft     = 6,
    ZHZAlertViewAnimationTypeFlyRight    = 7,
    ZHZAlertViewAnimationTypeZoomIn      = 8,
    ZHZAlertViewAnimationTypeZoomOut     = 9
    
} ZHZCustomAlertViewAnimationType;


typedef void(^ZHZCustomAlertViewBlock)();

@interface ZHZCustomAlertView : UIView
//设置自定义警告视图框架,如果这个属性没有设置警报将显示在视图的中心
@property (nonatomic, assign) CGRect customFrame; // Default is same as UIAlertView

// 设置警报视图的内容视图
// 警报视图的框架将调整基于帧的内容的观点,所以你不需要设置自定义框架。如果你想要警告视图不显示中心,设置警告视图的中心
@property (nonatomic, strong) UIView *contentView;

// 你可以定制外表按钮和标签
@property (nonatomic, strong) UIButton * cancelButton; // Default is in blue color and system font 16
@property (nonatomic, strong) UIButton * otherButton; // Default is in blue color and system font 16
@property (nonatomic, strong) UILabel * titleLabel; // Default is in black color and system bold font 16
@property (nonatomic, strong) UILabel * messageLabel; // Default is in gray color and system font 14


// 设置标题和按钮的高度,填充元素。消息标签高度计算基于其文字和字体
@property (nonatomic, assign) CGFloat buttonHeight; // Default is 44
@property (nonatomic, assign) CGFloat titleHeight; // Default is 34

@property (nonatomic, assign) CGFloat titleTopPadding; //Default is 14
@property (nonatomic, assign) CGFloat titleBottomPadding; // Default is 2
@property (nonatomic, assign) CGFloat messageBottomPadding; // Default is 20
@property (nonatomic, assign) CGFloat messageLeftRightPadding; // Default is 20


// 自定义背景和边界
@property (nonatomic, strong) UIColor * borderColor; // Default is no border
@property (nonatomic, assign) CGFloat borderWidth; // Default is 0
@property (nonatomic, assign) CGFloat cornerRadius; // Default is 8

@property (nonatomic, strong) UIImage * backgroundImage; // Default is nil


// 定制分离器  Default is NO
@property (nonatomic, assign) BOOL hideSeperator;
@property (nonatomic, strong) UIColor * separatorColor; // Default is same as UIAlertView


// 出现和消失的自定义动画
@property (nonatomic, assign) ZHZCustomAlertViewAnimationType appearAnimationType;
@property (nonatomic, assign) ZHZCustomAlertViewAnimationType disappearAnimationType;
@property (nonatomic, assign) NSTimeInterval appearTime; // Default is 0.2
@property (nonatomic, assign) NSTimeInterval disappearTime; // Default is 0.1


// 使取消按钮出现在右侧 的设置为YES  Default is NO

@property (nonatomic, assign) BOOL cancelButtonPositionRight;

// 禁用按钮高亮通过设置这个属性  Default is YES

@property (nonatomic, assign) BOOL buttonClickedHighlight;

// 默认情况下,警报不会解雇如果点击其他按钮  Default is YES
@property (nonatomic, assign) BOOL shouldDismissOnActionButtonClicked;

//如果这个属性是肯定的,外面的警报会认为当你点击(只有当昏暗的背景是启用) Default is NO
@property (nonatomic, assign) BOOL shouldDismissOnOutsideTapped;
//当窗口所示,昏暗的背景总是启用 Default is YES
@property (nonatomic, assign) BOOL shouldDimBackgroundWhenShowInWindow;

// 当视图所示,昏暗的背景总是禁用 Default is NO
@property (nonatomic, assign) BOOL shouldDimBackgroundWhenShowInView;

// 默认0.2
@property (nonatomic, assign) CGFloat dimAlpha;

// 代理
@property (nonatomic, strong) id<ZHZCustomAlertViewDelegate> delegate;

//取消按钮回调
@property (readwrite, copy) ZHZCustomAlertViewBlock cancelButtonAction;
@property (readwrite, copy) ZHZCustomAlertViewBlock otherButtonAction;

#pragma mark - Public Methods

// Initialize method, same as UIAlertView
// On the current version, the alert does not support more than one other buttons
// If you pass the title by nil, the alert will be no title. If you pass the otherButtonTitle by nil, the alert will only have cancel button. You can remove all buttons by set all buton titles to nil.
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id /*<DQAlertViewDelegate>*/)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...;

// 如果你通过标题nil,警报将无标题。如果你通过otherButtonTitle nil,警报将只有取消按钮。你可以删除所有按钮设置所有buton标题为零。
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle;

/**
 *  回调 弹框按钮回调
 *
 *  @param cancelHandler 取消按钮
 *  @param otherHandler  其他的按钮
 */
- (void)actionWithBlocksCancelButtonHandler:(void (^)(void))cancelHandler otherButtonHandler:(void (^)(void))otherHandler;

/**
 *  默认展示在View的中心
 *
 *  @param view 弹出的View的父视图
 */
- (void)showInView:(UIView *)view;
/**
 *  弹窗创建好的话展示
 */
- (void)show;
/**
 *  消失
 */
- (void)dismiss;


@end


#pragma mark -代理方法-
@protocol ZHZCustomAlertViewDelegate <NSObject>

@optional
/**
 *  将要展现
 *
 *  @param alertView alertView description
 */
- (void)willAppearAlertView:(ZHZCustomAlertView *)alertView;
/**
 * 已经展现
 *
 *  @param alertView alertView description
 */
- (void)didAppearAlertView:(ZHZCustomAlertView *)alertView;
/**
 *  取消按钮
 *
 *  @param alertView
 */
- (void)cancelButtonClickedOnAlertView:(ZHZCustomAlertView *)alertView;
/**
 * 点击其他按钮
 *
 *  @param alertView alertView description
 */
- (void)otherButtonClickedOnAlertView:(ZHZCustomAlertView *)alertView;

@end