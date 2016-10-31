//
//  ZHZUtils.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/18.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <Foundation/Foundation.h>


#ifndef kScreenBounds
#define kScreenBounds [UIScreen mainScreen].bounds
#endif

#ifndef kDefaultColor
#define kDefaultColor [UIColor colorWithHexString:@"D02346"]
#endif

#ifndef kNavigationBarHeight
#define kNavigationBarHeight 64.0
#endif

#ifndef kTabBarHeight
#define kTabBarHeight 49.0
#endif

#ifndef SYSTEM_FONT
#define SYSTEM_FONT(__fontsize__)\
[UIFont systemFontOfSize:__fontsize__]
#endif

#ifndef IMAGE_NAMED
#define IMAGE_NAMED(__imageName__)\
[UIImage imageNamed:__imageName__]
#endif

#ifndef NIB_NAMED
#define NIB_NAMED(__nibName__)\
[UINib nibWithNibName:__nibName__ bundle:nil]
#endif

#ifndef kTreasureIsLogined
#define kTreasureIsLogined @"kTreasureIsLogined"
#endif

@interface ZHZUtils : NSObject
/**手机号码
 */
+ (BOOL)validateMobile:(NSString *)mobile;

/**密码
 */
+ (BOOL)validatePassword:(NSString *)passWord;

/**验证码
 */
+ (BOOL)validateVerifyCode:(NSString *)verifyCode;

/**昵称
 */
+ (BOOL)validateNickname:(NSString *)nickname;

//MD5不可逆加密
+(NSString *)md5HexDigest:(NSString *)input;

//AES加解密
+(NSString*)aesEncryptDigest:(NSString*)msg;

+(NSString*)aesDecryptDigest:(NSString*)msg;
//base64加解密
+(NSString *)base64EncodeString:(NSString *)string;
//对base64编码后的字符串进行解码
+(NSString *)base64DecodeString:(NSString *)string;





@end
