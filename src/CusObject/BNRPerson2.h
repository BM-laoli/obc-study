//
//  BNRPerson2.h
//  CusObject
//
//  Created by administrator on 2023/8/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNRPerson2 : NSObject
{
    
}

@property (nonatomic) float h;
//@property (nonatomic,readwrite)  h; 默认的可以不写，readwrite

//@property (nonatomic, readonly) float h;

@property (nonatomic) int w;

- (float) bodyMassIdex;
@end

NS_ASSUME_NONNULL_END
