//
//  ZHZTimeChooseView.h
//  yo_park
//
//  Created by zhanghangzhen on 16/7/25.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZHZTimeChooseViewDelegate <NSObject>
//必须实现的两个代理
@required
//当时间改变时触发
- (void)changeTime:(NSDate *)date;
//确定时间
- (void)determine:(NSDate *)date;

@end

@interface ZHZTimeChooseView : UIView
//初始化方法
- (instancetype)initWithFrame:(CGRect)frame type:(UIDatePickerMode)type;
//设置初始时间
- (void)setNowTime:(NSString *)dateStr;

// NSDate --> NSString
- (NSString*)stringFromDate:(NSDate*)date;
//NSDate <-- NSString
- (NSDate*)dateFromString:(NSString*)dateString;
@property (assign,nonatomic)id<ZHZTimeChooseViewDelegate>delegate;
@end
