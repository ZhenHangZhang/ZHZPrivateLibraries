//
//  ZHZDataCache.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/7.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHZDataCache : NSObject

#pragma mark -取USERDEFAULT数据-

+ (id)objectForKey:(NSString *)key;
+ (NSString *)valueForKey:(NSString *)key;
+ (float)floatForKey:(NSString *)key;
+ (NSInteger)integerForKey:(NSString *)key;
+ (BOOL)boolForKey:(NSString *)key;


#pragma mark -存USERDEFAULT数据-

+ (void)setObject:(id)value ForKey:(NSString *)key;
+ (void)setValue:(id)value forKey:(NSString *)key;
+ (void)setFloat:(float)value forKey:(NSString *)key;
+ (void)setInteger:(NSInteger)value forKey:(NSString *)key;
+ (void)setBool:(BOOL)value forKey:(NSString *)key;
@end
