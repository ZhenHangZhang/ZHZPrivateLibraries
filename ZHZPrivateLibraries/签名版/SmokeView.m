//
//  SmokeView.m
//  DigitalSenseHD
//
//  Created by baolicheng on 16/8/27.
//  Copyright © 2016年 RenRenFenQi. All rights reserved.
//

#import "SmokeView.h"

@implementation SmokeView
-(void) generateSmokeWithSmokeAmount:(CGFloat)degree
{
    if (self.smokeEmitter == nil) {
        self.smokeEmitter = [CAEmitterLayer layer];
        self.smokeEmitter.emitterPosition = CGPointMake(self.frame.size.width / 2.0f, self.frame.size.height);
        self.smokeEmitter.emitterMode = kCAEmitterLayerPoints;
        
        CAEmitterCell *smoke = [CAEmitterCell emitterCell];
        [smoke setName:@"smoke"];
        
        smoke.birthRate = 11;
        smoke.emissionLongitude = -M_PI / 2;
        smoke.lifetime			= 10;
        smoke.velocity			= -40;
        smoke.velocityRange		= 20;
        smoke.emissionRange		= M_PI / 4;
        smoke.spin				= 1;
        smoke.spinRange			= 6;
        smoke.yAcceleration		= -160;
        UIImage *dazSmokeImage = [UIImage imageNamed:@"DazSmoke"];
        smoke.contents			= (id) [dazSmokeImage CGImage];
        smoke.scale				= 0.1;
        smoke.alphaSpeed		= -0.12;
        smoke.scaleSpeed		= 0.7;
        
        self.smokeEmitter.emitterCells = [NSArray arrayWithObject:smoke];
        
        [self.layer addSublayer:self.smokeEmitter];
        self.transform = CGAffineTransformMakeRotation(M_PI/4 + 0.15);
    }
    [self setSmokeAmount:degree];
}

-(void) stopSmoke
{
    if (self.smokeEmitter) {
        [self.smokeEmitter removeFromSuperlayer];
        self.smokeEmitter = nil;
    }
    self.transform = CGAffineTransformIdentity;
}

- (void) setSmokeAmount:(float)zeroToOne
{
    // Update the fire properties
    [self.smokeEmitter setValue:[NSNumber numberWithFloat:zeroToOne * 2.5]
                     forKeyPath:@"emitterCells.smoke.lifetime"];
    [self.smokeEmitter setValue:(id)[[UIColor colorWithRed:1 green:1 blue:1 alpha:0.6] CGColor]
                     forKeyPath:@"emitterCells.smoke.color"];
}
@end
