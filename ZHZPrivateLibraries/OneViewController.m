//
//  OneViewController.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/20.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "OneViewController.h"
#import "UIImage+ZHZCreateBarcode.h"
#import "ZHZViewPager.h"
#import "UILabel+Wonderful.h"
#import <YYKit/YYKit.h>

#import "MainViewController.h"
#import "ZHZCardViewController.h"
#import "ZHZTxtViewController.h"
#import "ZHZBackGroundAnimatedImagesView.h"

#import "CXCardView.h"
#import "ZHZTableViewCell.h"

#import <PNChart/PNChart.h>

#import "ZHZAnimationChooseView.h"
#import <Realm/Realm.h>
#import "Car.h"

//设备物理尺寸
#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_height [UIScreen mainScreen].bounds.size.height
#define ARC4RANDOM_MAX 0x100000000

/**
 *  快速定义颜色
 */
#define KRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface OneViewController ()<CAAnimationDelegate,ZHZAnimatedImagesViewDelegate,UITableViewDelegate,UITableViewDataSource,PNChartDelegate>

@property (nonatomic) PNLineChart    *lineChart;
@property (nonatomic) PNBarChart     *barChart;
@property (nonatomic) PNCircleChart  *circleChart;
@property (nonatomic) PNPieChart     *pieChart;
@property (nonatomic) PNScatterChart *scatterChart;
@property (nonatomic) PNRadarChart   *radarChart;
@property (weak, nonatomic) IBOutlet UIImageView *ImagV;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property(nonatomic,strong)ZHZBackGroundAnimatedImagesView *animatedImagesView;
@property (weak, nonatomic) IBOutlet UITableView *table;

@end


//第一中cell的复用标识
static  NSString* firseCellid = @"firseCell";
//第2中cell的复用标识
static  NSString* secCellid = @"secCellid";
//第3中cell的复用标识
static  NSString* threeCellid = @"threeCellid";
//第4中cell的复用标识
static  NSString* fourCellid = @"fourCellid";

@implementation OneViewController

-(void)realmData{

    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    config.schemaVersion = 4;
    config.migrationBlock = ^(RLMMigration *migration, uint64_t oldSchemaVersion)
    {
        // enumerateObjects:block: 遍历了存储在 Realm 文件中的每一个“Person”对象
        [migration enumerateObjects:Car.className block:^(RLMObject *oldObject, RLMObject *newObject) {
            // 只有当 Realm 数据库的架构版本为 0 的时候，才添加 “fullName” 属性
            if (oldSchemaVersion < 1) {
                newObject[@"fullName"] = [NSString stringWithFormat:@"%@ %@", oldObject[@"firstName"], oldObject[@"lastName"]];
            }
            // 只有当 Realm 数据库的架构版本为 0 或者 1 的时候，才添加“email”属性
            if (oldSchemaVersion < 2) {
                newObject[@"email"] = @"";
            }
            // 替换属性名
            if (oldSchemaVersion < 3) { // 重命名操作应该在调用 `enumerateObjects:` 之外完成
                [migration renamePropertyForClass:Car.className oldName:@"yearsSinceBirth" newName:@"age"]; }
        }];
    };
    [RLMRealmConfiguration setDefaultConfiguration:config];
    // 现在我们已经成功更新了架构版本并且提供了迁移闭包，打开旧有的 Realm 数据库会自动执行此数据迁移，然后成功进行访问
    [RLMRealm defaultRealm];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self realmData];
    
    UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, -20, self.navigationController.navigationBar.frame.size.width, 64)];
    bg.backgroundColor = [UIColor colorWithWhite:0 alpha:1];
    
    [self.navigationController.navigationBar insertSubview:bg atIndex:0];
    
    [self.table registerNib:[UINib nibWithNibName:@"ZHZTableViewCell" bundle:nil] forCellReuseIdentifier:threeCellid];
 
    //添加动态图
    self.animatedImagesView = [[ZHZBackGroundAnimatedImagesView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.view addSubview:self.animatedImagesView];
    self.animatedImagesView.delegate = self;
    [self.view insertSubview:self.animatedImagesView belowSubview:self.label];
    [self.animatedImagesView startAnimating];

    
    
//self.label.text = @"iOS9 3D Touch 使用教程";
    
//    [self.label setColorText:@"<iOS9> 3D Touch 使用教程"];
//    [self.label setFontText:@"iOS9 [3D] Touch 使用教程"];
//    [self.label setColorFontText:@"<iOS9 [3D] Touch> 使用教程"];
    
    
//    self.automaticallyAdjustsScrollViewInsets = YES;
//    NSMutableArray *imgs = [NSMutableArray array];
//    
//    
//    NSMutableArray *seletedimgs = [NSMutableArray array];
//    NSMutableArray *Views = [NSMutableArray array];
//    for (int i = 0 ; i < 4; i++) {
//        UIImage *mag = [UIImage imageNamed:@"tabbar_message_center_os7@2x"];
//        [imgs addObject:mag];
//        UIImage *seletmag = [UIImage imageNamed:@"tabbar_home_selected_os7@2x"];
//        [seletedimgs addObject:seletmag];
//        UIView *v = [[UIView alloc]init];
//        [Views addObject:v];
//        
//    }
    
//    ZHZViewPager *pagerView = [[ZHZViewPager alloc]initWithFrame:CGRectMake(0, 64, screen_width, screen_height) titles:@[@"微信",@"通讯录",@"发现",@"我"] icons:imgs selectedIcons:seletedimgs views:Views];
    
//    [self.view addSubview:pagerView];
    [self setRightButtonItem];
    [self changeChartType:0];
}


-(void)setRightButtonItem{
    UIButton *rigthBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [rigthBtn setBackgroundImage:[UIImage imageNamed:@"rightIcon"] forState:UIControlStateNormal];
    rigthBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [rigthBtn addTarget:self action:@selector(areaListView:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithCustomView:rigthBtn];
    /**
     *  width为负数时，相当于btn向右移动width数值个像素，由于按钮本身和边界间距为5pix，所以width设为-15时，间距正好调整
     *  为10；width为正数时，正好相反，相当于往左移动width数值个像素
     */
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -7;
    self.navigationItem.rightBarButtonItems = @[negativeSpacer, right];
}

#pragma mark -动画改变视图
-(void)areaListView:(UIButton*)sender{
    NSArray *charts = @[@"Line Chart",@"Bar Chart",@"Circle Chart",@"Pie Chart",@"Radar Chart",@"Scatter Chart"];
    __weak typeof(self) weakSelf = self;
    ZHZAnimationChooseView *zjView = [[ZHZAnimationChooseView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth-60, 290) info:@"请选择图表样式" titles:charts nameAction:^(NSInteger animationType) {
        for (UIView *view in weakSelf.view.subviews) {
            [view removeFromSuperview];
        }
        [weakSelf changeChartType:animationType];
        [CXCardView dismissCurrent];
        
    }];
    
    [CXCardView showWithView:zjView draggable:YES];
    
}

-(void)changeChartType:(NSInteger)type{
    switch (type) {
        case 0:
            [self addLineChartView];
            break;
            
        case 1:
            [self addBarChartView];
            break;
            
        case 2:
            [self addCircleChartView];
            break;
        case 3:
            [self addPieChartView];
            break;
        case 4:
            [self addRadarChartView];
            break;
        case 5:
            [self addScatterChartView];
            break;
            
    }
}

#pragma mark -线性图表
-(void)addLineChartView{
    self.lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 200.0)];
    self.lineChart.yLabelFormat = @"%1.1f";
    self.lineChart.backgroundColor = [UIColor clearColor];
    [self.lineChart setXLabels:@[@"SEP 1",@"SEP 2",@"SEP 3",@"SEP 4",@"SEP 5",@"SEP 6",@"SEP 7"]];
    self.lineChart.showCoordinateAxis = YES;
    
    self.lineChart.yFixedValueMax = 300.0;
    self.lineChart.yFixedValueMin = 0.0;
    
    [self.lineChart setYLabels:@[@"0 min",@"50 min",@"100 min",@"150 min",@"200 min",@"250 min",@"300 min"]];
    
    
    NSArray * data01Array = @[@60.1, @160.1, @126.4, @0.0, @186.2, @127.2, @176.2];
    PNLineChartData *data01 = [PNLineChartData new];
    data01.dataTitle = @"Alpha";
    data01.color = PNFreshGreen;
    data01.alpha = 0.3f;
    data01.itemCount = data01Array.count;
    data01.inflexionPointStyle = PNLineChartPointStyleTriangle;
    data01.getData = ^(NSUInteger index) {
        CGFloat yValue = [data01Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    
    
    NSArray * data02Array = @[@0.0, @180.1, @26.4, @202.2, @126.2, @167.2, @276.2];
    PNLineChartData *data02 = [PNLineChartData new];
    data02.dataTitle = @"Beta";
    data02.color = PNTwitterColor;
    data02.alpha = 0.5f;
    data02.itemCount = data02Array.count;
    data02.inflexionPointStyle = PNLineChartPointStyleCircle;
    data02.getData = ^(NSUInteger index) {
        CGFloat yValue = [data02Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    
    self.lineChart.chartData = @[data01, data02];
    [self.lineChart strokeChart];
    self.lineChart.delegate = self;
    
    [self.view addSubview:self.lineChart];
    
    self.lineChart.legendStyle = PNLegendItemStyleStacked;
    self.lineChart.legendFont = [UIFont boldSystemFontOfSize:12.0f];
    self.lineChart.legendFontColor = [UIColor redColor];
    
    UIView *legend = [self.lineChart getLegendWithMaxWidth:ScreenWidth];
    [legend setFrame:CGRectMake(30, 340, legend.frame.size.width, legend.frame.size.width)];
    [self.view addSubview:legend];
    
}

#pragma mark -柱状图
-(void)addBarChartView{
    
    static NSNumberFormatter *barChartFormatter;
    if (!barChartFormatter){
        barChartFormatter = [[NSNumberFormatter alloc] init];
        barChartFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
        barChartFormatter.allowsFloats = NO;
        barChartFormatter.maximumFractionDigits = 0;
    }
    
    self.barChart = [[PNBarChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 200.0)];
    //  self.barChart.showLabel = NO;
    self.barChart.backgroundColor = [UIColor clearColor];
    self.barChart.yLabelFormatter = ^(CGFloat yValue){
        return [barChartFormatter stringFromNumber:@(yValue)];
    };
    
    self.barChart.yChartLabelWidth = 20.0;
    self.barChart.chartMarginLeft = 30.0;
    self.barChart.chartMarginRight = 10.0;
    self.barChart.chartMarginTop = 5.0;
    self.barChart.chartMarginBottom = 10.0;
    
    
    self.barChart.labelMarginTop = 5.0;
    self.barChart.showChartBorder = YES;
    [self.barChart setXLabels:@[@"2",@"3",@"4",@"5",@"2",@"3",@"4",@"5"]];
    //    self.barChart.yLabels = @[@-10,@0,@10];
    //     [self.barChart setYValues:@[@10000.0,@30000.0,@10000.0,@100000.0,@500000.0,@1000000.0,@1150000.0,@2150000.0]];
    [self.barChart setYValues:@[@10.82,@1.88,@6.96,@33.93,@10.82,@1.88,@6.96,@33.93]];
    [self.barChart setStrokeColors:@[PNGreen,PNGreen,PNRed,PNGreen,PNGreen,PNGreen,PNRed,PNGreen]];
    self.barChart.isGradientShow = NO;
    self.barChart.isShowNumbers = NO;
    
    [self.barChart strokeChart];
    
    self.barChart.delegate = self;
    
    [self.view addSubview:self.barChart];
}


#pragma mark -圆形图
-(void)addCircleChartView{
    
    self.circleChart = [[PNCircleChart alloc] initWithFrame:CGRectMake(0,150.0, SCREEN_WIDTH, 100.0)
                                                      total:@100
                                                    current:@60
                                                  clockwise:YES];
    
    self.circleChart.backgroundColor = [UIColor clearColor];
    
    [self.circleChart setStrokeColor:[UIColor clearColor]];
    [self.circleChart setStrokeColorGradientStart:KRGBA(20, 115, 213, 1)];
    [self.circleChart strokeChart];
    
    [self.view addSubview:self.circleChart];
}


#pragma mark -饼状图
-(void)addPieChartView{
    NSArray *items = @[[PNPieChartDataItem dataItemWithValue:10 color:PNLightGreen],
                       [PNPieChartDataItem dataItemWithValue:20 color:PNFreshGreen description:@"WWDC"],
                       [PNPieChartDataItem dataItemWithValue:40 color:PNDeepGreen description:@"GOOG I/O"],
                       ];
    
    self.pieChart = [[PNPieChart alloc] initWithFrame:CGRectMake(SCREEN_WIDTH /2.0 - 100, 135, 200.0, 200.0) items:items];
    self.pieChart.descriptionTextColor = [UIColor whiteColor];
    self.pieChart.descriptionTextFont  = [UIFont fontWithName:@"Avenir-Medium" size:11.0];
    self.pieChart.descriptionTextShadowColor = [UIColor clearColor];
    self.pieChart.showAbsoluteValues = NO;
    self.pieChart.showOnlyValues = NO;
    [self.pieChart strokeChart];
    
    
    self.pieChart.legendStyle = PNLegendItemStyleStacked;
    self.pieChart.legendFont = [UIFont boldSystemFontOfSize:12.0f];
    
    UIView *legend = [self.pieChart getLegendWithMaxWidth:200];
    [legend setFrame:CGRectMake(130, 350, legend.frame.size.width, legend.frame.size.height)];
    [self.view addSubview:legend];
    
    [self.view addSubview:self.pieChart];
}

#pragma mark -分散列表
-(void)addScatterChartView{
    self.scatterChart = [[PNScatterChart alloc] initWithFrame:CGRectMake(SCREEN_WIDTH /6.0 - 30, 135, 280, 200)];
    //        self.scatterChart.yLabelFormat = @"xxx %1.1f";
    [self.scatterChart setAxisXWithMinimumValue:20 andMaxValue:100 toTicks:6];
    [self.scatterChart setAxisYWithMinimumValue:30 andMaxValue:50 toTicks:5];
    [self.scatterChart setAxisXLabel:@[@"x1", @"x2", @"x3", @"x4", @"x5", @"x6"]];
    [self.scatterChart setAxisYLabel:@[@"y1", @"y2", @"y3", @"y4", @"y5"]];
    
    NSArray * data01Array = [self randomSetOfObjects];
    PNScatterChartData *data01 = [PNScatterChartData new];
    data01.strokeColor = PNGreen;
    data01.fillColor = PNFreshGreen;
    data01.size = 2;
    data01.itemCount = [[data01Array objectAtIndex:0] count];
    data01.inflexionPointStyle = PNScatterChartPointStyleCircle;
    __block NSMutableArray *XAr1 = [NSMutableArray arrayWithArray:[data01Array objectAtIndex:0]];
    __block NSMutableArray *YAr1 = [NSMutableArray arrayWithArray:[data01Array objectAtIndex:1]];
    
    data01.getData = ^(NSUInteger index) {
        CGFloat xValue = [[XAr1 objectAtIndex:index] floatValue];
        CGFloat yValue = [[YAr1 objectAtIndex:index] floatValue];
        return [PNScatterChartDataItem dataItemWithX:xValue AndWithY:yValue];
    };
    
    [self.scatterChart setup];
    self.scatterChart.chartData = @[data01];
    /***
     this is for drawing line to compare
     CGPoint start = CGPointMake(20, 35);
     CGPoint end = CGPointMake(80, 45);
     [self.scatterChart drawLineFromPoint:start ToPoint:end WithLineWith:2 AndWithColor:PNBlack];
     ***/
    self.scatterChart.delegate = self;
    [self.view addSubview:self.scatterChart];
}

- (NSArray *) randomSetOfObjects{
    NSMutableArray *array = [NSMutableArray array];
    NSString *LabelFormat = @"%1.f";
    NSMutableArray *XAr = [NSMutableArray array];
    NSMutableArray *YAr = [NSMutableArray array];
    for (int i = 0; i < 25 ; i++) {
        [XAr addObject:[NSString stringWithFormat:LabelFormat,(((double)arc4random() / ARC4RANDOM_MAX) * (self.scatterChart.AxisX_maxValue - self.scatterChart.AxisX_minValue) + self.scatterChart.AxisX_minValue)]];
        [YAr addObject:[NSString stringWithFormat:LabelFormat,(((double)arc4random() / ARC4RANDOM_MAX) * (self.scatterChart.AxisY_maxValue - self.scatterChart.AxisY_minValue) + self.scatterChart.AxisY_minValue)]];
    }
    [array addObject:XAr];
    [array addObject:YAr];
    return (NSArray*) array;
}

-(void)addRadarChartView{
    NSArray *items = @[[PNRadarChartDataItem dataItemWithValue:3 description:@"Art"],
                       [PNRadarChartDataItem dataItemWithValue:2 description:@"Math"],
                       [PNRadarChartDataItem dataItemWithValue:8 description:@"Sports"],
                       [PNRadarChartDataItem dataItemWithValue:5 description:@"Literature"],
                       [PNRadarChartDataItem dataItemWithValue:4 description:@"Other"],
                       ];
    self.radarChart = [[PNRadarChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 300.0) items:items valueDivider:1];
    [self.radarChart strokeChart];
    
    [self.view addSubview:self.radarChart];
}

-(void)userClickedOnLineKeyPoint:(CGPoint)point lineIndex:(NSInteger)lineIndex pointIndex:(NSInteger)pointIndex{
    NSLog(@"Click Key on line %f, %f line index is %d and point index is %d",point.x, point.y,(int)lineIndex, (int)pointIndex);
}

-(void)userClickedOnLinePoint:(CGPoint)point lineIndex:(NSInteger)lineIndex{
    NSLog(@"Click on line %f, %f, line index is %d",point.x, point.y, (int)lineIndex);
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZHZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:firseCellid];
    
    if (!cell) {
        cell = [[ZHZTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:firseCellid];
        UILabel *lab = [UILabel new];
        lab.tag = 100;
        [cell.contentView addSubview:lab];
    }
    UILabel *label = [cell.contentView viewWithTag:100];
    label.text = @"蛋疼的复用问题";
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MainViewController * fc = [[MainViewController alloc]init];
    fc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:fc animated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)test:(id)sender {
//    NSURL *url = [NSURL URLWithString:@"news://"];
//    
//    if ([[UIApplication sharedApplication] canOpenURL:url]) {
//        [[UIApplication sharedApplication] openURL:url];
//    }
    
    [self show:@"消息通知"];
//    self.ImagV.image = [UIImage imageOfQRFromURL:@"www.baidu.com" codeSize:self.ImagV.frame.size.width red:0 green:0 blue:0 insertImage:[UIImage new]];
    
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    transition.delegate = self;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    ZHZTxtViewController * fc = [[ZHZTxtViewController alloc]init];
    fc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:fc animated:NO];
    
}
- (NSUInteger)animatedImagesNumberOfImages:(ZHZBackGroundAnimatedImagesView*)animatedImagesView
{
    return 2;
}

- (UIImage*)animatedImagesView:(ZHZBackGroundAnimatedImagesView*)animatedImagesView imageAtIndex:(NSUInteger)index
{
    
    if (index == 0) {
        return [UIImage imageNamed:@"bg1"];
        
    }else{
        
        return [UIImage imageNamed:@"bg2"];
        
    }
    
}

-(void)show:(NSString*)msg{
    CGFloat padding = 10;
    YYLabel *label = [YYLabel new];
    label.text = msg;
    label.font = [UIFont systemFontOfSize:16];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor colorWithRed:0.033 green:0.685 blue:0.978 alpha:0.730];
    label.width = self.view.width;
    label.textContainerInset = UIEdgeInsetsMake(padding, padding, padding, padding);
    label.height = [msg heightForFont:label.font width:label.width] + 2 * padding;
    label.bottom = (kiOS7Later ? 64 : 0);
    [self.view addSubview:label];
    [UIView animateWithDuration:0.3 animations:^{
        label.top = (kiOS7Later ? 64 : 0);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 delay:2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            label.bottom = (kiOS7Later ? 64 : 0);
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
    }];
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
