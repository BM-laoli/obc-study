//
//  BNROwnedAppliance.m
//  Appliances
//
//  Created by administrator on 2023/9/2.
//

#import "BNROwnedAppliance.h"

@interface BNROwnedAppliance()
{
    NSMutableSet *_ownerNames;
}

@end

@implementation BNROwnedAppliance

// 禁用
- (instancetype)init
{
    [NSException raise:@"BNRWallSafeInitalization" format:@"Use initWithSecretCode,not init"];
    return self;
};

// 要么覆盖父类方法要么就禁用
- (instancetype)initWithProducname:(NSString *)pm
{
    return [self initWithProductName:pm firstOwnerName:@"Unkouwn"];
}

- (instancetype)initWithProductName:(NSString *)pn firstOwnerName:(NSString *)n
{
    self = [super initWithProducname:pn];
    if(self){
        _ownerNames = [[NSMutableSet alloc]init];
        if(n){
            [_ownerNames addObject:n];
        }
    }
    return  self;
}

- (void)addOwnedNames:(NSSet *)n
{
    [_ownerNames addObject:n];
}

- (void)removeOwnedNames:(NSString *)n
{
    [_ownerNames removeObject:n];
}

- (NSSet *)ownedNames {
    return  [_ownerNames copy];
}

@end
