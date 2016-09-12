//
//  ZHZScaleImageView.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/9.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "ZHZScaleImageView.h"

@interface ZHZScaleImageView ()

@property(nonatomic,strong)UIView*headerView;



@end

static CGFloat const upFactor    = 0.5;
static CGFloat const scaleFactor = 0.005;

@implementation ZHZScaleImageView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self prepareLayout];
    }
    return self;
}

- (void)prepareLayout {
    
    CGFloat screenWidth    = [UIScreen mainScreen].bounds.size.width;
    self.bounds            = (CGRect) {CGPointZero,screenWidth,screenWidth};
    self.layer.position    = (CGPoint){screenWidth * 0.5f, - screenWidth * 0.25f};
    self.layer.anchorPoint = (CGPoint){0.5f, 0};
}

- (UIView *)tableHeaderView {
    
    if (!_headerView) {
        _headerView = [UIView new];
    }
    return _headerView;
}

- (void)setTableView:(UITableView *)tableView {
    _tableView = tableView;
    [tableView insertSubview:self atIndex:0];
    [tableView setTableHeaderView:self.headerView];
}

- (void)scaleWithScrollViewContentOffset:(CGPoint)contentOffset {
    
    CGFloat contentOffsetY = contentOffset.y;
    CGFloat point          = -(self.frame.size.height / 6) / (1 - upFactor);
    
    if (contentOffsetY > 0) return;
    if (contentOffsetY >= point) {
        self.transform = CGAffineTransformMakeTranslation(0, contentOffsetY * upFactor);
    } else {
        CGAffineTransform transform = CGAffineTransformMakeTranslation(0, contentOffsetY - point * (1 - upFactor));
        CGFloat scale = 1 + (point - contentOffsetY) * scaleFactor;
        self.transform = CGAffineTransformScale(transform, scale, scale);
    }
}


@end
