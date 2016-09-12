//
//  ZHZTabBar.h
//  parkingTest
//
//  Created by zhanghangzhen on 15/12/29.
//  Copyright © 2015年 zhanghangzhen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZHZTabBar;

@protocol ZHZTabBarDelegate <NSObject>

@optional

- (void)tabBarDidClickedPlusButton:(ZHZTabBar *)tabBar;

@end



@interface ZHZTabBar : UITabBar

@property(nonatomic,assign)id<ZHZTabBarDelegate>tabBarDelegate;

@end
