//
//  ZHZTools.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/7.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZHZHeader.h"


@interface ZHZTools : NSObject
/**
 *  取一个随机整数 0~x-1
 *
 *  @param x
 *
 *  @return
 */
+ (int)random:(int)x;
#pragma mark -加密处理-

/**
 *  MD5加密
 *
 *  @param str 待加密的字符串
 *
 *  @return 加密后的字符串
 */
+ (NSString *)md5Encryption:(NSString *)str;

#pragma mark -时间处理-
/**
 *  获取当前时间 格式：yyyy-MM-dd
 *
 *  @return 返回当前时间的字符串
 */
+ (NSString *)stringDateFromCurrent;

/**
 *  根据“yyyy-MM-dd”格式的时间获取首页的时间格式（天）和（月、年）用 & 连接，用来切割字符串
 *
 *  @param originalMarketTime originalMarketTime 原数据中的时间
 *
 *  @return 转换之后的时间
 */
+ (NSString *)ZHZDateTimeWithOriginalMarketTime:(NSString *)originalMarketTime;

/**
 *  yyyy-MM-dd格式的时间字符串
 *
 *  @param date 某一时刻的时间
 *
 *  @return yyyy-MM-dd格式的时间字符串
 */
+ (NSString *)stringDateFromDate:(NSDate *)date;
//@"1419055200" -> 转化 日期字符串
/**
 *  时间计算  类似： 1419055200 ----> 2016.09.01
 *
 *  @param timerStr 时间字符串
 *
 *  @return yyyy_MM_dd字符串
 */
+ (NSString *)dateStringFromNumberTimer:(NSString *)timerStr;

#pragma mark -判断处理-
/**
 *  手机号判断
 *
 *  @param num 手机号
 *
 *  @return 是否？？
 */
+(BOOL)isPhoneNumber:(NSString*)num;
/**
 *  车牌号判断
 *
 *  @param num 车牌号
 *
 *  @return 是否？？？
 */
+(BOOL)isCarNumber:(NSString *)num;
/**
 *  是否为大写的英文字符
 *
 *  @param num 字符
 *
 *  @return 是否？？？？
 */
+(BOOL)isEnglishNum:(NSString *)num;
/**
 * 邮箱的格式是否正确
 *
 *  @param email 邮箱
 *
 *  @return 是否？？？？
 */
+(BOOL)isEmailNumber:(NSString *)email;
/**
 *  验证身份证号是否正确；
 *
 *  @param cardNo 身份证号
 *
 *  @return 是否？？？？
 */
+(BOOL)IsIdentityCardNo:(NSString*)cardNo;
/**
 *  是否是汉字
 *
 *  @param str 汉字
 *
 *  @return 是否？？？？？
 */
+(BOOL)isHanWord:(NSString*)str;

@end
