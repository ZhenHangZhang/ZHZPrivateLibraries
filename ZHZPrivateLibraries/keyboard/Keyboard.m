//
//  Keyboard.m
//  Park
//
//  Created by zhanghangzhen on 16/3/17.
//  Copyright © 2016年  apple. All rights reserved.
//

#import "Keyboard.h"
#import "ZHZHeader.h"


#define  iPhone4     ([[UIScreen mainScreen] bounds].size.height==480)

#define  iPhone5     ([[UIScreen mainScreen] bounds].size.height==568)

#define  iPhone6     ([[UIScreen mainScreen] bounds].size.height==667)

#define  iPhone6plus ([[UIScreen mainScreen] bounds].size.height==736)

@interface Keyboard ()

@property(nonatomic,strong)NSMutableArray *proNameArray;

@property(nonatomic,strong)NSMutableArray*charsAndNumArray;
@property(nonatomic,strong)UIScrollView *keyBoardView;
@property(nonatomic,strong)UIView*viewLeft;
@property(nonatomic,strong)UIView*viewRight;
@property(nonatomic,strong)UIButton*buttonProName;
//重输
@property(nonatomic,strong)UIButton*buttonInputAgain;
//删除
@property(nonatomic,strong)UIButton*buttonDelete;
//数字
@property(nonatomic,strong)UIButton*buttonCharsAndNum;

@end

@implementation Keyboard

-(NSMutableArray *)proNameArray
{
    if (_proNameArray == nil) {
        _proNameArray = [NSMutableArray arrayWithObjects:
                         @"苏",@"浙", @"皖", @"闽",
                         @"赣", @"鲁",@"川", @"贵",
                         @"云", @"藏", @"粤", @"桂", @"琼",
                         @"豫", @"鄂", @"湘", @"冀", @"晋",
                         @"蒙", @"辽", @"吉", @"黑", @"陕",
                         @"甘", @"青", @"宁", @"新", @"京",
                         @"津", @"沪", @"渝", nil];
    }
    return _proNameArray;
}
- (NSMutableArray *)charsAndNumArray
{
    if (_charsAndNumArray == nil) {
        self.charsAndNumArray = [NSMutableArray arrayWithObjects:
                                 @"1", @"2", @"3", @"4", @"5",
                                 @"6", @"7", @"8", @"9", @"0",
                                 @"Q", @"W", @"E", @"R",
                                 @"T", @"Y", @"U", @"I", @"O",
                                 @"P", @"A", @"S", @"D", @"F",
                                 @"G", @"H", @"J", @"K", @"L",
                                 @"Z", @"X", @"C", @"V",
                                 @"B", @"N", @"M", nil];
    }
    return _charsAndNumArray;
}

+(Keyboard*)show{
    static Keyboard *keb = nil;
    if (keb == nil) {
        keb = [[Keyboard alloc]init];
    }
    return keb;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor=[UIColor colorWithRed:235/255.0 green:238/255.0 blue:242/255.0 alpha:1.0];
        CGRect rect = CGRectZero;
        if (iPhone4 || iPhone5) {
            rect = CGRectMake(0, 0, 320, 216);
        }else if (iPhone6){
            rect = CGRectMake(0, 0, 375, 216);
        }else{
            rect = CGRectMake(0, 0, 414, 226);
        }
        self.frame = rect;
        [self createKeyboard];
    }
    return self;
}
-(void)createKeyboard{

    self.keyBoardView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 35, SCREEN_WIDTH, self.frame.size.height)];
    self.keyBoardView.bounces = NO;
    self.keyBoardView.showsHorizontalScrollIndicator = FALSE;
    self.keyBoardView.delaysContentTouches = NO;
    self.keyBoardView.canCancelContentTouches = NO;
    self.keyBoardView.pagingEnabled = YES;
    self.keyBoardView.backgroundColor = [UIColor colorWithRed:235/255.0 green:238/255.0 blue:242/255.0 alpha:1.0];
    // 范围
    self.keyBoardView.contentSize = CGSizeMake(SCREEN_WIDTH * 2, 0);
    [self addSubview:self.keyBoardView];
    
    self.viewLeft = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.frame.size.height)];
    self.viewLeft.backgroundColor = [UIColor colorWithRed:235/255.0 green:238/255.0 blue:242/255.0 alpha:1.0];
    [self.keyBoardView addSubview:self.viewLeft];
    
    self.viewRight = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, self.frame.size.height)];
    self.viewRight.backgroundColor = [UIColor colorWithRed:235/255.0 green:238/255.0 blue:242/255.0 alpha:1.0];
    [self.keyBoardView addSubview:self.viewRight];
    
    // 省名简称
    for (NSInteger i = 0; i < 10; i ++) {
        self.buttonProName = [ZHZFactory creatButtonWithFrame:CGRectMake(0 + SCREEN_WIDTH / 10 * i, 5, SCREEN_WIDTH / 10 - 2, 40) target:self sel:@selector(inputBelongingAddress1:) tag:i+10 image:nil title:self.proNameArray[i]];
        
        self.buttonProName.layer.cornerRadius = 5;
        self.buttonProName.layer.borderColor = [UIColor colorWithRed:117/255.0 green:124/255.0 blue:130/255.0 alpha:1.0].CGColor;
        self.buttonProName.backgroundColor = [UIColor whiteColor];
        self.buttonProName.layer.borderWidth = 0.5;
        self.buttonProName.titleLabel.font = [UIFont systemFontOfSize:17];
        [self.buttonProName setTitleColor:[UIColor cyanColor] forState:UIControlStateHighlighted];
        [self.buttonProName setTitleColor:[UIColor colorWithRed:67/255.0 green:67/255.0 blue:67/255.0 alpha:1.0] forState:UIControlStateNormal];
        [self.viewLeft addSubview:self.buttonProName];
    }
    for (NSInteger i = 0; i < 9; i ++) {
        self.buttonProName = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buttonProName.frame = CGRectMake(SCREEN_WIDTH / 20 + i * SCREEN_WIDTH / 10, 50, SCREEN_WIDTH / 10 - 2, 40);
        [self.viewLeft addSubview:self.buttonProName];
        self.buttonProName.backgroundColor = [UIColor whiteColor];
        [self.buttonProName setTitle:self.proNameArray[i + 10] forState:UIControlStateNormal];
        self.buttonProName.layer.cornerRadius = 5;
        [self.buttonProName setTitleColor:[UIColor colorWithRed:67/255.0 green:67/255.0 blue:67/255.0 alpha:1.0] forState:UIControlStateNormal];
        self.buttonProName.layer.borderColor = [UIColor colorWithRed:117/255.0 green:124/255.0 blue:130/255.0 alpha:1.0].CGColor;
        self.buttonProName.layer.borderWidth = 0.5;
        [self.buttonProName setTitleColor:[UIColor cyanColor] forState:UIControlStateHighlighted];
        [self.buttonProName addTarget:self action:@selector(inputBelongingAddress1:) forControlEvents:UIControlEventTouchUpInside];
    }
    for (NSInteger i = 0; i < 8; i ++) {
        self.buttonProName = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buttonProName.frame = CGRectMake(SCREEN_WIDTH / 20 * 1.8 + SCREEN_WIDTH / 10 * i, 95, SCREEN_WIDTH / 10 - 2, 40);
        self.buttonProName.backgroundColor = [UIColor whiteColor];
        [self.viewLeft addSubview:self.buttonProName];
        [self.buttonProName setTitle:self.proNameArray[i + 19] forState:UIControlStateNormal];
        self.buttonProName.layer.cornerRadius = 5;
        self.buttonProName.layer.borderColor = [UIColor colorWithRed:117/255.0 green:124/255.0 blue:130/255.0 alpha:1.0].CGColor;
        self.buttonProName.layer.borderWidth = 0.5;
        [self.buttonProName setTitleColor:[UIColor colorWithRed:67/255.0 green:67/255.0 blue:67/255.0 alpha:1.0] forState:UIControlStateNormal];
        [self.buttonProName setTitleColor:[UIColor cyanColor] forState:UIControlStateHighlighted];
        [self.buttonProName addTarget:self action:@selector(inputBelongingAddress1:) forControlEvents:UIControlEventTouchUpInside];
    }
    for (NSInteger i = 0; i < 4; i ++) {
        self.buttonProName = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buttonProName.frame = CGRectMake(SCREEN_WIDTH / 10 * 3 + SCREEN_WIDTH / 10 * i, 140, SCREEN_WIDTH / 10 - 2, 40);
        self.buttonProName.backgroundColor = [UIColor whiteColor];
        [self.viewLeft addSubview:self.buttonProName];
        [self.buttonProName setTitle:self.proNameArray[i + 27] forState:UIControlStateNormal];
        self.buttonProName.layer.cornerRadius = 5;
        self.buttonProName.layer.borderColor = [UIColor colorWithRed:117/255.0 green:124/255.0 blue:130/255.0 alpha:1.0].CGColor;
        self.buttonProName.layer.borderWidth = 0.5;
        [self.buttonProName setTitleColor:[UIColor cyanColor] forState:UIControlStateHighlighted];
        
        [self.buttonProName setTitleColor:[UIColor colorWithRed:67/255.0 green:67/255.0 blue:67/255.0 alpha:1.0] forState:UIControlStateNormal];
        [self.buttonProName addTarget:self action:@selector(inputBelongingAddress1:) forControlEvents:UIControlEventTouchUpInside];
    }
    self.buttonInputAgain = [ZHZFactory creatButtonWithFrame:CGRectMake(10, 0, 40, 35) target:self sel:@selector(inputAgainChars1:) tag:1 image:nil title:@"重输"];
    self.buttonInputAgain.titleLabel.font = [UIFont systemFontOfSize:17];
    [self.buttonInputAgain setTitleColor:[UIColor colorWithRed:87/255.0 green:137/255.0 blue:156/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self addSubview:self.buttonInputAgain];

    self.buttonDelete = [ZHZFactory creatButtonWithFrame:CGRectMake(SCREEN_WIDTH - 35, 5, 30, 20) target:self sel:@selector(deleteChars1:) tag:2 image:@"delete_icon_nor" title:nil];
    [self.buttonDelete setImage:[UIImage imageNamed:@"delete_icon_nor"] forState:UIControlStateNormal];
    [self.buttonDelete setImage:[UIImage imageNamed:@"delete_icon_height"] forState:UIControlStateHighlighted];
    [self addSubview:self.buttonDelete];
    /**
     *  字母和数字键盘
     */
    for (NSInteger i = 0; i < 10; i ++) {
        self.buttonCharsAndNum = [ZHZFactory creatButtonWithFrame:CGRectMake(0 + SCREEN_WIDTH / 10 * i, 5, SCREEN_WIDTH / 10 - 2, 40) target:self sel:@selector(inputChars1:) tag:i+100 image:nil title:self.charsAndNumArray[i]];
        self.buttonCharsAndNum.layer.cornerRadius = 5;
        self.buttonCharsAndNum.layer.borderColor = [UIColor colorWithRed:117/255.0 green:124/255.0 blue:130/255.0 alpha:1.0].CGColor;
        self.buttonCharsAndNum.layer.borderWidth = 0.5;
        self.buttonCharsAndNum.titleLabel.font = [UIFont systemFontOfSize:17];
        [self.buttonCharsAndNum setTitleColor:[UIColor colorWithRed:67/255.0 green:67/255.0 blue:67/255.0 alpha:1.0] forState:UIControlStateNormal];
        self.buttonCharsAndNum.backgroundColor = [UIColor colorWithRed:0.8913 green:0.9607 blue:0.9494 alpha:1.0];
        [self.viewRight addSubview:self.buttonCharsAndNum];
    }
    
    for (NSInteger i = 0; i < 10; i ++) {
        self.buttonCharsAndNum = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buttonCharsAndNum.frame = CGRectMake(0 + SCREEN_WIDTH / 10 * i, 50, SCREEN_WIDTH / 10 - 2, 40);
        [self.viewRight addSubview:self.buttonCharsAndNum];
        self.buttonCharsAndNum.backgroundColor = [UIColor whiteColor];
        [self.buttonCharsAndNum setTitle:self.charsAndNumArray[i + 10] forState:UIControlStateNormal];
        self.buttonCharsAndNum.layer.cornerRadius = 5;
        self.buttonCharsAndNum.layer.borderColor = [UIColor colorWithRed:117/255.0 green:124/255.0 blue:130/255.0 alpha:1.0].CGColor;
        self.buttonCharsAndNum.layer.borderWidth = 0.5;
        [self.buttonCharsAndNum setTitleColor:[UIColor colorWithRed:67/255.0 green:67/255.0 blue:67/255.0 alpha:1.0] forState:UIControlStateNormal];
        [self.buttonCharsAndNum addTarget:self action:@selector(inputChars1:) forControlEvents:UIControlEventTouchUpInside];
    }
    for (NSInteger i = 0; i < 9; i ++) {
        self.buttonCharsAndNum = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buttonCharsAndNum.frame = CGRectMake(SCREEN_WIDTH / 20 + SCREEN_WIDTH / 10 * i, 95, SCREEN_WIDTH / 10 - 2, 40);
        self.buttonCharsAndNum.backgroundColor = [UIColor whiteColor];
        [self.viewRight addSubview:self.buttonCharsAndNum];
        [self.buttonCharsAndNum setTitle:self.charsAndNumArray[i + 20] forState:UIControlStateNormal];
        self.buttonCharsAndNum.layer.cornerRadius = 5;
        self.buttonCharsAndNum.layer.borderColor = [UIColor colorWithRed:117/255.0 green:124/255.0 blue:130/255.0 alpha:1.0].CGColor;
        self.buttonCharsAndNum.layer.borderWidth = 0.5;
        [self.buttonCharsAndNum setTitleColor:[UIColor colorWithRed:67/255.0 green:67/255.0 blue:67/255.0 alpha:1.0] forState:UIControlStateNormal];
        [self.buttonCharsAndNum addTarget:self action:@selector(inputChars1:) forControlEvents:UIControlEventTouchUpInside];
    }
    for (NSInteger i = 0; i < 7; i ++) {
        self.buttonCharsAndNum = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buttonCharsAndNum.frame = CGRectMake(SCREEN_WIDTH / 10 * 3 / 2 + SCREEN_WIDTH / 10 * i, 140, SCREEN_WIDTH / 10 - 2, 40);
        self.buttonCharsAndNum.backgroundColor = [UIColor whiteColor];
        [self.viewRight addSubview:self.buttonCharsAndNum];
        [self.buttonCharsAndNum setTitle:self.charsAndNumArray[i + 29] forState:UIControlStateNormal];
        self.buttonCharsAndNum.layer.cornerRadius = 5;
        self.buttonCharsAndNum.layer.borderColor = [UIColor colorWithRed:117/255.0 green:124/255.0 blue:130/255.0 alpha:1.0].CGColor;
        self.buttonCharsAndNum.layer.borderWidth = 0.5;
        [self.buttonCharsAndNum setTitleColor:[UIColor colorWithRed:67/255.0 green:67/255.0 blue:67/255.0 alpha:1.0] forState:UIControlStateNormal];
        [self.buttonCharsAndNum addTarget:self action:@selector(inputChars1:) forControlEvents:UIControlEventTouchUpInside];
    }
}
-(void)inputBelongingAddress1:(UIButton*)btn{
    if ([self.delegate respondsToSelector:@selector(address:)]) {
        
        [self.delegate address:btn.titleLabel.text];
    }
}
-(void)inputAgainChars1:(UIButton*)btn{

    if ([self.delegate respondsToSelector:@selector(inputAgain)]) {
        [self.delegate inputAgain];
    }
}
-(void)inputChars1:(UIButton*)btn{
    if ([self.delegate respondsToSelector:@selector(inputChars:)]) {
        [self.delegate inputChars:btn.titleLabel.text];
    }
}
-(void)deleteChars1:(UIButton*)btn{

    if ([self.delegate respondsToSelector:@selector(delegateStr)]) {
        [self.delegate delegateStr];
    }
}

-(void)ScrollViewMoveRight{
    self.keyBoardView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
}
-(void)ScrollViewMoveLeft{
  self.keyBoardView.contentOffset = CGPointMake(0, 0);
    
}
@end
