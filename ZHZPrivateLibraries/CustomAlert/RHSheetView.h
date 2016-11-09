//
//  RHSheetView.h
//  Demo
//
//  Created by 郭人豪 on 2016/10/26.
//  Copyright © 2016年 Abner_G. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol RHSheetViewDelegate;
@interface RHSheetView : NSObject

@property (nonatomic, weak) id<RHSheetViewDelegate> delegate;

@property (nonatomic, strong) NSArray * actionTitles;

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message;

- (void)showWithController:(UIViewController *)controller;
@end
@protocol RHSheetViewDelegate <NSObject>

@optional
- (UIAlertActionStyle)sheetView:(RHSheetView *)sheetView actionStyleAtIndex:(NSInteger)index;

- (void)sheetView:(RHSheetView *)sheetView didSelectedAtIndex:(NSInteger)index;

@end
