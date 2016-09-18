//
//  ZHZCustomSegmentView.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/18.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHZCustomSegmentView : UIView

- (instancetype)initWithItemTitles:(NSArray *)itemTitles;

/**
 *  从0开始
 */
@property (nonatomic, copy) void(^NHCustomSegmentViewBtnClickHandle)(ZHZCustomSegmentView *segment, NSString *currentTitle, NSInteger currentIndex);

- (void)clickDefault;

@end
