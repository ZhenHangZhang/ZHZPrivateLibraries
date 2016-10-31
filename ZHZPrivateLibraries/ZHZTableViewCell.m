//
//  ZHZTableViewCell.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 2016/10/31.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//


#import "ZHZTableViewCell.h"
#import <QuartzCore/QuartzCore.h>


#define PI 3.14159265358979323846


@implementation ZHZTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)drawRect:(CGRect)rect{
    [self drawLine:rect];
    
    [self drawCircle:CGPointMake(30, 30) radius:10];
    
    [self drawCircle:CGPointMake(30, 30) radius:5];
    
}

-(void)drawLine:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    //边缘样式
    CGContextSetLineCap(context, kCGLineCapRound);
    // 线的宽度
    CGContextSetLineWidth(context, 1);
    CGContextSetAllowsAntialiasing(context, true);
    //线的颜色
    CGContextSetRGBStrokeColor(context, 255, 0, 0, 1.0);
    CGContextBeginPath(context);
    //起点
    CGContextMoveToPoint(context, 12, 0);
    //终点坐标
    CGContextAddLineToPoint(context, 12, rect.size.height);
    CGContextStrokePath(context);
}
//画圆
-(void)drawCircle:(CGPoint)center radius:(float)radius{
    //一个不透明类型的Quartz 2D绘画环境,相当于一个画布,你可以在上面任意绘画
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    /*画圆*/
    UIColor *acolor = nil;
    if (radius == 5) {
        acolor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1];
    }else{
        acolor = [UIColor colorWithRed:255 green:194 blue:0 alpha:1];
    }
    CGContextSetFillColorWithColor(context, acolor.CGColor);//填充颜色
    CGContextSetLineWidth(context, 0.1);//线的宽度
    CGContextAddArc(context, 12, center.y, radius, 0, 2*PI, 0);
    //添加一个圆
    //kCGPathFill填充非零绕数规则,kCGPathEOFill表示用奇偶规则,kCGPathStroke路径,kCGPathFillStroke路径填充,kCGPathEOFillStroke表示描线，不是填充
    CGContextDrawPath(context, kCGPathFillStroke); //绘制路径加填充
}





@end
