



//
//  EncryptionVC.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 2016/11/7.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "EncryptionVC.h"

#import "NSString+Hash.h"
#import "CocoaSecurity.h"
#import "NSString+Encryption.h"
#import "RSA.h"


@interface EncryptionVC ()
@property (nonatomic, strong) NSData *data;

@end

@implementation EncryptionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //    [self base64Test];
    //
    //    [self hashTest];
    
    [self aesCBCTest];
    //    [self aesECBTest];
    //    [self desTest];
    //    [self rsaTest];
    //    [self blockTest];

}
- (void)base64Test {
    // 1 待编码的原始字符串
    NSString *plainStr = @"123";
    // 2 将其转换成NSData保存，那么"123"对应的ASCII码表码值是31、32、33（16进制）
    NSData *plainData = [plainStr dataUsingEncoding:NSUTF8StringEncoding];
    // 3.1 将其进行Base64编码，且结果以字符串形式保存
    NSString *baseStr = [plainData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    // 3.2 将其进行Base64编码，且结果以NSData形式保存
    NSData *base64Data = [plainData base64EncodedDataWithOptions:0];
    
    NSLog(@"%@---%@---%@---%@", plainData,base64Data,[NSString stringWithUTF8String:[base64Data bytes]],baseStr);
}

- (void)hashTest {
    NSString *plainStr = @"123";
    // md5
    CocoaSecurityResult *md5 = [CocoaSecurity md5:plainStr];
    NSLog(@"md5:%lu---%@---%@",(unsigned long)plainStr.md5Hash.length, plainStr.md5Hash,md5.hex);
    // 40
    CocoaSecurityResult *sha1 = [CocoaSecurity sha1:plainStr];
    NSLog(@"sha1:%lu---%@---%@",(unsigned long)plainStr.sha1Hash.length,  plainStr.sha1Hash,sha1.hex);
    // 56
    CocoaSecurityResult *sha224 = [CocoaSecurity sha224:plainStr];
    NSLog(@"sha224:%lu---%@---%@",(unsigned long)plainStr.sha224Hash.length,plainStr.sha224Hash,sha224.hex);
    // 64
    CocoaSecurityResult *sha256 = [CocoaSecurity sha256:plainStr];
    NSLog(@"sha256:%lu---%@---%@",(unsigned long)plainStr.sha256Hash.length,plainStr.sha256Hash,sha256.hex);
    // 96
    CocoaSecurityResult *sha384 = [CocoaSecurity sha384:plainStr];
    NSLog(@"sha384:%lu---%@---%@",(unsigned long)plainStr.sha384Hash.length,plainStr.sha384Hash,sha384.hex);
    // 128
    CocoaSecurityResult *sha512 = [CocoaSecurity sha512:plainStr];
    NSLog(@"sha512:%lu---%@---%@",(unsigned long)plainStr.sha512Hash.length,plainStr.sha512Hash,sha512.hex);
    
    /// hmac
    CocoaSecurityResult *hmacmd5 = [CocoaSecurity hmacMd5:plainStr hmacKey:plainStr];
    NSLog(@"hmacmd5:%lu---%@---%@",(unsigned long)[plainStr hmacMD5WithKey:plainStr].length,[plainStr hmacMD5WithKey:plainStr],hmacmd5.hex);
}

- (void)blockTest {
    NSString *str = @"123";
    
    CocoaSecurityResult *md5 = [CocoaSecurity md5:str];
    CocoaSecurityResult *result1 = [CocoaSecurity md5WithData:md5.data];
    CocoaSecurityResult *result2 = [CocoaSecurity md5:md5.hexLower];
    
    NSLog(@"%@ --  %@",[md5.hexLower dataUsingEncoding:NSUTF8StringEncoding],md5.data);
    NSLog(@"%@", result1.hexLower);
    NSLog(@"%@", result2.hexLower);
    
    
}

- (void)aesCBCTest {
    NSString *plainText = @"123";
    
    NSString *key128 = @"0123456789ABCDEF";
    // 16进制字符串
    NSString *key128Hex = @"30313233343536373839414243444546";
    
    NSString *iv = @"0123456789ABCDEF";
    // 16进制字符串
    NSString *ivHex = @"30313233343536373839414243444546";
    
    
    NSString *aesBase64 = [plainText aesEncryptWithKey:key128 iv:iv];
    NSData *aesData = [plainText aesEncryptWithDataKey:[key128 dataUsingEncoding:NSUTF8StringEncoding] dataIv:[iv dataUsingEncoding:NSUTF8StringEncoding]];
//    NSLog(@"SecurityResult加密：\r\n%@ --- %@",result.base64,result.hexLower);
    NSLog(@"NSString+Encryption加密：\r\n%@ --- %@",aesBase64,aesData);
    
    // 解密
    NSString *decryptStr = [aesBase64 aesBase64StringDecryptWithHexKey:key128Hex hexIv:ivHex];
    NSData *data = [NSString aesDecryptWithData:aesData dataKey:[key128 dataUsingEncoding:NSUTF8StringEncoding] dataIv:[iv dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"解密：%@ --- %@",decryptStr,data);
}

- (void)aesECBTest {
    NSString *plainText = @"123";
    
    NSString *key128 = @"0123456789ABCDEF";
    NSString *key128Hex = @"30313233343536373839414243444546";
    
    NSString *aesBase64 = [plainText aesECBEncryptWithKey:key128];
    NSData *aesData = [plainText aesECBEncryptWithDataKey:[key128 dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"加密：%@ --- %@",aesBase64, aesData);
    
    // 解密
    NSString *decStr = [aesBase64 aesECBBase64StringDecryptWithHexKey:key128Hex];
    NSData *decData = [NSString aesECBDecryptWithData:aesData withDataKey:[key128 dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"解密：%@---%@",decStr, decData);
}

- (void)desTest {
    NSString *plainText = @"123";
    
    NSString *key = @"01234567";
    NSString *desBase64 = [plainText desEncryptWithKey:key];
    NSData *keydata = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *desData = [plainText desEncryptWithDataKey:keydata];
    
    NSLog(@"DES加密：%@ --- %@",desBase64,desData);
    
    NSString *decryptStr = [desBase64 desDecryptWithKey:key];
    NSData *data = [NSString desDecryptWithData:desData dataKey:keydata];
    NSLog(@"解密：%@  ---  %@",decryptStr,data);
}

- (void)rsaTest {

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
