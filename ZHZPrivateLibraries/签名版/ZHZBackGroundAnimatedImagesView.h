//
//  ZHZBackGroundAnimatedImagesView.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/10/12.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <UIKit/UIKit.h>


#define kJSAnimatedImagesViewDefaultTimePerImage 20.0f


@protocol ZHZAnimatedImagesViewDelegate;


@interface ZHZBackGroundAnimatedImagesView : UIView
@property (nonatomic, assign) id<ZHZAnimatedImagesViewDelegate> delegate;

@property (nonatomic, assign) NSTimeInterval timePerImage;


- (void)startAnimating;
- (void)stopAnimating;

- (void)reloadData;

@end

@protocol ZHZAnimatedImagesViewDelegate
- (NSUInteger)animatedImagesNumberOfImages:(ZHZBackGroundAnimatedImagesView *)animatedImagesView;
- (UIImage *)animatedImagesView:(ZHZBackGroundAnimatedImagesView *)animatedImagesView imageAtIndex:(NSUInteger)index;
@end
