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
    if(self.holder){
        return [NSString stringWithFormat:@"<%@: $%d, assgined to %@>",self.lable, self.resaleValue, self.holder];
    }else{
        return [NSString stringWithFormat:@"<%@L $%d,unsingd>",self.lable, self.resaleValue];
    }
}

- (void)dealloc{
    NSLog(@"dealog %@",self);
}

@end
