//
//  ZHZAlertController.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/8.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "ZHZAlertController.h"


static NSInteger const UIAlertControllerBlocksCancelButtonIndex = 0;
static NSInteger const UIAlertControllerBlocksDestructiveButtonIndex = 1;
static NSInteger const UIAlertControllerBlocksFirstOtherButtonIndex = 2;
@implementation ZHZAlertController

+ (nonnull UIAlertController *)showInViewController:(UIViewController *)viewController
                                          withTitle:(NSString *)title
                                            message:(NSString *)message
                                     preferredStyle:(UIAlertControllerStyle)preferredStyle
                                  cancelButtonTitle:(NSString *)cancelButtonTitle
                             destructiveButtonTitle:(NSString *)destructiveButtonTitle
                                  otherButtonTitles:(NSArray *)otherButtonTitles
                 popoverPresentationControllerBlock:(void(^)(UIPopoverPresentationController *popover))popoverPresentationControllerBlock
                                           tapBlock:(UIAlertControllerCompletionBlock)tapBlock
{
    UIAlertController *strongController = [UIAlertController alertControllerWithTitle:title
                                                                              message:message
                                                                       preferredStyle:preferredStyle];
    
    __weak UIAlertController *controller = strongController;
    
    if (cancelButtonTitle) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle
                                                               style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction *action){
                                                                 if (tapBlock) {
                                                                     tapBlock(controller, action, UIAlertControllerBlocksCancelButtonIndex);
                                                                 }
                                                             }];
        [controller addAction:cancelAction];
    }
    
    if (destructiveButtonTitle) {
        UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:destructiveButtonTitle
                                                                    style:UIAlertActionStyleDestructive
                                                                  handler:^(UIAlertAction *action){
                                                                      if (tapBlock) {
                                                                          tapBlock(controller, action, UIAlertControllerBlocksDestructiveButtonIndex);
                                                                      }
                                                                  }];
        [controller addAction:destructiveAction];
    }
    
    for (NSUInteger i = 0; i < otherButtonTitles.count; i++) {
        NSString *otherButtonTitle = otherButtonTitles[i];
        
        UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle
                                                              style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction *action){
                                                                if (tapBlock) {
                                                                    tapBlock(controller, action, UIAlertControllerBlocksFirstOtherButtonIndex + i);
                                                                }
                                                            }];
        [controller addAction:otherAction];
    }
    
    if (popoverPresentationControllerBlock) {
        popoverPresentationControllerBlock(controller.popoverPresentationController);
    }
    
    [viewController presentViewController:controller animated:YES completion:nil];
    
    return controller;
}

+ (nonnull UIAlertController *)showAlertInViewController:(UIViewController *)viewController
                                               withTitle:(NSString *)title
                                                 message:(NSString *)message
                                       cancelButtonTitle:(NSString *)cancelButtonTitle
                                  destructiveButtonTitle:(NSString *)destructiveButtonTitle
                                       otherButtonTitles:(NSArray *)otherButtonTitles
                                                tapBlock:(UIAlertControllerCompletionBlock)tapBlock
{
    return [self showInViewController:viewController
                            withTitle:title
                              message:message
                       preferredStyle:UIAlertControllerStyleAlert
                    cancelButtonTitle:cancelButtonTitle
               destructiveButtonTitle:destructiveButtonTitle
                    otherButtonTitles:otherButtonTitles
   popoverPresentationControllerBlock:nil
                             tapBlock:tapBlock];
}

+ (nonnull UIAlertController *)showActionSheetInViewController:(UIViewController *)viewController
                                                     withTitle:(NSString *)title
                                                       message:(NSString *)message
                                             cancelButtonTitle:(NSString *)cancelButtonTitle
                                        destructiveButtonTitle:(NSString *)destructiveButtonTitle
                                             otherButtonTitles:(NSArray *)otherButtonTitles
                                                      tapBlock:(UIAlertControllerCompletionBlock)tapBlock
{
    return [self showActionSheetInViewController:viewController
                                       withTitle:title
                                         message:message
                               cancelButtonTitle:cancelButtonTitle
                          destructiveButtonTitle:destructiveButtonTitle
                               otherButtonTitles:otherButtonTitles
              popoverPresentationControllerBlock:nil
                                        tapBlock:tapBlock];
}

+ (nonnull UIAlertController *)showActionSheetInViewController:(UIViewController *)viewController
                                                     withTitle:(NSString *)title
                                                       message:(NSString *)message
                                             cancelButtonTitle:(NSString *)cancelButtonTitle
                                        destructiveButtonTitle:(NSString *)destructiveButtonTitle
                                             otherButtonTitles:(NSArray *)otherButtonTitles
                            popoverPresentationControllerBlock:(void(^)(UIPopoverPresentationController *popover))popoverPresentationControllerBlock
                                                      tapBlock:(UIAlertControllerCompletionBlock)tapBlock
{
    return [self showInViewController:viewController
                            withTitle:title
                              message:message
                       preferredStyle:UIAlertControllerStyleActionSheet
                    cancelButtonTitle:cancelButtonTitle
               destructiveButtonTitle:destructiveButtonTitle
                    otherButtonTitles:otherButtonTitles
   popoverPresentationControllerBlock:popoverPresentationControllerBlock
                             tapBlock:tapBlock];
}

#pragma mark -

- (NSInteger)cancelButtonIndex
{
    return UIAlertControllerBlocksCancelButtonIndex;
}

- (NSInteger)firstOtherButtonIndex
{
    return UIAlertControllerBlocksFirstOtherButtonIndex;
}

- (NSInteger)destructiveButtonIndex
{
    return UIAlertControllerBlocksDestructiveButtonIndex;
}


@end
