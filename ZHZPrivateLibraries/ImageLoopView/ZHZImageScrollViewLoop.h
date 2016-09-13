//
//  ZHZImageScrollViewLoop.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/13.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZHZImageScrollViewLoopDelegate <NSObject>


-(void)didSelectImageAtIndex:(NSInteger)index;

@end



@interface ZHZImageScrollViewLoop : UIView
@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, strong) UIPageControl *pageControl;
@property(nonatomic, strong) NSArray *imgArray;
@property(nonatomic, assign) id<ZHZImageScrollViewLoopDelegate> delegate;

-(void)setImageArray:(NSArray *)imageArray;
-(ZHZImageScrollViewLoop *)initWithFrame:(CGRect)frame ImageArray:(NSArray *)imgArr;
@end
