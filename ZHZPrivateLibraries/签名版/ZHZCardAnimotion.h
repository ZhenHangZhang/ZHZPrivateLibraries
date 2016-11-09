//
//  ZHZCardAnimotion.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/10/11.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ROTATION_ANGLE M_PI/8
#define CLICK_ANIMATION_TIME 0.5
#define RESET_ANIMATION_TIME 0.3


@class ZHZCardAnimotion;

@protocol ZHZDragCardDelegate <NSObject>

-(void)swipCard:(ZHZCardAnimotion *)cardView Direction:(BOOL) isRight;

-(void)moveCards:(CGFloat)distance;

-(void)moveBackCards;

-(void)adjustOtherCards;
@end
@interface ZHZCardAnimotion : UIView

@property (weak,   nonatomic) id <ZHZDragCardDelegate> delegate;
@property (strong, nonatomic) UIPanGestureRecognizer *panGesture;
@property (assign, nonatomic) CGAffineTransform originalTransform;
@property (assign, nonatomic) CGPoint originalPoint;
@property (assign, nonatomic) CGPoint originalCenter;
@property (assign, nonatomic) BOOL canPan;
@property (strong, nonatomic) NSDictionary *infoDict;
@property (strong, nonatomic) UIImageView *headerImageView;
@property (strong, nonatomic) UILabel *numLabel;
@property (strong, nonatomic) UIButton *noButton;
@property (strong, nonatomic) UIButton *yesButton;

-(void) leftButtonClickAction;

-(void) rightButtonClickAction;




@end
