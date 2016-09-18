//
//  ZHZPlayer.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/7.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

/**
 *  全屏按钮被点击的通知
 */
#define ZHZPlayerFullScreenButtonClickedNotification @"ZHZPlayerFullScreenButtonClickedNotification"
/**
 *  关闭播放器的通知
 */
#define ZHZPlayerClosedNotification @"ZHZPlayerClosedNotification"
/**
 *  播放完成的通知
 */
#define ZHZPlayerFinishedPlayNotification @"ZHZPlayerFinishedPlayNotification"
/**
 *  单击播放器view的通知
 */
#define ZHZPlayerSingleTapNotification @"ZHZPlayerSingleTapNotification"
/**
 *  双击播放器view的通知
 */
#define ZHZPlayerDoubleTapNotification @"ZHZPlayerDoubleTapNotification"


#import <UIKit/UIKit.h>
#import "Masonry.h"
// 播放器的几种状态
typedef NS_ENUM(NSInteger, ZHZPlayerState) {
    ZHZPlayerStateFailed,     // 播放失败
    ZHZPlayerStateBuffering,  // 缓冲中
    ZHZPlayerStatePlaying,    // 播放中
    ZHZPlayerStateStopped,    // 停止播放
    ZHZPlayerStatePause       // 暂停播放
};

@import MediaPlayer;
@import AVFoundation;


@interface ZHZPlayer : UIView

/**
 *  播放器player
 */
@property (nonatomic,retain ) AVPlayer       *player;
/**
 *playerLayer,可以修改frame
 */
@property (nonatomic,retain ) AVPlayerLayer  *playerLayer;

/** 播放器的几种状态 */
@property (nonatomic, assign) ZHZPlayerState   state;

/**
 *  底部操作工具栏
 */
@property (nonatomic,retain ) UIView         *bottomView;
@property (nonatomic,retain ) UISlider       *progressSlider;
@property (nonatomic,retain ) UISlider       *volumeSlider;
@property (nonatomic,copy   ) NSString       *videoURLStr;
/** 亮度的进度条 */
@property (nonatomic, retain) UISlider       *lightSlider;


/**
 *  定时器
 */
@property (nonatomic, retain) NSTimer        *durationTimer;
@property (nonatomic, retain) NSTimer        *autoDismissTimer;
/**
 *  BOOL值判断当前的状态
 */
@property (nonatomic,assign ) BOOL            isFullscreen;
/**
 *  显示播放时间的UILabel
 */
@property (nonatomic,retain ) UILabel        *timeLabel;
/**
 *  控制全屏的按钮
 */
@property (nonatomic,retain ) UIButton       *fullScreenBtn;
/**
 *  播放暂停按钮
 */
@property (nonatomic,retain ) UIButton       *playOrPauseBtn;
/**
 *  关闭按钮
 */
@property (nonatomic,retain ) UIButton       *closeBtn;

/**
 *  当前播放的item
 */
@property (nonatomic, retain) AVPlayerItem   *currentItem;

/**
 *  BOOL值判断当前的播放状态
 */
@property (nonatomic,assign ) BOOL            isPlaying;
/**
 *  初始化WMPlayer的方法
 *
 *  @param frame       frame
 *  @param videoURLStr URL字符串，包括网络的和本地的URL
 *
 *  @return id类型，实际上就是WMPlayer的一个对象
 */
- (id)initWithFrame:(CGRect)frame videoURLStr:(NSString *)videoURLStr;
- (void)play;
- (void)pause;

@end
