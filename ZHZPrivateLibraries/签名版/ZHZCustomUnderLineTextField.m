

//
//  ZHZCustomUnderLineTextField.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/10/12.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "ZHZCustomUnderLineTextField.h"

@implementation ZHZCustomUnderLineTextField


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        UIColor* color = [UIColor whiteColor];
        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"邮箱" attributes:@{ NSForegroundColorAttributeName : color }];
        //[self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //Get the current drawing context
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //Set the line color and width
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:161 green:163 blue:168 alpha:0.2f].CGColor);
    CGContextSetLineWidth(context, 1.0f);
    
    
    //Start a new Path
    CGContextBeginPath(context);
    
    
    
    //Set the line offset from the baseline. (I'm sure there's a concrete way to calculate this.)
    CGFloat baselineOffset = 45.0f;
    
    //iterate over numberOfLines and draw each line
    //for (int x = 1; x < numberOfLines; x++) {
    
    //0.5f offset lines up line with pixel boundary
    CGContextMoveToPoint(context, self.bounds.origin.x,baselineOffset);
    CGContextAddLineToPoint(context, self.bounds.size.width-10, baselineOffset);
    //}
    
    //Close our Path and Stroke (draw) it
    CGContextClosePath(context);
    CGContextStrokePath(context);

    
}


@end
