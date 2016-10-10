//
//  SmokeView.h
//  DigitalSenseHD
//
//  Created by baolicheng on 16/8/27.
//  Copyright © 2016年 RenRenFenQi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/CoreAnimation.h>

/**
 *烟雾
 */
@interface SmokeView : UIView
@property (strong) CAEmitterLayer *smokeEmitter;
-(void) generateSmokeWithSmokeAmount:(CGFloat)degree;
- (void) setSmokeAmount:(float)zeroToOne;
-(void) stopSmoke;
@end
