//
//  BNREmployee.m
//  CusObject
//
//  Created by administrator on 2023/8/30.
//

#import "BNREmployee.h"
#import "BNRAsset.h"

@implementation BNREmployee

// description
- (NSString *)description
{
    return [NSString stringWithFormat:@"<Employee %u>",self.employeeID];
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
