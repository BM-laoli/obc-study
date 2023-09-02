//
//  BNROwnedAppliance.h
//  Appliances
//
//  Created by administrator on 2023/9/2.
//

#import <Foundation/Foundation.h>
#import "BNRAppliance.h"

NS_ASSUME_NONNULL_BEGIN

@interface BNROwnedAppliance : BNRAppliance

@property (readonly) NSSet *ownedNames;

// 指定初始化方法
- (instancetype)initWithProductName:(NSString *)pn firstOwnerName: (NSString *) n;
- (void) addOwnedNames:(NSSet *)n;
- (void) removeOwnedNames:(NSString *)n;

@end

NS_ASSUME_NONNULL_END
