//
//  NSData+AES128.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 2016/11/7.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (AES128)

- (NSData*)AES128EncryptWithKey:(NSString*)key gIv:(NSString*)Iv;//加密


-(NSData*)AES128DecryptWithKey:(NSString*)key gIv:(NSString*)Iv;//解密

@end
