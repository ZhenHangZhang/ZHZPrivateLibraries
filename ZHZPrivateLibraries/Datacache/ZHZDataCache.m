//
//  ZHZDataCache.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/7.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "ZHZDataCache.h"
#import "ZHZHeader.h"


@implementation ZHZDataCache

#pragma mark - Getter

// object
+ (id)objectForKey:(NSString *)key {
    return [ZHZUserDefaults objectForKey:key];
}

// value
+ (NSString *)valueForKey:(NSString *)key {
    return [ZHZUserDefaults valueForKey:key] ? [ZHZUserDefaults valueForKey:key] : @"";
}

// float
+ (float)floatForKey:(NSString *)key {
    return [ZHZUserDefaults floatForKey:key];
}

// int
+ (NSInteger)integerForKey:(NSString *)key {
    return [ZHZUserDefaults integerForKey:key];
}

// bool
+ (BOOL)boolForKey:(NSString *)key {
    return [ZHZUserDefaults boolForKey:key];
}

#pragma mark - Setter

// object
+ (void)setObject:(id)value ForKey:(NSString *)key {
    [ZHZUserDefaults setObject:value forKey:key];
}

// value
+ (void)setValue:(id)value forKey:(NSString *)key {
    [ZHZUserDefaults setValue:value forKey:key];
}

// float
+ (void)setFloat:(float)value forKey:(NSString *)key {
    [ZHZUserDefaults setFloat:value forKey:key];
}

// int
+ (void)setInteger:(NSInteger)value forKey:(NSString *)key {
    [ZHZUserDefaults setInteger:value forKey:key];
}

// bool
+ (void)setBool:(BOOL)value forKey:(NSString *)key {
    [ZHZUserDefaults setBool:value forKey:key];
}




@end
