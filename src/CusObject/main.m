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
        NSMutableDictionary *exeutives = [[NSMutableDictionary alloc]init];
        
        for (int i =0; i<10; i++) {
            // 构建十个BNREmployee
            BNREmployee *e = [[BNREmployee alloc]init];
            e.w = 90 +i;
            e.h = 1.8 - (i / 10.0);
            e.employeeID = i;
            
            [employee addObject:e];
            
            if(i ==0){
                [exeutives setObject:e forKey:@"CEO"];
            }else if(i==1){
                [exeutives setObject:e forKey:@"CTO"];
            }
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
        //employee =nil;
        
        NSDictionary *numberOfMoons = @{
            @"Mercury" :@0,
            @"Venus" :@0,
            @"Earth" :@1,
            @"Mars" :@2,
        };
        
        NSDictionary *inner = @{
            @"Mercury" : @[],
            @"Earth" : @[@"Luna"],
        };
        NSLog(@"mars %@", numberOfMoons[@"Mars"]);
        NSLog(@"innerd %@", inner);
        
        NSLog(@"e => %@", exeutives);
        
        NSSortDescriptor *voa = [NSSortDescriptor sortDescriptorWithKey:@"valueOfAssets" ascending:YES];
        NSSortDescriptor *eid = [NSSortDescriptor sortDescriptorWithKey:@"employeeID" ascending:YES];
        [employee sortUsingDescriptors:@[voa, eid]];
        NSLog(@"e -> %@",employee);
        // NSSortDescriptor NSPredicate 的语法规则很复杂 建议问一下GPT
        NSPredicate *perdi = [NSPredicate predicateWithFormat: @"valueOfAssets > 70"];
        NSArray *ar = [employee filteredArrayUsingPredicate:perdi];
        NSLog(@"tob: %@", ar);
        ar =nil;
        
    }
    return 0;
}
