//
//  Model.h
//  Quiz
//
//  Created by administrator on 2023/9/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Model : NSObject

@property (nonatomic, copy) NSArray *answers;
@property (nonatomic, copy) NSArray *questions;

// 携带参数的初始化
- (instancetype)initWithData:(NSArray *)answers quertion:(NSArray *)questions;
// 获取answers questions 依据ID
- (NSArray *)getAAndQ: (int)idx;

@end

NS_ASSUME_NONNULL_END
