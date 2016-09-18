//
//  ZHZCustomActionSheetView.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/18.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ZHZCustomActionSheetView;
typedef void(^ZHZCustomActionSheetItemClickHandle)(ZHZCustomActionSheetView *actionSheet, NSInteger currentIndex, NSString *title);


@interface ZHZCustomActionSheetView : UIView
/**
 *  初始化
 *
 *  @param cancelTitle 取消
 *  @param alertTitle  提示文字
 *  @param title       子控件文本
 */
+ (instancetype)actionSheetWithCancelTitle:(NSString *)cancelTitle alertTitle:(NSString *)alertTitle SubTitles:(NSString *)title,...NS_REQUIRES_NIL_TERMINATION;

- (void)setCustomActionSheetItemClickHandle:(ZHZCustomActionSheetItemClickHandle)itemClickHandle;

- (void)setActionSheetDismissItemClickHandle:(ZHZCustomActionSheetItemClickHandle)dismissItemClickHandle;

- (void)show;

@end
