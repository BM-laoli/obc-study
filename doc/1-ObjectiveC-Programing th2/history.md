BNREmployee.h

```c
//
//  BNREmployee.h
//  CusObject
//
//  Created by administrator on 2023/8/30.
//

#import <Foundation/Foundation.h>
#import "BNRPerson2.h"
@class BNRAsset;

NS_ASSUME_NONNULL_BEGIN

@interface BNREmployee : BNRPerson2
{
    NSMutableArray *_assets;
}

@property (nonatomic) unsigned int employeeID;
@property (nonatomic) unsigned int officeAlarmCode;
@property (nonatomic) NSDate *hireDate;
@property (nonatomic, copy) NSArray *assets;

- (double) yearOfEmployee;
- (void) addAssets:(BNRAsset *)a;
- (unsigned int) valueOfAssets;
@end

NS_ASSUME_NONNULL_END

```

BNREmployee.m

```c
//
//  BNREmployee.m
//  CusObject
//
//  Created by administrator on 2023/8/30.
//

#import "BNREmployee.h"
#import "BNRAsset.h"

@implementation BNREmployee

- (void)setAssets:(NSArray *)a
{
    _assets = [a mutableCopy];
}

- (NSArray *)assets
{
    return [_assets copy];
}

- (void)addAssets:(BNRAsset *)a
{
    if(!_assets){
        _assets = [[NSMutableArray alloc]init];
    }
    
    [_assets addObject:a];
}

- (unsigned int)valueOfAssets
{
 //累加物品售价
    unsigned int sum = 0;
    for (BNRAsset *a in _assets) {
        sum += [a resaleValue];
    }
    return sum;
}


// description
- (NSString *)description
{
    return [NSString stringWithFormat:@"<Employee %u: %u in assets>",self.employeeID, self.valueOfAssets];
}

- (void)dealloc
{
    NSLog(@"deallog %@",self);
}

// overView
- (float)bodyMassIdex
{
    return [super bodyMassIdex] * 0.9;
}

- (double)yearOfEmployee
{
    if(self.hireDate){
        NSDate *now = [NSDate now];
        NSTimeInterval secs = [now timeIntervalSinceDate:self.hireDate];
        return secs;
    }
    return 0;
}
@end

```

```main
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

```
