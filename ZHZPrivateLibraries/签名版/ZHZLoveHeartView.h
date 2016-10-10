//
//  ZHZLoveHeartView.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/30.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DMRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define DMRGBAColor(r, g, b ,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define RandColor DMRGBColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))


@interface ZHZLoveHeartView : UIView


- (void)animateInView:(UIView *)view;

@end
