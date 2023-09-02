//
//  main.m
//  Appliances
//
//  Created by administrator on 2023/9/2.
//

#import <Foundation/Foundation.h>
#import "BNRAppliance.h"
#import "BNROwnedAppliance.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //BNRAppliance *bnr = [[BNRAppliance alloc]init];
        //NSLog(@"BNR -> %@, %d",bnr.productName,bnr.voltage);
        // 默认nil o
        
        // 自定义init
        BNRAppliance *bnr = [[BNRAppliance alloc]initWithProducname:@"1"];
        NSLog(@"BNR -> %@, %d",bnr.productName,bnr.voltage);
        BNRAppliance *bnr2 = [[BNRAppliance alloc]init];
        NSLog(@"BNR -> %@",bnr2.productName);
        [bnr2 setProductName:@"6"];
        NSLog(@"BNR -> %@", bnr2.productName);
        
        //
        BNROwnedAppliance *bnro = [[BNROwnedAppliance alloc]init];
        
        
        
    }
    return 0;
}
