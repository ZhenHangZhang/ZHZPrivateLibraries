//
//  ZHZLocationManager.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/18.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


typedef void(^ZHZLocationManagerDidUpdateLocationHandle)(CLLocation *newLocation, NSString *newLatitude, NSString *newLongitude);

@interface ZHZLocationManager : NSObject

/** 开始定位*/
- (void)startSerialLocation;

+ (instancetype)sharedManager;

/** 更新定位回调*/
- (void)setUpLocationManagerUpdateLocationHandle:(ZHZLocationManagerDidUpdateLocationHandle)updateLocationHandle;

/** 是否可以定位*/
@property (nonatomic, assign) BOOL canLocationFlag;

/** 是否有经纬度*/
@property (nonatomic, assign) BOOL hasLocation;
@end
