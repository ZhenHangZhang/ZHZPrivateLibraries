//
//  ZHZAnimationChooseView.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 2016/11/10.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^AnimationHandleAction)(NSInteger animationType);


@interface ZHZAnimationChooseView : UIView
@property (nonatomic,copy)AnimationHandleAction animationAction;

-(instancetype)initWithFrame:(CGRect)frame info:(NSString*)infoStr titles:(NSArray*)titles nameAction:(AnimationHandleAction)animationAction;
@end
