//
//  DownDataTool.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/8.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "DownDataTool.h"
#import <AFNetworking.h>


@implementation DownDataTool
//post请求
+(void)postUrl:(NSString *)url params:(NSDictionary *)params success:(CompleteBlock_t)successBlock fail:(ErrorBlock_t)Failerror{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", nil];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 15;
    
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            successBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (error) {
            Failerror(error);
        }
    } ];
}
//图片上传
+(void)postFileUrl:(NSString *)url params:(NSDictionary *)params data:(NSData *)data name:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)type success:(CompleteBlock_t)successBlock fail:(ErrorBlock_t)Failerror{
    // 1.创建网络管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 15;
    // 2.利用网络管理者上传数据
    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:data name:name fileName:fileName mimeType:type];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (responseObject) {
            successBlock(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            Failerror(error);
        }
        
    }];
}
+(void)networkStatus{
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status)
     {
         NSLog(@"%ld",(long)status);
     }];
    
}
+(void)getUrl:(NSString*)url params:(NSDictionary*)params success:(CompleteBlock_t)successBlock fail:(ErrorBlock_t)Failerror{
    //    __weak typeof(self)weakSelf = self;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",nil];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
 
    manager.requestSerializer.timeoutInterval = 15;
    [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            successBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            Failerror(error);
        }    }];
}




@end
