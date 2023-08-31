//
//  BNRStockHolding.m
//  CusObject
//
//  Created by administrator on 2023/8/30.
//

#import "BNRStockHolding.h"

@implementation BNRStockHolding
- (float)currentPrice
{
    return _currentPrice;
}

- (float)purchasePrice
{
    return _purchasePrice;
}

- (int)numberOfShares
{
    return _numberOfShares;
}

- (void)setPurchasePrice:(float)p
{
    _purchasePrice = p;
}

- (void)setCurrentPrice:(float)c
{
    _currentPrice = c;
}

- (void)setNumberOfShares:(int)n
{
    _numberOfShares = n;
}

- (float)cosInDollars {
    return [self currentPrice];
}

- (float)valueInDollars {
    return [self purchasePrice];
}

@end
