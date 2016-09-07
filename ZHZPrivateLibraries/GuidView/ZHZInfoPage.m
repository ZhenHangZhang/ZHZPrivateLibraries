//
//  ZHZInfoPage.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/7.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "ZHZInfoPage.h"


#define DEFAULT_DESCRIPTION_LABEL_SIDE_PADDING 25
#define DEFAULT_TITLE_FONT [UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0]
#define DEFAULT_LABEL_COLOR [UIColor whiteColor]
#define DEFAULT_BG_COLOR [UIColor clearColor]
#define DEFAULT_DESCRIPTION_FONT [UIFont fontWithName:@"HelveticaNeue-Light" size:13.0]
#define DEFAULT_TITLE_IMAGE_Y_POSITION 50.0f
#define DEFAULT_TITLE_LABEL_Y_POSITION 160.0f
#define DEFAULT_DESCRIPTION_LABEL_Y_POSITION 140.0f
#define DEFAULT_DESCRIPTION_LABEL_SIDE_MARGIN 10.0f

@interface ZHZInfoPage ()

@property(nonatomic, strong, readwrite) UIView *pageView;

@end

@implementation ZHZInfoPage
#pragma mark - Page lifecycle

- (instancetype)init {
    if (self = [super init]) {
        _titleIconPositionY = DEFAULT_TITLE_IMAGE_Y_POSITION;
        _titlePositionY  = DEFAULT_TITLE_LABEL_Y_POSITION;
        _descPositionY   = DEFAULT_DESCRIPTION_LABEL_Y_POSITION;
        _descSideMargin   = DEFAULT_DESCRIPTION_LABEL_SIDE_MARGIN;
        _title = @"";
        _titleFont = DEFAULT_TITLE_FONT;
        _titleColor = DEFAULT_LABEL_COLOR;
        _titleAlignment = NSTextAlignmentCenter;
        _desc = @"";
        _descFont = DEFAULT_DESCRIPTION_FONT;
        _descColor = DEFAULT_LABEL_COLOR;
        _descAlignment = NSTextAlignmentCenter;
        _bgColor = DEFAULT_BG_COLOR;
        _showTitleView = YES;
        _alpha = 1.f;
    }
    return self;
}

+ (instancetype)page {
    return [[self alloc] init];
}

+ (instancetype)pageWithCustomView:(UIView *)customV {
    ZHZInfoPage *newPage = [[self alloc] init];
    newPage.customView = customV;
    newPage.customView.translatesAutoresizingMaskIntoConstraints = NO;
    newPage.bgColor = customV.backgroundColor;
    return newPage;
}

+ (instancetype)pageWithCustomViewFromNibNamed:(NSString *)nibName {
    return [self pageWithCustomViewFromNibNamed:nibName bundle:[NSBundle mainBundle]];
}
+ (instancetype)pageWithCustomViewFromNibNamed:(NSString *)nibName bundle:(NSBundle*)aBundle {
    ZHZInfoPage *newPage = [[self alloc] init];
    newPage.customView = [[aBundle loadNibNamed:nibName owner:newPage options:nil] firstObject];
    newPage.customView.translatesAutoresizingMaskIntoConstraints = NO;
    newPage.bgColor = newPage.customView.backgroundColor;
    return newPage;
}
@end
