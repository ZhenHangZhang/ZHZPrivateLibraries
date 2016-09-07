//
//  ZHZ_GCD.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/7.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CallBacks)(NSData *data,NSError *error);

@interface ZHZ_GCD : NSObject

+(void)downloadWithUrlStr:(NSString *)URLStr andCallBack:(CallBacks)callBack;



@end
