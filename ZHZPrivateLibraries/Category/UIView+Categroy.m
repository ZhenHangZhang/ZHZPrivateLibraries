//
//  UIView+Categroy.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/9.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "UIView+Categroy.h"
#import <objc/runtime.h>



@implementation UIView (Categroy)

- (CGFloat)xMax {
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)xMiddle {
    return self.frame.origin.x + (self.frame.size.width * 0.5f);
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (CGFloat)yMax {
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)yMiddle {
    return self.frame.origin.y + (self.frame.size.height * 0.5f);
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)removeAllSubviews {
    for (UIView * subview in self.subviews) {
        [subview removeFromSuperview];
    }
}

static char kWhenTappedBlockKey;
static char kWhenDoubleTappedBlockKey;
static char kWhenTwoFingerTappedBlockKey;
static char kWhenTouchedDownBlockKey;
static char kWhenTouchedUpBlockKey;

- (void)whenTapped:(ZHZWhenTappedBlock)block {
    UITapGestureRecognizer * gesture = [self addTapGestureRecognizerWithTaps:1 touches:1 selector:@selector(viewWasTapped)];
    [self addRequiredToDoubleTapsRecognizer:gesture];
    [self setBlock:block forKey:&kWhenTappedBlockKey];
}

- (void)whenDoubleTapped:(ZHZWhenTappedBlock)block {
    UITapGestureRecognizer * gesture = [self addTapGestureRecognizerWithTaps:2 touches:1 selector:@selector(viewWasDoubleTapped)];
    [self addRequirementToSingleTapsRecognizer:gesture];
    [self setBlock:block forKey:&kWhenDoubleTappedBlockKey];
}

- (void)whenTwoFingerTapped:(ZHZWhenTappedBlock)block {
    [self addTapGestureRecognizerWithTaps:1 touches:2 selector:@selector(viewWasTwoFingerTapped)];
    [self setBlock:block forKey:&kWhenTwoFingerTappedBlockKey];
}

- (void)whenTouchedDown:(ZHZWhenTappedBlock)block {
    [self setBlock:block forKey:&kWhenTouchedDownBlockKey];
}

- (void)whenTouchedUp:(ZHZWhenTappedBlock)block {
    [self setBlock:block forKey:&kWhenTouchedUpBlockKey];
}
/** SEL method */
- (void)viewWasTapped {
    [self runBlockForKey:&kWhenTappedBlockKey];
}
/** SEL method */
- (void)viewWasDoubleTapped {
    [self runBlockForKey:&kWhenDoubleTappedBlockKey];
}
/** SEL method */
- (void)viewWasTwoFingerTapped {
    [self runBlockForKey:&kWhenTwoFingerTappedBlockKey];
}
/** respond method */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self runBlockForKey:&kWhenTouchedDownBlockKey];
}
/** respond method */
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    [self runBlockForKey:&kWhenTouchedUpBlockKey];
}
/** private method */
- (void)runBlockForKey:(void *)blockKey {
    ZHZWhenTappedBlock block = objc_getAssociatedObject(self, blockKey);
    if (block) block();
}
/** private method */
- (void)setBlock:(ZHZWhenTappedBlock)block forKey:(void *)blockKey {
    self.userInteractionEnabled = YES;
    objc_setAssociatedObject(self, blockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
/** gesture method */
- (UITapGestureRecognizer *)addTapGestureRecognizerWithTaps:(NSUInteger)taps touches:(NSUInteger)touches selector:(SEL)selector {
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:selector];
    tapGesture.delegate                 = self;
    tapGesture.numberOfTapsRequired     = taps;
    tapGesture.numberOfTouchesRequired  = touches;
    [self addGestureRecognizer:tapGesture];
    
    return tapGesture;
}
/** gesture method */
- (void) addRequirementToSingleTapsRecognizer:(UIGestureRecognizer*) recognizer {
    for (UIGestureRecognizer * gesture in [self gestureRecognizers]) {
        if ([gesture isKindOfClass:[UITapGestureRecognizer class]]) {
            UITapGestureRecognizer* tapGesture = (UITapGestureRecognizer*) gesture;
            if (tapGesture.numberOfTouchesRequired == 1 && tapGesture.numberOfTapsRequired == 1) {
                [tapGesture requireGestureRecognizerToFail:recognizer];
            }
        }
    }
}
/** gesture method */
- (void) addRequiredToDoubleTapsRecognizer:(UIGestureRecognizer*) recognizer {
    for (UIGestureRecognizer * gesture in [self gestureRecognizers]) {
        if ([gesture isKindOfClass:[UITapGestureRecognizer class]]) {
            UITapGestureRecognizer* tapGesture = (UITapGestureRecognizer*) gesture;
            if (tapGesture.numberOfTouchesRequired == 2 && tapGesture.numberOfTapsRequired == 1) {
                [recognizer requireGestureRecognizerToFail:tapGesture];
            }
        }
    }
}






@end
