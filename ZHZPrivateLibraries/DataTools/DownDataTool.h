//
//  DownDataTool.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/8.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^CompleteBlock_t)(id data);
typedef void(^ErrorBlock_t)(NSError *error);


@interface DownDataTool : NSObject
//get请求
+(void)getUrl:(NSString*)url params:(NSDictionary*)params success:(CompleteBlock_t)successBlock fail:(ErrorBlock_t)Failerror;
//post请求
+(void)postUrl:(NSString*)url params:(NSDictionary*)params success:(CompleteBlock_t)successBlock fail:(ErrorBlock_t)Failerror;

//post上传
+(void)postFileUrl:(NSString*)url params:(NSDictionary*)params data:(NSData*)data name:(NSString*)name fileName:(NSString*)fileName mimeType:(NSString*)type success:(CompleteBlock_t)successBlock fail:(ErrorBlock_t)Failerror;
//实时监控网络状况
+(void)networkStatus;
@end
