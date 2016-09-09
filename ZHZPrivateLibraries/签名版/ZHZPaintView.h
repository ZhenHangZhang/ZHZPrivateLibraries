//
//  ZHZPaintView.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/9.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHZPaintView : UIView

@property (nonatomic,strong) UIColor * lineColor;

@property (nonatomic,assign) CGFloat   lineWidth;

- (void)clear;

- (void)back;

- (void)save;


@end
