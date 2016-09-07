//
//  ZHZInfoGuidScrollView.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/7.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHZInfoGuidScrollView : UIScrollView
/**
 *  这个属性会导致containerView。子视图——所有子视图除了滚动指标都存储在那里。
 */
@property (nonatomic, copy, readonly) NSArray<UIView *> *containedSubviews;

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wproperty-attribute-mismatch"
/**
 *  当访问该属性与通过容器抵消将用于计算终值,这样你就可以忘记implemetation细节。还在于坐标空间的“contentView”
 */
@property (nonatomic, assign, getter=alignedContentOffset, setter=setAlignedContentOffset:) CGPoint contentOffset;
#pragma GCC diagnostic pop

/**
*这是矩形属性定义限制区域的坐标空间“contentView”。使用CGRectZero重置限制。
 */
@property (nonatomic, assign) CGRect restrictionArea;

/**
 *不应使用,因为它改变父内容偏移被操纵的子类。
 *
 *  @see contentOffset
 */
- (void)setContentOffset:(CGPoint)contentOffset __attribute__((unavailable("use dot notation to access property")));

/**
*不应使用,因为它会导致父母被子类操纵内容偏移。
 *
 *  @see contentOffset
 */
- (CGPoint)contentOffset __attribute__((unavailable("use dot notation to access property")));
@end
