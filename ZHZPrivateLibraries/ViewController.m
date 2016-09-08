//
//  ViewController.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/7.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "ViewController.h"
#import "ZHZTools.h"
#import "ZHZCustomAlertView.h"
#import "ZHZInfoGuidView.h"
#import "ZHZImageCustom.h"
#import "ZHZAlertController.h"
#import "DownDataTool.h"
#import "ZHZObjectTransformer.h"

static NSString * const sampleDescription1 = @"这是你大爷.";
static NSString * const sampleDescription2 = @"这是你二大爷.";
static NSString * const sampleDescription3 = @"这是你三大爷.";
static NSString * const sampleDescription4 = @"这是你四大爷.";

@interface ViewController ()<ZHZGuidViewDelegate,ZHZCustomAlertViewDelegate>
{
    UIView *rootView;
    ZHZInfoGuidView *_intro;
}
@property (weak, nonatomic) IBOutlet UIImageView *imgV;

@end

@implementation ViewController


-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (IBAction)tan:(id)sender {
    /**
     
     [ZHZAlertController showInViewController:self withTitle:@"提示" message:@"啧啧" preferredStyle:UIAlertControllerStyleAlert cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@[@"1",@"2",@"3"] popoverPresentationControllerBlock:^(UIPopoverPresentationController * _Nonnull popover) {
     NSLog(@"popover ==>%@",popover);
     } tapBlock:^(UIAlertController * _Nonnull controller, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
     NSLog(@"%ld",buttonIndex);
     
     }];
     */
    
    NSString *urlStr = @"http://b2c.ezparking.com.cn/rtpi-service/misc/token.do?deviceId=86bcc88b562210ccd5e68221ee9121ec26fed2f9&app=com.ezparking.ios.qibutingche&version=1";
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [DownDataTool getUrl:urlStr params:nil success:^(id data) {
        NSLog(@"%@",data);
//        self.imgV.image = [ZHZObjectTransformer data2image:data];
        
        NSArray *arr = [ZHZObjectTransformer data2array:data];
        
        NSDictionary *dic = [ZHZObjectTransformer JSONdata2dictionary:data];
        NSLog(@"%@",dic);

        
    } fail:^(NSError *error) {
        
        NSLog(@"%@",error);
        
        NSHTTPURLResponse *respon = error.userInfo[@"com.alamofire.serialization.response.error.response"];
        NSLog(@"%@",respon.allHeaderFields);
        NSString *msg = [respon.allHeaderFields[@"Message"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",msg);
    }];
    
    return;
    
    ZHZCustomAlertView * alertView = [[ZHZCustomAlertView alloc] initWithTitle:@"弹窗" message:@"这是我自己定义的弹窗" cancelButtonTitle:@"取消" otherButtonTitle:@"OK"];
    alertView.delegate = self;
    alertView.shouldDismissOnOutsideTapped = YES;
    alertView.appearAnimationType = ZHZAlertViewAnimationTypeFlyLeft;
    alertView.disappearAnimationType = ZHZAlertViewAnimationTypeFlyRight;
    alertView.appearTime = 1;
    alertView.disappearTime = 1;
    [alertView show];
   }
- (void)viewDidLoad {
    [super viewDidLoad];
    rootView = self.navigationController.view;
    if ([ZHZTools isPhoneNumber:@"17823819717"]) {
        NSLog(@"这是一个手机号");
    }
//    self.imgV.image = [ZHZImageCustom resizeImage:[UIImage imageNamed:@"bg2"] toSize:self.imgV.frame.size contentMode:UIViewContentModeScaleToFill];
//    self.imgV.image = [ZHZImageCustom blurredImage:[UIImage imageNamed:@"title1"] radius:0.2];
}
- (void)showIntroWithCustomView {
    ZHZInfoPage *page1 = [ZHZInfoPage page];
    page1.title = @"Hello world";
    page1.desc = sampleDescription1;
    page1.bgImage = [UIImage imageNamed:@"bg1"];
    page1.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title1"]];
    
    UIView *viewForPage2 = [[UIView alloc] initWithFrame:rootView.bounds];
    UILabel *labelForPage2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 300, rootView.bounds.size.width, 30)];
    labelForPage2.text = @"Some custom view";
    labelForPage2.font = [UIFont systemFontOfSize:32];
    labelForPage2.textColor = [UIColor whiteColor];
    labelForPage2.backgroundColor = [UIColor clearColor];
    labelForPage2.transform = CGAffineTransformMakeRotation(M_PI_2*3);
    [viewForPage2 addSubview:labelForPage2];
    ZHZInfoPage *page2 = [ZHZInfoPage pageWithCustomView:viewForPage2];
    page2.bgImage = [UIImage imageNamed:@"bg2"];
    
    ZHZInfoPage *page3 = [ZHZInfoPage page];
    page3.title = @"This is page 3";
    page3.desc = sampleDescription3;
    page3.bgImage = [UIImage imageNamed:@"bg3"];
    page3.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title3"]];
    
    ZHZInfoPage *page4 = [ZHZInfoPage page];
    page4.title = @"This is page 4";
    page4.desc = sampleDescription4;
    page4.bgImage = [UIImage imageNamed:@"bg4"];
    page4.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title4"]];
    
    ZHZInfoGuidView *intro = [[ZHZInfoGuidView alloc] initWithFrame:rootView.bounds andPages:@[page1,page2,page3,page4]];
    [intro.skipButton setTitle:@"开启" forState:UIControlStateNormal];
    [intro setDelegate:self];
    
    [intro showInView:rootView animateDuration:0.3];
}

- (void)showIntroWithCrossDissolve {
    ZHZInfoPage *page1 = [ZHZInfoPage page];
    page1.title = @"Hello world";
    page1.desc = sampleDescription1;
    page1.bgImage = [UIImage imageNamed:@"bg1"];
    page1.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title1"]];
    
    ZHZInfoPage *page2 = [ZHZInfoPage page];
    page2.title = @"This is page 2";
    page2.desc = sampleDescription2;
    page2.bgImage = [UIImage imageNamed:@"bg2"];
    page2.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title2"]];
    
    ZHZInfoPage *page3 = [ZHZInfoPage page];
    page3.title = @"This is page 3";
    page3.desc = sampleDescription3;
    page3.bgImage = [UIImage imageNamed:@"bg3"];
    page3.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title3"]];
    
    ZHZInfoPage *page4 = [ZHZInfoPage page];
    page4.title = @"This is page 4";
    page4.desc = sampleDescription4;
    page4.bgImage = [UIImage imageNamed:@"bg4"];
    page4.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title4"]];
    
    ZHZInfoGuidView *intro = [[ZHZInfoGuidView alloc] initWithFrame:rootView.bounds andPages:@[page1,page2,page3,page4]];
    [intro setDelegate:self];
    
    [intro showInView:rootView animateDuration:0.3];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)otherButtonClickedOnAlertView:(ZHZCustomAlertView *)alertView{

    [self showIntroWithCustomView];
}

@end
