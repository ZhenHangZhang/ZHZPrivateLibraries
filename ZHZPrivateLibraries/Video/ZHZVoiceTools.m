//
//  ZHZVoiceTools.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/9.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "ZHZVoiceTools.h"

@implementation ZHZVoiceTools

static NSMutableDictionary *_soundIDDict;
static NSMutableDictionary *_audioPlayerDict;

+ (void)initialize
{
    _soundIDDict = [NSMutableDictionary dictionary];
    _audioPlayerDict = [NSMutableDictionary dictionary];
    
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategorySoloAmbient error:nil];
    [session setActive:YES error:nil];
}

+ (void)playSound:(NSString *)filename
{
    if (!filename) return;
    
    SystemSoundID soundID = [_soundIDDict[filename] intValue];
    if (!soundID) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
        
        if (!url) return;
        
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
        _soundIDDict[filename] = @(soundID);
    }
    
    AudioServicesPlaySystemSound(soundID);
}

+ (void)disposeSound:(NSString *)filename
{
    if (!filename) return;
    
    SystemSoundID soundID = [_soundIDDict[filename] intValue];
    if (soundID) {
        AudioServicesDisposeSystemSoundID(soundID);
        [_soundIDDict removeObjectForKey:filename];
    }
}

+ (AVAudioPlayer *)playMusic:(NSString *)filename
{
    if (!filename) return nil;
    
    AVAudioPlayer *audioPlayer = _audioPlayerDict[filename];
    if (!audioPlayer) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
        
        if (!url) return nil;
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        
        [audioPlayer prepareToPlay];
        
        //        audioPlayer.enableRate = YES;
        //        audioPlayer.rate = 10.0;
        
        _audioPlayerDict[filename] = audioPlayer;
    }
    
    if (!audioPlayer.isPlaying) {
        [audioPlayer play];
    }
    
    return audioPlayer;
}

+ (void)pauseMusic:(NSString *)filename
{
    if (!filename) return;
    
    AVAudioPlayer *audioPlayer = _audioPlayerDict[filename];
    
    if (audioPlayer.isPlaying) {
        [audioPlayer pause];
    }
}

+ (void)stopMusic:(NSString *)filename
{
    if (!filename) return;
    
    AVAudioPlayer *audioPlayer = _audioPlayerDict[filename];
    
    if (audioPlayer.isPlaying) {
        [audioPlayer stop];
        [_audioPlayerDict removeObjectForKey:filename];
    }
}

+ (AVAudioPlayer *)currentPlayingAudioPlayer
{
    for (NSString *filename in _audioPlayerDict) {
        AVAudioPlayer *audioPlayer = _audioPlayerDict[filename];
        
        if (audioPlayer.isPlaying) {
            return audioPlayer;
        }
    }
    return nil;
}


@end
