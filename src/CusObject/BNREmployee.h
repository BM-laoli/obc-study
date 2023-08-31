//
//  BNREmployee.h
//  CusObject
//
//  Created by administrator on 2023/8/30.
//

#import <Foundation/Foundation.h>
#import "BNRPerson2.h"

NS_ASSUME_NONNULL_BEGIN

@interface BNREmployee : BNRPerson2
{
    
}

@property (nonatomic) unsigned int employeeID;
@property (nonatomic) unsigned int officeAlarmCode;
@property (nonatomic) NSDate *hireDate;


- (double) yearOfEmployee;

@end

NS_ASSUME_NONNULL_END
