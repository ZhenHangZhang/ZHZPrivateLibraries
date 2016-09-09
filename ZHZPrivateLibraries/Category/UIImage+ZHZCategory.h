//
//  UIImage+ZHZCategory.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/9.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZHZCategory)


+ (UIImage *)imageResizableNamed:(NSString *)name;

+ (UIImage *)imageWatermarkNamed:(NSString *)watermarkName named:(NSString *)name scale:(CGFloat)scale;

+ (UIImage *)imageRoundNamed:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

+ (UIImage *)imageCaptureWithView:(UIView *)view;

+ (UIImage *)imageWithColor:(UIColor *)color;

- (UIColor *)pixelColorAtLocation:(CGPoint)point;


@end
