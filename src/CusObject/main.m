//
//  main.m
//  CusObject
//
//  Created by administrator on 2023/8/29.
//

#import <Foundation/Foundation.h>
//#import "BNRPerson.h"
//#import "BNRPerson2.h"
#import "BNREmployee.h"
#import "BNRStockHolding.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /**
         
         BNRPerson *mky = [[BNRPerson alloc]init];
         
         [mky setH:1.8];
         [mky setW:96];
         
         NSLog(@"H -> %.2f", [mky getH]);
         NSLog(@"bmi ->%f", [mky bodyMassIndex]);
         */
        
        /**
         BNRStockHolding *s1 =[[BNRStockHolding alloc]init];
         BNRStockHolding *s2 =[[BNRStockHolding alloc]init];
         BNRStockHolding *s3 =[[BNRStockHolding alloc]init];
         [s1 setCurrentPrice:2.30];
         [s1 setCurrentPrice:4.50];
         [s1 setNumberOfShares:40];
         
         [s2 setCurrentPrice:12.19];
         [s2 setCurrentPrice:10.56];
         [s2 setNumberOfShares:90];
         
         [s3 setCurrentPrice:45.10];
         [s3 setCurrentPrice:49.51];
         [s1 setNumberOfShares:210];
     
         
         NSMutableArray *m = [[NSMutableArray alloc]init];
         [m addObject:s1];
         [m addObject:s2];
         [m addObject:s3];
         
         BNRPerson2 *mky = [[BNRPerson2 alloc]init];
         
         mky.w = 96;
         mky.h = 1.8;
         
         NSLog(@"H -> %.2f",mky.h);
         NSLog(@"bmi ->%f", [mky bodyMassIdex]);
         */
        
        // 继承例子演示demo
        BNREmployee *mk = [[BNREmployee alloc]init];
        mk.w = 96;
        mk.h = 1.8;
        mk.employeeID = 12;
        mk.hireDate = [NSDate dateWithNaturalLanguageString:@"Aug 2nd, 2023"];
        
        NSLog(@"Mike has a w of %d", mk.w);
        NSLog(@"Mike BMI %f", [mk bodyMassIdex]);
        NSLog(@"Mike Id %u hired on %@",mk.employeeID, mk.hireDate);
        NSLog(@"BMI of %.2f for %.2f years", [mk bodyMassIdex], mk.yearOfEmployee);
        NSLog(@"===================");
        
    }
    return 0;
}
