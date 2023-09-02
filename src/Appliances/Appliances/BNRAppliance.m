//
//  BNRAppliance.m
//  Appliances
//
//  Created by administrator on 2023/9/2.
//

#import "BNRAppliance.h"

@implementation BNRAppliance

- (instancetype)init
{
    return  [self initWithProducname:@"Unkown"];
}

- (instancetype)initWithProducname:(NSString *)pn
{
    self = [super init];
    
    if(self){
        _productName = [pn copy];
        _voltage = 120;
    }
    return  self;
}

//- (instancetype)init
//{
//    self = [super init];
//    // 返回非nil 值
//    if(self){
//        _voltage = 120;
//    }
//
//    return self;
//}
@end
