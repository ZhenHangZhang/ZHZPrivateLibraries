//
//  ZJRoutePlanViewController.h
//  ePark
//
//  Created by pg on 15/12/21.
//  Copyright © 2015年 zjhaha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJRoutePlanViewController : UIViewController
@property (strong,nonatomic) AMapNaviPoint *endPoint;
@property (strong,nonatomic) NSString *addressString;
@end
