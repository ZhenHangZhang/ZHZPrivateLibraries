//
//  ZHZObjectTransformer.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/8.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface ZHZObjectTransformer : NSObject

#pragma mark-基本对象转换-
/**
 *  二进制数据转字符串
 *
 *  @param data 数据
 *
 *  @return 字符串
 */
+ (NSString *)data2string:(NSData *)data;
/**
 *  字符串转二级制数据
 *
 *  @param string 字符串
 *
 *  @return 数据
 */
+ (NSData *)string2data:(NSString *)string;
/**
 *  数组转二级制数据
 *
 *  @param string 数组
 *
 *  @return 数据
 */
+ (NSData *)array2data:(NSArray *)array;
/**
 *  二进制数据转数组
 *
 *  @param string 数据
 *
 *  @return 数组
 */
+ (NSArray *)data2array:(NSData *)data;
/**
 *  字典转二进制数据
 *
 *  @param string 字典
 *
 *  @return 数据
 */
+ (NSData *)dictionary2data:(NSDictionary *)dictionary;
/**
 *  二进制数据转字典
 *
 *  @param string 数据
 *
 *  @return 字典
 */
+ (NSDictionary *)data2dictionary:(NSData *)data;


/**
 * 数组JSON转数据
 *
 *  @param string 数组
 *
 *  @return 数据
 */
+ (NSData *)array2JSONdata:(NSArray *)array;
/**
 *  数据JSON转数据
 *
 *  @param string 数据
 *
 *  @return 数组
 */
+ (NSArray *)JSONdata2array:(NSData *)data;
/**
 *  字典JSON转数据
 *
 *  @param string 字典
 *
 *  @return 数据
 */
+ (NSData *)dictionary2JSONdata:(NSDictionary *)dictionary;
/**
 *  数据JSON转字典
 *
 *  @param string 数据
 *
 *  @return 字典
 */
+ (NSDictionary *)JSONdata2dictionary:(NSData *)data;
/**
 *  数据字节
 *
 *  @param string 数据
 *
 *  @return 字节
 */
+ (Byte *)data2byte:(NSData *)data;
/**
 *  字节转数据
 *
 *  @param string 字节
 *
 *  @return 数据
 */
+ (NSData *)byte2data:(Byte *)byte;

/**
 *  URL转字符串
 *
 *  @param url URL
 *
 *  @return 字符串
 */
+ (NSString *)URLl2string:(NSURL *)url;
/**
 *  字符串转URL
 *
 *  @param string 字符串
 *
 *  @return URL
 */
+ (NSURL *)string2URL:(NSString *)string;

/**
 *  数据转图片
 *
 *  @param data 数据
 *
 *  @return 图片
 */
+ (UIImage *)data2image:(NSData *)data;
/**
 *  图片转数据
 *
 *  @param image 图片
 *
 *  @return 数据
 */
+ (NSData *)image2data:(UIImage *)image;



#pragma mark-编码、加密-

+ (NSData *)data2base64data:(NSData *)data;
+ (NSData *)base64data2data:(NSData *)base64data;



@end
