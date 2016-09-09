//
//  ZHZCustomGuidViewController.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/9.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef void(^ZHZNewFeatureViewControllerBlock)();


@interface ZHZCustomGuidViewController : UIViewController


@property (nonatomic,copy) ZHZNewFeatureViewControllerBlock block;

@property (nonatomic,strong) UIImage * enterButtonImage;

@property (nonatomic,strong) NSArray * newfeatureImages;


@end
