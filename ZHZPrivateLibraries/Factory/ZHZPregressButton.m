
//
//  ZHZPregressButton.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/9.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "ZHZPregressButton.h"

#import "ZHZPregressLayer.h"


@implementation ZHZPregressButton

+ (Class)layerClass {
    return [ZHZPregressLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setupDefaultParameters];
    }
    return self;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self setupDefaultParameters];
    }
    return self;
}

- (void)setupDefaultParameters {
    self.backgroundColor = [UIColor clearColor];
    self.opaque          = NO;
    self.tintColor       = [UIColor redColor];
    self.trackColor      = [UIColor whiteColor];
    self.startAngle      = ((-90) / 180.0f * M_PI);
}

- (float) progress {
    ZHZPregressLayer *layer = (ZHZPregressLayer *)self.layer;
    return layer.progress;
}

- (void) setProgress:(float)progress {
    BOOL growing = progress > self.progress;
    [self setProgress:progress animated:growing];
}

- (void) setProgress:(float)progress animated:(BOOL)animated {
    
    if(progress < 0.0f) {
        progress = 0.0f;
    } else if(progress > 1.0f) {
        progress = 1.0f;
    }
    
    ZHZPregressLayer *layer = (ZHZPregressLayer *)self.layer;
    if(animated) {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"progress"];
        animation.duration = 0.25;
        animation.fromValue = [NSNumber numberWithFloat:layer.progress];
        animation.toValue = [NSNumber numberWithFloat:progress];
        [layer addAnimation:animation forKey:@"progressAnimation"];
        layer.progress = progress;
        [layer setNeedsDisplay];
    } else {
        layer.progress = progress;
        [layer setNeedsDisplay];
    }
}

- (UIColor *)tintcolor {
    ZHZPregressLayer *layer = (ZHZPregressLayer *)self.layer;
    return layer.tintColor;
}

- (void) setTintColor:(UIColor *)tintColor {
    ZHZPregressLayer *layer = (ZHZPregressLayer *)self.layer;
    layer.tintColor = tintColor;
    [layer setNeedsDisplay];
}

- (UIColor *)trackColor {
    ZHZPregressLayer *layer = (ZHZPregressLayer *)self.layer;
    return layer.trackColor;
}

- (void) setTrackColor:(UIColor *)trackColor {
    ZHZPregressLayer *layer = (ZHZPregressLayer *)self.layer;
    layer.trackColor = trackColor;
    [layer setNeedsDisplay];
}

- (float) startAngle {
    ZHZPregressLayer *layer = (ZHZPregressLayer *)self.layer;
    return layer.startAngle;
}

- (void) setStartAngle:(float)startAngle {
    ZHZPregressLayer *layer = (ZHZPregressLayer *)self.layer;
    layer.startAngle = startAngle;
    [layer setNeedsDisplay];
}

@end
