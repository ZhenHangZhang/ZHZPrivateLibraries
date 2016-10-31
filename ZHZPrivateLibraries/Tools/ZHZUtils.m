//
//  ZHZUtils.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/18.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "ZHZUtils.h"
#import <CommonCrypto/CommonDigest.h>



@implementation ZHZUtils

+ (BOOL) validateMobile:(NSString *)mobile {
    NSString *phoneRegex =@"^1\\d{10}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

//密码
+ (BOOL)validatePassword:(NSString *)passWord {
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,16}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:passWord];
}

+ (BOOL)validateVerifyCode:(NSString *)verifyCode {
    BOOL flag;
    if (verifyCode.length != 6) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{6})";
    NSPredicate *verifyCodePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [verifyCodePredicate evaluateWithObject:verifyCode];
}

//昵称 最长不得超过7个汉字，或20个字节(数字，字母和下划线)正则表达式
+ (BOOL) validateNickname:(NSString *)nickname {
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{1,7}$|^[\\dA-Za-z_]{4,20}$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:nickname];
}

+(NSString *)md5HexDigest:(NSString *)input{
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%2s",result];
    }
    return ret;
}
//AES加解密
+(NSString*)aesEncryptDigest:(NSString*)msg{

    return nil;
}

+(NSString*)aesDecryptDigest:(NSString*)msg{

    return nil;
}
+(NSString *)base64EncodeString:(NSString *)string
{
    //1.先把字符串转换为二进制数据
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    //2.对二进制数据进行base64编码，返回编码后的字符串
    return [data base64EncodedStringWithOptions:0];
}

-(NSString *)base64DecodeString:(NSString *)string
{
    //1.将base64编码后的字符串『解码』为二进制数据
    NSData *data = [[NSData alloc]initWithBase64EncodedString:string options:0];
    
    //2.把二进制数据转换为字符串返回
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}


@end
