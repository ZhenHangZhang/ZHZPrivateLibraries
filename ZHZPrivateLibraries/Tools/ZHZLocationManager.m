
//
//  ZHZLocationManager.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/18.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "ZHZLocationManager.h"


/** 当前纬度*/
NSString *const kNHUserCurrentLatitude = @"kNHUserCurrentLatitude";
/** 当前经度*/
NSString *const kNHUserCurrentLongitude = @"kNHUserCurrentLongitude";

@interface ZHZLocationManager ()<CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *locationManager;


@end
@implementation ZHZLocationManager{
    ZHZLocationManagerDidUpdateLocationHandle _updateLocationHandle;
}
+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static ZHZLocationManager *_singleton = nil;

    dispatch_once(&onceToken, ^{
        _singleton = [[ZHZLocationManager alloc] init];
    });
    return _singleton;
}
- (CLLocationManager *)locationManager {
    if (!_locationManager) {
        CLLocationManager *locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
        locationManager.pausesLocationUpdatesAutomatically = NO;
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        locationManager.allowsBackgroundLocationUpdates = NO;
    }
    return _locationManager;
}
- (void)setUpLocationManagerUpdateLocationHandle:(ZHZLocationManagerDidUpdateLocationHandle)updateLocationHandle {
    _updateLocationHandle = updateLocationHandle;
}

// 开始定位
- (void)startSerialLocation {
    if (self.canLocationFlag == NO) {
        return ;
    }
    [self.locationManager startUpdatingLocation];
}
// 停止定位
- (void)stopSerialLocation {
    [self.locationManager stopUpdatingLocation];
}
- (BOOL)isCanLocationFlag {
    if ([CLLocationManager locationServicesEnabled] && ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse)) {
        return YES;
    } else {
        return NO;
    }
}
- (BOOL)hasLocation {
    return [[[NSUserDefaults standardUserDefaults] objectForKey:kNHUserCurrentLongitude] length] && [[[NSUserDefaults standardUserDefaults] objectForKey:kNHUserCurrentLatitude] length];
}
#pragma mark - LocationManager

// 定位结果
- (void)amapLocationManager:(CLLocationManager *)manager didUpdateLocation:(CLLocation *)newLocation {
    
    
    // 纬度
    NSString *currentLatitude = [[NSString alloc]
                                 initWithFormat:@"%f",
                                 newLocation.coordinate.latitude];
    
    // 经度
    NSString *currentLongitude = [[NSString alloc]
                                  initWithFormat:@"%f",
                                  newLocation.coordinate.longitude];
    
    [[NSUserDefaults standardUserDefaults] setObject:currentLatitude forKey:kNHUserCurrentLatitude];
    [[NSUserDefaults standardUserDefaults] setObject:currentLongitude forKey:kNHUserCurrentLongitude];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    if (_updateLocationHandle) {
        _updateLocationHandle(newLocation, currentLatitude, currentLongitude);
    }
}
- (void)amapLocationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"error = %@",  error);
}
@end
