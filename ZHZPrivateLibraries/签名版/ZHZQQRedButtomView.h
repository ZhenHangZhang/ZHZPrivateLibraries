//
//  ZHZQQRedButtomView.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/9.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, ZHZBadgeViewAlignment) {
    
    ZHZBadgeViewAlignmentTopLeft = 0,
    ZHZBadgeViewAlignmentTopRight,
    ZHZBadgeViewAlignmentTopCenter,
    ZHZBadgeViewAlignmentCenter,
    ZHZBadgeViewAlignmentCenterLeft,
    ZHZBadgeViewAlignmentCenterRight,
    ZHZBadgeViewAlignmentBottomLeft,
    ZHZBadgeViewAlignmentBottomRight,
    ZHZBadgeViewAlignmentBottomCenter
};
@interface ZHZQQRedButtomView : UIView


@property (nonatomic,assign) ZHZBadgeViewAlignment badgeViewAlignment;

@property (nonatomic,strong) UIView   * attachView;

@property (nonatomic,strong) NSString * badgeText;

@property (nonatomic,assign) CGFloat    maxDistance;

@property (nonatomic,assign) BOOL       panable;


@property (nonatomic,assign) CGFloat    badgeViewCornerRadius;

@property (nonatomic,strong) UIColor  * badgeTextColor;

@property (nonatomic,strong) UIFont   * badgeTextFont;

@property (nonatomic,strong) UIColor  * badgeBackgroundColor;

@property (nonatomic,assign) CGSize     badgeTextShadowSize;

@property (nonatomic,strong) UIColor  * badgeTextShadowColor;

@property (nonatomic,strong) UIColor  * badgeShadowColor;

@property (nonatomic,assign) CGSize     badgeShadowSize;

@property (nonatomic,assign) CGFloat    badgeStrokeWidth;

@property (nonatomic,strong) UIColor  * badgeStrokeColor;

@property (nonatomic,assign) CGPoint    badgePositionAdjustment;

@property (nonatomic,assign) CGFloat    badgeMinWidth;



@end
