//
//  TwoViewController.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/20.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "TwoViewController.h"
#import "ZHZLoveHeartView.h"
#import "SmokeView.h"
#import "ZHZBorderView.h"

@interface TwoViewController ()
{
    ZHZBorderView *dashRectView;

    ZHZLoveHeartView *vi;
}
@property (weak, nonatomic) IBOutlet SmokeView *smokeView;
@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    dashRectView = [[ZHZBorderView alloc] init];
    [dashRectView setFrame:CGRectMake(2, 2, self.view.frame.size.width-4, self.view.frame.size.height-4)];

    dashRectView.borderType = BorderTypeSolid   ;
    dashRectView.dashPattern = 4;
    dashRectView.spacePattern = 4;
    dashRectView.borderWidth = 1;
    dashRectView.borderColor = [UIColor whiteColor];
    dashRectView.cornerRadius = (self.view.frame.size.height-4)/2.0f;

    [self.view addSubview:dashRectView];
    
    
    vi = [[ZHZLoveHeartView alloc]initWithFrame:CGRectMake(0, 64, 50, 50)];
    [self.view addSubview:vi];
    
    
    

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    static CGFloat degree = 0;
    degree++;
    
    [self.smokeView setSmokeAmount:10];
    [self.smokeView generateSmokeWithSmokeAmount:degree];
    if (degree > 50) {
        [self.smokeView stopSmoke];
    }
    
    
    
    [self.view addSubview:vi];

    [vi animateInView:self.view];

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
