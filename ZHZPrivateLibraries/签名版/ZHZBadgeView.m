
//
//  ZHZBadgeView.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/9.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "ZHZBadgeView.h"

@implementation ZHZBadgeView
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self prepareForSetup];
    }
    return self;
}

- (void)prepareForSetup {
    [self setHidden:YES];
    [self setUserInteractionEnabled:NO];
    
    [self setBackgroundColor:[UIColor purpleColor]];
    self.backgroundColor = [UIColor purpleColor];
    //    [self setBackgroundImage:[UIImage imageResizableNamed:@""] forState:UIControlStateNormal];
    [self.titleLabel setFont:[UIFont systemFontOfSize:11]];
}

- (void)setBadgeValue:(NSString *)badgeValue {
    
    _badgeValue = badgeValue.copy;
    
    if (badgeValue) {
        [self setHidden:NO];
        [self setTitle:badgeValue forState:UIControlStateNormal];
        
        CGRect frame   = self.frame;
        CGFloat badgeW = self.currentBackgroundImage.size.width;
        CGFloat badgeH = self.currentBackgroundImage.size.height;
        if (badgeValue.length > 1) {
            CGSize badgeSize = [badgeValue sizeWithAttributes:@{NSFontAttributeName : self.titleLabel.font}];
            badgeW = badgeSize.width + 10;
        }
        frame.size.width = badgeW;
        frame.size.height = badgeH;
        self.frame = frame;
    } else {
        self.hidden = YES;
    }
}

@end
