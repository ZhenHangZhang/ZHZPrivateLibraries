//
//  CalendarCell.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/10/14.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "CalendarCell.h"

@implementation CalendarCell
- (UILabel *)dateLabel
{
    if (!_dateLabel) {
        UILabel *label = [[UILabel alloc] init];
        _dateLabel = label;
        _dateLabel.layer.cornerRadius = 10.0f;
        _dateLabel.clipsToBounds = YES;
        [_dateLabel setTextAlignment:NSTextAlignmentCenter];
        [_dateLabel setFont:[UIFont boldSystemFontOfSize:13]];
        [self addSubview:_dateLabel];
    }
    return _dateLabel;
}

- (void)layoutSubviews {
    
    CGFloat width = self.bounds.size.width;
    CGFloat heigth = self.bounds.size.height;
    _dateLabel.frame = CGRectMake(2, 2, width - 4, heigth - 4);
}
@end
