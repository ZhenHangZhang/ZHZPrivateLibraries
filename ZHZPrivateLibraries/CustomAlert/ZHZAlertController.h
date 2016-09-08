//
//  ZHZAlertController.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/8.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>




@interface ZHZAlertController : NSObject


typedef void (^UIAlertControllerPopoverPresentationControllerBlock) (UIPopoverPresentationController * __nonnull popover);
typedef void (^UIAlertControllerCompletionBlock) (UIAlertController * __nonnull controller, UIAlertAction * __nonnull action, NSInteger buttonIndex);

+ (nonnull UIAlertController *)showInViewController:(nonnull UIViewController *)viewController
                                          withTitle:(nullable NSString *)title
                                            message:(nullable NSString *)message
                                     preferredStyle:(UIAlertControllerStyle)preferredStyle
                                  cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                             destructiveButtonTitle:(nullable NSString *)destructiveButtonTitle
                                  otherButtonTitles:(nullable NSArray *)otherButtonTitles
                 popoverPresentationControllerBlock:(nullable UIAlertControllerPopoverPresentationControllerBlock)popoverPresentationControllerBlock
                                           tapBlock:(nullable UIAlertControllerCompletionBlock)tapBlock;

+ (nonnull UIAlertController *)showAlertInViewController:(nonnull UIViewController *)viewController
                                               withTitle:(nullable NSString *)title
                                                 message:(nullable NSString *)message
                                       cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                                  destructiveButtonTitle:(nullable NSString *)destructiveButtonTitle
                                       otherButtonTitles:(nullable NSArray *)otherButtonTitles
                                                tapBlock:(nullable UIAlertControllerCompletionBlock)tapBlock;

+ (nonnull UIAlertController *)showActionSheetInViewController:(nonnull UIViewController *)viewController
                                                     withTitle:(nullable NSString *)title
                                                       message:(nullable NSString *)message
                                             cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                                        destructiveButtonTitle:(nullable NSString *)destructiveButtonTitle
                                             otherButtonTitles:(nullable NSArray *)otherButtonTitles
                            popoverPresentationControllerBlock:(nullable UIAlertControllerPopoverPresentationControllerBlock)popoverPresentationControllerBlock
                                                      tapBlock:(nullable UIAlertControllerCompletionBlock)tapBlock;

@property (readonly, nonatomic) NSInteger cancelButtonIndex;
@property (readonly, nonatomic) NSInteger firstOtherButtonIndex;
@property (readonly, nonatomic) NSInteger destructiveButtonIndex;





@end
