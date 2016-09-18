//
//  UIView+Categroy.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/9.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^ZHZWhenTappedBlock)();


@interface UIView (Categroy)<UIGestureRecognizerDelegate>

@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

/**
 *  X
 *
 *  @return
 */
- (CGFloat)xMax;
/**
 *  X/2
 *
 *  @return
 */
- (CGFloat)xMiddle;
/**
 *  X的坐标
 *
 *  @return
 */
- (CGFloat)x;

/**
 *         Y
 *
 *  @return
 */
- (CGFloat)yMax;
/**
 *         Y/2
 *
 *  @return
 */

- (CGFloat)yMiddle;


/**
 *         Y的坐标
 *
 *  @return
 */
- (CGFloat)y;


/**
 *         宽度
 *
 *  @return
 */
- (CGFloat)width;

/**
 *         高度
 *
 *  @return
 */

- (CGFloat)height;



@property (nonatomic, assign) CGFloat bottom;







/**
 *  移除View中的所有子视图
 */
- (void)removeAllSubviews;

/**
 *    手势：被点击的时候
 *
 *  @param block
 */
- (void)whenTapped:(ZHZWhenTappedBlock)block;

/**
 *  手势：被点击两次
 *
 *  @param block
 */
- (void)whenDoubleTapped:(ZHZWhenTappedBlock)block;

/**
 *  两个手指点击
 *
 *  @param block
 */
- (void)whenTwoFingerTapped:(ZHZWhenTappedBlock)block;


/**
 *  上移
 *
 *  @param block
 */
- (void)whenTouchedDown:(ZHZWhenTappedBlock)block;

/**
 *  下移
 *
 *  @param block 
 */
- (void)whenTouchedUp:(ZHZWhenTappedBlock)block;







@end
