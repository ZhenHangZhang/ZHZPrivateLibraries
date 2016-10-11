
//
//  ZHZTxtViewController.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/10/11.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "ZHZTxtViewController.h"

#define kHeight  [[UIScreen mainScreen]bounds].size.height
#define kWidth   [[UIScreen mainScreen]bounds].size.width
#define kFont    [UIFont systemFontOfSize:15.f]



@interface ZHZTxtViewController ()<UIPageViewControllerDataSource,UIPageViewControllerDelegate>
{
    unsigned long long fileSize;
    unsigned long long _offset;
    NSInteger _index;
}

@property (nonatomic,strong) UIPageViewController *pageVC;
@property (nonatomic,strong) NSMutableArray *viewControllers;
@property (nonatomic,strong) NSFileHandle *handle;
@property (nonatomic,strong) NSMutableArray *offsetArray;

@property (weak, nonatomic) UIViewController *nextVC;
@property (weak, nonatomic) UIViewController *beforeVC;


@end

@implementation ZHZTxtViewController
-(BOOL)prefersStatusBarHidden{

    return YES;
}
-(NSMutableArray *)viewControllers{
    if (!_viewControllers) {
        _viewControllers = [NSMutableArray array];
        
        for (int i = 1; i <= 10; i++) {
            UIViewController *VC = [UIViewController new];
            
            UILabel *label = [[UILabel alloc] initWithFrame:VC.view.bounds];
            label.font = kFont;
            label.numberOfLines = 0;
            label.textColor = [UIColor whiteColor];
            [VC.view addSubview:label];
            
            VC.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1];
            [_viewControllers addObject:VC];
        }
    }
    return _viewControllers;
}

-(UIPageViewController *)pageVC{

    if(!_pageVC){
        NSDictionary *options = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:UIPageViewControllerSpineLocationMin] forKey:UIPageViewControllerOptionSpineLocationKey];
        _pageVC = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
        _pageVC.view.frame = self.view.frame;
        _pageVC.dataSource = self;
        _pageVC.delegate   = self;
        
        NSArray *vcs = [NSArray arrayWithObjects:self.viewControllers[0],nil];
        _nextVC = vcs[0];
        
        [_pageVC setViewControllers:vcs direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    }
    return _pageVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewController:self.pageVC];
    [self.view addSubview:self.pageVC.view];
    [self analysisTxt];

}

-(NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController{
    return self.viewControllers.count;
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    _index = [_viewControllers indexOfObject:viewController];
    
    if(_index == NSNotFound){
        return nil;
    }
    _index++;
    
    if(_index == [_viewControllers count]){
        return nil;
    }
    
    _nextVC = _viewControllers[_index];
    _offset = [self indexOfPage:_handle viewController:_nextVC];
    
    return _viewControllers[_index];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    _index = [_viewControllers indexOfObject:viewController];
    
    if (_index == 0 || _index == NSNotFound) {
        return nil;
    }
    _index--;
    
    _beforeVC = _viewControllers[_index];
    _offset = [_offsetArray[_index] longLongValue];
    _offset = [self indexOfPage:_handle viewController:_beforeVC];
    
    return self.viewControllers[_index];
}


-(void)analysisTxt
{
    _offsetArray = [NSMutableArray array];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"aizaixianjingderizi" ofType:@"txt"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSDictionary *fileDict = [fileManager attributesOfItemAtPath:path error:&error];
    fileSize = [fileDict[NSFileSize]unsignedLongLongValue];
    _handle = [NSFileHandle fileHandleForReadingAtPath:path];
    _offset = [self indexOfPage:_handle viewController:_nextVC];
    
}
-(unsigned long long)indexOfPage:(NSFileHandle *)handle viewController:(UIViewController *)VC{
    unsigned long long offset;
    
    if(offset == 0){
        offset = [handle offsetInFile];
    }else{
        offset = _offset;
    }
    
    [_offsetArray addObject:@(offset)];
    
    NSInteger length = 100;
    
    NSMutableString *labelStr = [[NSMutableString alloc]init];
    
    UILabel *label = (UILabel *)VC.view.subviews[0];
    
    
    for(;offset <= fileSize ; length++){
        [handle seekToFileOffset:offset];
        
        NSData *data = [handle readDataOfLength:length];
        
        if(data){
            NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            if(str){
                NSString *oStr = [NSString stringWithFormat:@"%@%@",labelStr,str];
                CGSize size = [oStr boundingRectWithSize:CGSizeMake(kWidth, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:label.font} context:nil].size;
                if(size.height <= kHeight){
                    [labelStr appendString:str];
                    label.text = labelStr;
                    offset+= length;
                }else{
                    break;
                }
            }
        }
    }
    
    
    
    return offset;
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
