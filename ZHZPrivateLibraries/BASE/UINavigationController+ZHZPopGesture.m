

//
//  UINavigationController+ZHZPopGesture.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/10/11.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "UINavigationController+ZHZPopGesture.h"
#import <objc/runtime.h>


@interface UINavigationController (ZHZPopGesturePrivate)

@property (nonatomic, weak, readonly) id zhz_naviDelegate;
@property (nonatomic, weak, readonly) id zhz_popDelegate;

@end



@implementation UINavigationController (ZHZPopGesture)

+(void)load{

    Method originalMethod = class_getInstanceMethod(self, @selector(viewWillAppear:));
    Method swizzledMethod = class_getInstanceMethod(self, @selector(zhzPop_viewWillAppear:));
    method_exchangeImplementations(originalMethod, swizzledMethod);
}
-(void)zhzPop_viewWillAppear:(BOOL)animated{
    [self zhzPop_viewWillAppear:animated];
    // 只是为了触发zhz_PopDelegate的get方法，获取到原始的interactivePopGestureRecognizer的delegate
    [self.zhz_popDelegate class];
    //获取导航栏的代理
    [self.zhz_naviDelegate class];
    
    self.delegate = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.delegate = self.zhz_naviDelegate;
    });
}
- (id)zhz_popDelegate {
    id zhz_popDelegate = objc_getAssociatedObject(self, _cmd);
    if (!zhz_popDelegate) {
        zhz_popDelegate = self.interactivePopGestureRecognizer.delegate;
        objc_setAssociatedObject(self, _cmd, zhz_popDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return zhz_popDelegate;
}

- (id)zhz_naviDelegate {
    id zhz_naviDelegate = objc_getAssociatedObject(self, _cmd);
    if (!zhz_naviDelegate) {
        zhz_naviDelegate = self.delegate;
        if (zhz_naviDelegate) {
            objc_setAssociatedObject(self, _cmd, zhz_naviDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    return zhz_naviDelegate;
}
#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
    if ([[self valueForKey:@"_isTransitioning"] boolValue]) {
        return NO;
    }
    if (self.childViewControllers.count <= 1) {
        return NO;
    }
    // 侧滑手势触发位置
    CGPoint location = [gestureRecognizer locationInView:self.view];
    CGPoint offSet = [gestureRecognizer translationInView:gestureRecognizer.view];
    BOOL ret = (0 < offSet.x && location.x <= 40);
    // NSLog(@"%@ %@",NSStringFromCGPoint(location),NSStringFromCGPoint(offSet));
    return ret;
}

/// 只有当系统侧滑手势失败了，才去触发ScrollView的滑动
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 让系统的侧滑返回生效
    self.interactivePopGestureRecognizer.enabled = YES;
    if (viewController == self.viewControllers[0]) {
        self.interactivePopGestureRecognizer.delegate = self.zhz_popDelegate; // 不支持侧滑
    } else {
        self.interactivePopGestureRecognizer.delegate = nil; // 支持侧滑
    }
}
@end

@interface UIViewController (ZHZPopGesturePrivate)
@property (nonatomic, strong, readonly) UIPanGestureRecognizer *tz_popGestureRecognizer;
@end

@implementation UIViewController (ZHZPopGesture)

- (void)zhz_addPopGestureToView:(UIView *)view {
    if (!view) return;
    if (!self.navigationController) {
        // 在控制器转场的时候，self.navigationController可能是nil,这里用GCD和递归来处理这种情况
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self zhz_addPopGestureToView:view];
        });
    } else {
        UIPanGestureRecognizer *pan = self.tz_popGestureRecognizer;
        if (![view.gestureRecognizers containsObject:pan]) {
            [view addGestureRecognizer:pan];
        }
    }
}

- (UIPanGestureRecognizer *)tz_popGestureRecognizer {
    UIPanGestureRecognizer *pan = objc_getAssociatedObject(self, _cmd);
    if (!pan) {
        // 侧滑返回手势 手势触发的时候，让target执行action
        id target = self.navigationController.zhz_popDelegate;
        SEL action = NSSelectorFromString(@"handleNavigationTransition:");
        pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:action];
        pan.maximumNumberOfTouches = 1;
        pan.delegate = self.navigationController;
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
        objc_setAssociatedObject(self, _cmd, pan, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return pan;
}
@end








