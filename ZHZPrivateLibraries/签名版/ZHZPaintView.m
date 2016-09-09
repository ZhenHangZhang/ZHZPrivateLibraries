//
//  ZHZPaintView.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/9.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "ZHZPaintView.h"
#import "UIImage+ZHZCategory.h"

@interface ZHZPaintView()

@property (nonatomic, strong) NSMutableArray * linePaths;

@end


@implementation ZHZPaintView

- (NSMutableArray *)linePaths {
    
    if (!_linePaths) {
        _linePaths = @[].mutableCopy;
    }
    return _linePaths;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch * touch = [touches anyObject];
    CGPoint   point = [touch locationInView:touch.view];
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    
    [path moveToPoint:point];
    [self.linePaths addObject:path];
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch * touch = [touches anyObject];
    CGPoint   point = [touch locationInView:touch.view];
    
    UIBezierPath * path = [self.linePaths lastObject];
    [path addLineToPoint:point];
    
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self touchesMoved:touches withEvent:event];
}

- (void)drawRect:(CGRect)rect {
    
    [self.lineColor set];
    [self.linePaths enumerateObjectsUsingBlock:^(UIBezierPath * path, NSUInteger idx, BOOL * stop) {
        [path setLineWidth:self.lineWidth];
        [path stroke];
    }];
}

- (void)clear {
    [self.linePaths removeAllObjects];
    [self setNeedsDisplay];
}

- (void)back {
    [self.linePaths removeLastObject];
    [self setNeedsDisplay];
}

- (void)save {
    UIImageWriteToSavedPhotosAlbum([UIImage imageCaptureWithView:self], self, nil, nil);
}

@end
