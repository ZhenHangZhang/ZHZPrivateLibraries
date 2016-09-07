//
//  Keyboard.h
//  Park
//
//  Created by zhanghangzhen on 16/3/17.
//  Copyright © 2016年  apple. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol keyboard <NSObject>

-(void)address:(NSString*)str;
-(void)inputAgain;
-(void)delegateStr;
-(void)inputChars:(NSString*)str;

@end
@interface Keyboard : UIView



@property(nonatomic,assign)id<keyboard>delegate;
+(instancetype)show;

-(void)ScrollViewMoveRight;
-(void)ScrollViewMoveLeft;
@end
