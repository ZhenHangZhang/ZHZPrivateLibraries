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
#import "UIView+FRAME.h"

#import "CalendarPicker.h"


#define kScreen     [UIScreen mainScreen].bounds
#define kOneYear  60 * 60 * 24 * 365
#define kOneMonth 60 * 60 * 24 * 30
#define kOneDay   60 * 60 * 24


@interface TwoViewController ()<CalendarPickerDelegate>
{
    ZHZBorderView *dashRectView;

    ZHZLoveHeartView *vi;
}

@property (nonatomic, weak) CalendarPicker *normalPick;

@property (weak, nonatomic) IBOutlet SmokeView *smokeView;
@end

@implementation TwoViewController

- (CalendarPicker *)normalPick {
    if (!_normalPick) {
        CalendarPicker *picker = [[CalendarPicker alloc] init];
        picker.startDate = [NSDate dateWithTimeInterval:- kOneYear - kOneMonth * 3 sinceDate:picker.targetDate];
        picker.endDate = [NSDate dateWithTimeInterval:0 sinceDate:picker.targetDate];
        picker.delegate = self;
        [self.view addSubview:picker];
        _normalPick = picker;
    }
    return _normalPick;
}

- (IBAction)test:(id)sender {
    
    if (self.normalPick.x < 0) {
        [UIView animateWithDuration:0.5 animations:^{
            self.normalPick.x = 0;
        }];
    } else {
        [UIView animateWithDuration:0.5 animations:^{
            self.normalPick.x = -kScreen.size.width;
        }];
    }
    
}
- (IBAction)rrr:(id)sender {
    if (self.normalPick.x < 0) {
        [UIView animateWithDuration:0.5 animations:^{
            self.normalPick.x = 0;
        }];
    } else {
        [UIView animateWithDuration:0.5 animations:^{
            self.normalPick.x = -kScreen.size.width;
        }];
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.normalPick.frame = CGRectMake(-kScreen.size.width, 210, kScreen.size.width, 300);
    
//    dashRectView = [[ZHZBorderView alloc] init];
//    [dashRectView setFrame:CGRectMake(2, 2, self.view.frame.size.width-4, self.view.frame.size.height-4)];
//
//    dashRectView.borderType = BorderTypeSolid   ;
//    dashRectView.dashPattern = 4;
//    dashRectView.spacePattern = 4;
//    dashRectView.borderWidth = 1;
//    dashRectView.borderColor = [UIColor whiteColor];
//    dashRectView.cornerRadius = (self.view.frame.size.height-4)/2.0f;
//
//    [self.view addSubview:dashRectView];
//    
//    
//    vi = [[ZHZLoveHeartView alloc]initWithFrame:CGRectMake(0, 64, 50, 50)];
//    [self.view addSubview:vi];
}
- (void)calendarPicker:(CalendarPicker *)calendarPicker DidChooseDate:(NSDate *)chooseDate withStatus:(NSInteger)status {
    NSLog(@"%@-%ld", chooseDate, status);
}

 

/**
 -(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
 
 return;
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
 */

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
