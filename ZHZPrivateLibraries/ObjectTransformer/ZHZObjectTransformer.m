//
//  ZHZObjectTransformer.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/8.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "ZHZObjectTransformer.h"
#import <CommonCrypto/CommonDigest.h>

@implementation ZHZObjectTransformer
+ (NSString *)data2string:(NSData *)data {
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}
+ (NSData *)string2data:(NSString *)string {
    return  [string dataUsingEncoding:NSUTF8StringEncoding];
}
+ (NSData *)array2data:(NSArray *)array {
    return [NSKeyedArchiver archivedDataWithRootObject:array];
}
+ (NSArray *)data2array:(NSData *)data {
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}
+ (NSData *)dictionary2data:(NSDictionary *)dictionary {
    return [NSKeyedArchiver archivedDataWithRootObject:dictionary];
}
+ (NSDictionary *)data2dictionary:(NSData *)data {
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}
+ (NSData *)array2JSONdata:(NSArray *)array {
    return [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:nil];
}
+ (NSArray *)JSONdata2array:(NSData *)data {
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
}

+ (NSData *)dictionary2JSONdata:(NSDictionary *)dictionary {
    return [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:nil];
}
+ (NSDictionary *)JSONdata2dictionary:(NSData *)data {
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
}
+ (Byte *)data2byte:(NSData *)data {
    Byte *byte = (Byte *)[data bytes];
    return byte;
}
+ (NSData *)byte2data:(Byte *)byte {
    NSData *data = [[NSData alloc] initWithBytes:byte length:sizeof(byte)];
    return data;
}
+ (NSString *)URLl2string:(NSURL *)url {
    return [url absoluteString];
}
+ (NSURL *)string2URL:(NSString *)string {
    return [NSURL URLWithString:string];
}

+ (UIImage *)data2image:(NSData *)data {
    return [UIImage imageWithData:data];
}
+ (NSData *)image2data:(UIImage *)image {
    return UIImagePNGRepresentation(image);
}
+ (NSData *)data2base64data:(NSData *)data {
    return [data base64EncodedDataWithOptions:NSDataBase64Encoding64CharacterLineLength];
}
+ (NSData *)base64data2data:(NSData *)base64data {
    return [[NSData alloc] initWithBase64EncodedData:base64data options:NSDataBase64DecodingIgnoreUnknownCharacters];
}





@end
