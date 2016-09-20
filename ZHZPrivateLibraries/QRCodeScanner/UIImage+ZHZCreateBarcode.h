//
//  UIImage+ZHZCreateBarcode.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/20.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZHZCreateBarcode)

/*!
 * @function imageOfQRFromURL:
 *
 * @abstract
 * 通过链接地址生成二维码图片
 */
+ (UIImage *)imageOfQRFromURL: (NSString *)networkAddress;
/*!
 * @function imageOfQRFromURL: codeSize:
 *
 * @abstract
 * 通过链接地址生成二维码图片并且设置二维码宽度
 */
+ (UIImage *)imageOfQRFromURL: (NSString *)networkAddress
                     codeSize: (CGFloat)codeSize;
/*!
 * @function imageOfQRFromURL: codeSize: red: green: blue:
 *
 * @abstract
 * 通过链接地址生成二维码图片以及设置二维码宽度和颜色
 */
+ (UIImage *)imageOfQRFromURL: (NSString *)networkAddress
                     codeSize: (CGFloat)codeSize
                          red: (NSUInteger)red
                        green: (NSUInteger)green
                         blue: (NSUInteger)blue;

/*!
 * @function imageOfQRFromURL: codeSize: red: green: blue: insertImage:
 *
 * @abstract
 * 通过链接地址生成二维码图片以及设置二维码宽度和颜色，在二维码中间插入图片
 */
+ (UIImage *)imageOfQRFromURL: (NSString *)networkAddress
                     codeSize: (CGFloat)codeSize
                          red: (NSUInteger)red
                        green: (NSUInteger)green
                         blue: (NSUInteger)blue
                  insertImage: (UIImage *)insertImage;
/*!
 * @function imageOfQRFromURL: codeSize: red: green: blue: insertImage: roundRadius:
 *
 * @abstract
 * 通过链接地址生成二维码图片以及设置二维码宽度和颜色，在二维码中间插入圆角图片
 */
+ (UIImage *)imageOfQRFromURL: (NSString *)networkAddress
                     codeSize: (CGFloat)codeSize
                          red: (NSUInteger)red
                        green: (NSUInteger)green
                         blue: (NSUInteger)blue
                  insertImage: (UIImage *)insertImage
                  roundRadius: (CGFloat)roundRadius;
/*!
 * @function imageOfRoundRectWithImage: radius:
 *
 * @abstract
 * 给传入的图片设置圆角后返回圆角图片
 */
+ (UIImage *)ZHZ_imageOfRoundRectWithImage: (UIImage *)image size: (CGSize)size radius: (CGFloat)radius;



@end
