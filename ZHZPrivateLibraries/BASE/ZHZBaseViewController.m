
//
//  ZHZBaseViewController.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/18.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "ZHZBaseViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <SDWebImage/SDImageCache.h>
#import <Masonry/Masonry.h>
#import "ZHZCustomNoNetworkView.h"
#import "ZHZCustomLoadingAnimationView.h"

/**
 *  弱指针
 */
#define WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self;



@interface ZHZBaseViewController ()
@property (nonatomic, weak) ZHZCustomNoNetworkView *noNetworkEmptyView;
@property (nonatomic, weak) ZHZCustomLoadingAnimationView *animationView;
@end

@implementation ZHZBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)pop {
    if (self.navigationController == nil) return ;
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)loadData{


}
- (void)popToRootVc {
    if (self.navigationController == nil) return ;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)popToVc:(UIViewController *)vc {
    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    if (self.navigationController == nil) return ;
    [self.navigationController popToViewController:vc animated:YES];
}

- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dismissWithCompletion:(void(^)())completion {
    [self dismissViewControllerAnimated:YES completion:completion];
}

- (void)presentVc:(UIViewController *)vc {
    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    [self presentVc:vc completion:nil];
}

- (void)presentVc:(UIViewController *)vc completion:(void (^)(void))completion {
    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    [self presentViewController:vc animated:YES completion:completion];
}

- (void)pushVc:(UIViewController *)vc {
    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    if (self.navigationController == nil) return ;
    if (vc.hidesBottomBarWhenPushed == NO) {
        vc.hidesBottomBarWhenPushed = YES;
    }
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)removeChildVc:(UIViewController *)childVc {
    if ([childVc isKindOfClass:[UIViewController class]] == NO) {
        return ;
    }
    [childVc.view removeFromSuperview];
    [childVc willMoveToParentViewController:nil];
    [childVc removeFromParentViewController];
}

- (void)addChildVc:(UIViewController *)childVc {
    if ([childVc isKindOfClass:[UIViewController class]] == NO) {
        return ;
    }
    [childVc willMoveToParentViewController:self];
    [self addChildViewController:childVc];
    [self.view addSubview:childVc.view];
    childVc.view.frame = self.view.bounds;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (ZHZCustomNoNetworkView *)noNetworkEmptyView {
    if (!_noNetworkEmptyView) {
        ZHZCustomNoNetworkView *empty = [[ZHZCustomNoNetworkView alloc] init];
        [self.view addSubview:empty];
        _noNetworkEmptyView = empty;
        
        WeakSelf(weakSelf);
        [empty mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weakSelf.view);
        }];
        empty.customNoNetworkEmptyViewDidClickRetryHandle = ^(ZHZCustomNoNetworkView *emptyView) {
            [weakSelf loadData];
            
        };
    }
    return _noNetworkEmptyView;
}

- (void)showLoadingAnimation {
    ZHZCustomLoadingAnimationView *animation = [[ZHZCustomLoadingAnimationView alloc] init];
    [animation showInView:self.view];
    _animationView = animation;
    [self.view bringSubviewToFront:animation];
}

- (void)hideLoadingAnimation {
    [_animationView dismiss];
    _animationView = nil;
}
-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [[SDImageCache sharedImageCache] setValue:nil forKey:@"memCache"];
}
- (BOOL)isNetworkReachable {
    return [AFNetworkReachabilityManager sharedManager].reachable;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
