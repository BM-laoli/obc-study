//
//  main.m
//  CusObject
//
//  Created by administrator on 2023/8/29.
//

#import <Foundation/Foundation.h>
#import "BNREmployee.h"
#import "BNRAsset.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 存多个 BNREmployee；
        NSMutableArray *employee =[[NSMutableArray alloc]init];
        
        for (int i =0; i<10; i++) {
            // 构建十个BNREmployee
            BNREmployee *e = [[BNREmployee alloc]init];
            e.w = 90 +i;
            e.h = 1.8 - (i / 10.0);
            e.employeeID = i;
            
            [employee addObject:e];
        }
        
        // 创建十个BNRAsstes
        for (int i =0; i <10; i++) {
            // 构建BNRAsset
            BNRAsset *as = [[BNRAsset alloc]init];
            
            // 创建lable
            NSString *lable = [NSString stringWithFormat:@"Latop %d",i];
            as.lable = lable;
            as.resaleValue = 350 + i *17;
            
            //0-9 随机数
            NSUInteger randInt = random() % [employee count];
            // 随机取一个 然后给它把addAssets 加进去
            BNREmployee *randEmployee = [employee objectAtIndex:randInt];
            [randEmployee addAssets:as];
        }
        
        // 输出测试
        NSLog(@"ems: %@",employee);
        NSLog(@"Giving up ownership of on employee");
        [employee removeObjectAtIndex:5];
        employee =nil;
        
        
    }
    return 0;
}
