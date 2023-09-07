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
    CGRect firstFrame = [UIScreen mainScreen].bounds;
    
    // view. x y 和 w h
    //CGRect firstFrame = CGRectMake(160, 240, 100, 150);
    
    HyponsisView *fhv = [[HyponsisView alloc]initWithFrame:firstFrame];
    //fhv.backgroundColor = [UIColor redColor];
    self.view.backgroundColor = [UIColor whiteColor];
    //[self.view addSubview:fhv];
    
//    CGRect firstFrame2 = CGRectMake(20, 20, 50, 50);
//    HyponsisView *shv = [[HyponsisView alloc]initWithFrame:firstFrame2];
//    shv.backgroundColor = [UIColor blueColor];
//
//    [fhv addSubview:shv];
    
    [self.view addSubview:fhv];
    
    
    
}


@end
