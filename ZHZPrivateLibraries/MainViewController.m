
//
//  MainViewController.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/27.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()<CAAnimationDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    


}

-(void)pop{
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromTop;
    transition.delegate = self;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
//    MainViewController * fc = [[MainViewController alloc]init];
//    fc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController popViewControllerAnimated:YES];

    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self pop];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
