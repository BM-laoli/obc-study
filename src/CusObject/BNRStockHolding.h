//
//  BNRStockHolding.h
//  CusObject
//
//  Created by administrator on 2023/8/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNRStockHolding : NSObject
{
    float _purchasePrice;
    float _currentPrice;
    int _numberOfShares;
}

- (float) purchasePrice;
- (float) currentPrice;
- (int) numberOfShares;
- (void) setPurchasePrice: (float)p;
- (void) setCurrentPrice: (float)c;
- (void) setNumberOfShares:(int)n;

- (float)cosInDollars;
- (float)valueInDollars;
@end

NS_ASSUME_NONNULL_END
