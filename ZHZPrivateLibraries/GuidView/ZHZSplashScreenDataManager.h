//
//  ZHZSplashScreenDataManager.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/20.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface ZHZSplashScreenDataManager : NSObject

@property(nonatomic, strong)NSArray *resultArray;
@property(nonatomic, strong) NSString *documentPath;
@property(nonatomic, strong) UIImageView *splashImageVeiw;
@property(nonatomic, copy)NSString *imageURL;
+(void)downloadAdImageWithUrl:(NSString *)imageUrl imageName:(NSString *)imageName imgLinkUrl:(NSString *)imgLinkUrl imgDeadline:(NSString *)imgDeadline;
+ (BOOL)isFileExistWithFilePath:(NSString *)filePath;
+(void)getAdvertisingImageData;
+ (NSString *)getFilePathWithImageName:(NSString *)imageName;





@end
