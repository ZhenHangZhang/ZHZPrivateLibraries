
//
//  ZHZ_GCD.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/7.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "ZHZ_GCD.h"

@implementation ZHZ_GCD
+(void)downloadWithUrlStr:(NSString *)URLStr andCallBack:(CallBacks)callBack{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSError *error = nil;
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:URLStr] options:NSDataReadingUncached error:&error];
        dispatch_async(dispatch_get_main_queue(), ^{
            callBack(data,error);
        });
    });
}
@end
