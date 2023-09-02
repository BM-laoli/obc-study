//
//  BNRAppliance.h
//  Appliances
//
//  Created by administrator on 2023/9/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNRAppliance : NSObject

@property (nonatomic,copy) NSString *productName;
@property (nonatomic) int voltage;

// 指定初始化方法
- (instancetype)initWithProducname: (NSString *)pm;

@end

NS_ASSUME_NONNULL_END
