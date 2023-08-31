//
//  BNRAsset.m
//  CusObject
//
//  Created by administrator on 2023/8/31.
//

#import "BNRAsset.h"

@implementation BNRAsset

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: $%u>", self.lable, self.resaleValue];
}

- (void)dealloc{
    NSLog(@"dealog %@",self);
}

@end
