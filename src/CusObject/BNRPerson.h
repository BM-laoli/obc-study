//
//  BNRPerson.h
//  CusObject
//
//  Created by administrator on 2023/8/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNRPerson : NSObject
// 实例变量
{
    float _h;
    int _w;
}

// 实例方法
- (float) h;
- (void) setH:(float)h;
- (int) w;
- (void) setW:(int)w;

- (float) bodyMassIndex;
@end

NS_ASSUME_NONNULL_END
