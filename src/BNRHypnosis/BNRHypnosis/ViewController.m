//
//  ViewController.m
//  BNRHypnosis
//
//  Created by administrator on 2023/9/6.
//

#import "ViewController.h"
#import "HyponsisView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // ios >13 get window
    CGRect originBounds = [UIScreen mainScreen].bounds;

//    一个简单的 ScollrView
//    // 创建两个 CGRect 结构做为UIScorllView 和 HyonisView对象的Frame
//    CGRect screenRect = originBounds;
//    CGRect bigRect = originBounds;
//    bigRect.size.width *=2.0;
//    bigRect.size.height *=2.0;
//
//    // 创建一个UIScrolView 对象
//    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:screenRect];
//    [self.view addSubview:scrollView];
//
//    // 创建一个超大的 HyponesisView
//    HyponsisView *hypnosisView = [[HyponsisView alloc] initWithFrame:bigRect];
//    [scrollView addSubview: hypnosisView];
//
//    // 告诉UIScroolrView 对象 取景 范围
//    scrollView.contentSize = bigRect.size;
//    self.view.backgroundColor = [UIColor whiteColor];
    
//    分页
        // 创建两个 CGRect 结构做为UIScorllView 和 HyonisView对象的Frame
        CGRect screenRect = originBounds;
        CGRect bigRect = originBounds;
        bigRect.size.width *=2.0;
    
        // 创建一个UIScrolView 对象
        UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:screenRect];
        [self.view addSubview:scrollView];
    
    // 解决一下自动滚动的问题
    [scrollView setPagingEnabled:YES];
    
        // 创建一个和屏幕一样大小的hypnosisView
        HyponsisView *hypnosisView = [[HyponsisView alloc] initWithFrame:screenRect];
        [scrollView addSubview: hypnosisView];
    
        // 再创建一个 （溢出屏幕外
    screenRect.origin.x += screenRect.size.width;
    HyponsisView *anotherView = [[HyponsisView alloc] initWithFrame:screenRect];
    [scrollView addSubview:anotherView];
        
    
    
        // 告诉UIScroolrView 对象 取景 范围
        scrollView.contentSize = bigRect.size;
        self.view.backgroundColor = [UIColor whiteColor];
}


@end
