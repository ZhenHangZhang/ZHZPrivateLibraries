//
//  RHSheetView.m
//  Demo
//
//  Created by 郭人豪 on 2016/10/26.
//  Copyright © 2016年 Abner_G. All rights reserved.
//

#import "RHSheetView.h"

@interface RHSheetView ()

@property (nonatomic, strong) UIAlertController * alert;
@end
@implementation RHSheetView

#pragma mark - public

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message {
    
    self = [super init];
    
    if (self) {
        
        _alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    }
    return self;
}

- (void)showWithController:(UIViewController *)controller {
    
    [controller presentViewController:_alert animated:YES completion:nil];
}

#pragma mark - setter

- (void)setActionTitles:(NSArray *)actionTitles {
    
    _actionTitles = actionTitles;
    
    for (int i = 0; i < actionTitles.count; i++) {
        
        if ([self.delegate respondsToSelector:@selector(sheetView:actionStyleAtIndex:)]) {
            
            UIAlertActionStyle style = [self.delegate sheetView:self actionStyleAtIndex:i];
            
            UIAlertAction * action = [UIAlertAction actionWithTitle:actionTitles[i] style:style handler:^(UIAlertAction * _Nonnull action) {
                
                if ([self.delegate respondsToSelector:@selector(sheetView:didSelectedAtIndex:)]) {
                    
                    [self.delegate sheetView:self didSelectedAtIndex:i];
                }
                
                [_alert dismissViewControllerAnimated:YES completion:nil];
            }];
            
            [_alert addAction:action];
        }else {
            
            UIAlertAction * action = [UIAlertAction actionWithTitle:actionTitles[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                if ([self.delegate respondsToSelector:@selector(sheetView:didSelectedAtIndex:)]) {
                    
                    [self.delegate sheetView:self didSelectedAtIndex:i];
                }
                
                [_alert dismissViewControllerAnimated:YES completion:nil];
            }];
            
            [_alert addAction:action];
        }
    }

}

@end
