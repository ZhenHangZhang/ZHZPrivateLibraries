//
//  ZHZPregressLayer.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/9.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "ZHZPregressLayer.h"

@implementation ZHZPregressLayer
- (instancetype)initWithLayer:(id)layer {
    
    self = [super initWithLayer:layer];
    if(self) {
        if([layer isKindOfClass:[ZHZPregressLayer class]]) {
            ZHZPregressLayer * progressLayer = layer;
            self.progress   = progressLayer.progress;
            self.startAngle = progressLayer.startAngle;
            self.tintColor  = progressLayer.tintColor;
            self.trackColor = progressLayer.trackColor;
        }
    }
    return self;
}

+ (BOOL)needsDisplayForKey:(NSString *)key {
    
    if([key isEqualToString:@"progress"]) {
        return YES;
    } else {
        return [super needsDisplayForKey:key];
    }
}

- (void)drawInContext:(CGContextRef)context {
    
    CGFloat radius = MIN(self.bounds.size.width, self.bounds.size.height) / 2.0;
    CGPoint center = {self.bounds.size.width / 2.0, self.bounds.size.height / 2.0};
    
    CGRect circleRect = {center.x - radius, center.y - radius, radius * 2.0, radius * 2.0};
    CGContextAddEllipseInRect(context, circleRect);
    
    CGContextSetFillColorWithColor(context, self.trackColor.CGColor);
    CGContextFillPath(context);
    
    CGContextAddArc(context, center.x, center.y, radius, self.startAngle, self.startAngle + self.progress * 2.0 * M_PI, 0);
    CGContextAddLineToPoint(context, center.x, center.y);
    CGContextClosePath(context);
    
    CGContextSetFillColorWithColor(context, self.tintColor.CGColor);
    CGContextFillPath(context);
}

@end
