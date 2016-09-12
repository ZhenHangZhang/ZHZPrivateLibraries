//
//  ZHZPregressButton.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/9.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHZPregressButton : UIButton
@property (nonatomic, assign) float progress;

@property (nonatomic, assign) float startAngle;


@property (nonatomic, strong) UIColor *tintcolor ;

@property (nonatomic, strong) UIColor *trackColor;

- (void)setProgress:(float)progress animated:(BOOL)animated;
@end
