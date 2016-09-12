//
//  ZHZPickView.h
//  yo_park
//
//  Created by zhanghangzhen on 16/7/25.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ZHZPickView;

typedef void(^ZHZSheetpickerViewBlock)(ZHZPickView*v,NSString *seletedStr);

@interface ZHZPickView : UIView

@property (nonatomic,copy)ZHZSheetpickerViewBlock callBack;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *textFont;
//------单条选择器
+(instancetype)initSheetStringPickerWithTitle:(NSArray *)title andHeadTitle:(NSString *)headTitle Andcall:(ZHZSheetpickerViewBlock)callBack;
//显示
-(void)show;
//销毁类
-(void)dismissPicker;



@end
