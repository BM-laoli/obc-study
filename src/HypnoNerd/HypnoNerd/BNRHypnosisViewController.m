//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by 李仕增 on 2023/9/18.
//

#import "BNRHypnosisViewController.h"
#import "HyponsisView.h"

@implementation BNRHypnosisViewController

- (void)loadView
{
    // create HyponsisView Object
    HyponsisView *backgroudView = [[HyponsisView alloc]init];
    // 把这个对象赋给 View 属性
    self.view = backgroudView;
}
@end
