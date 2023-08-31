
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
