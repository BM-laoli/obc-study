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
