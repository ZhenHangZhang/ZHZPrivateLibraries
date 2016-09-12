//
//  ZHZPregressLayer.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/9.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface ZHZPregressLayer : CALayer
@property (nonatomic, assign) float progress;

@property (nonatomic, assign) float startAngle;

@property (nonatomic, strong) UIColor * tintColor;

@property (nonatomic, strong) UIColor * trackColor;


@end
