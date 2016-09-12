//
//  ZHZVoiceTools.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/9.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface ZHZVoiceTools : NSObject

+ (void)playSound:(NSString *)filename;

+ (void)disposeSound:(NSString *)filename;

+ (AVAudioPlayer *)playMusic:(NSString *)filename;

+ (void)pauseMusic:(NSString *)filename;

+ (void)stopMusic:(NSString *)filename;

+ (AVAudioPlayer *)currentPlayingAudioPlayer;


@end
