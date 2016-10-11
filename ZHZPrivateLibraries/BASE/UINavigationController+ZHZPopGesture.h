//
//  UINavigationController+ZHZPopGesture.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/10/11.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <UIKit/UIKit.h>


/**使用方法：防止右滑返回手势在mapview scrollview的时候失灵
 * // scrollView需要支持侧滑返回
 [self tz_addPopGestureToView:scrollView];
 // collectionView需要支持侧滑返回
 [self tz_addPopGestureToView:collectionView];
 // mapView需要支持侧滑返回
 [self tz_addPopGestureToView:mapView];

 **/




@interface UINavigationController (ZHZPopGesture)<UIGestureRecognizerDelegate,UINavigationControllerDelegate>


@end

@interface UIViewController (ZHZPopGesture)

- (void)zhz_addPopGestureToView:(UIView *)view;


@end
