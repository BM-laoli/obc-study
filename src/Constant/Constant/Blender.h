//
//  Blender.h
//  Constant
//
//  Created by administrator on 2023/8/31.
//

#import <Foundation/Foundation.h>

//enum BlenderSpeed {
//    BlenderSpeedSitr=1;
//    BlenderSpeedChop=2;
//    BlenderSpeedLiquify=3;
//    BlenderSpeedPulse=4;
//}

typedef NS_ENUM(int, BlenderSpeed) {
    BlenderSpeedSitr,
    BlenderSpeedChop,
    BlenderSpeedLiquify,
    BlenderSpeedPulse,
};

NS_ASSUME_NONNULL_BEGIN

@interface Blender : NSObject
{
    BlenderSpeed speed;
}

- (void) setSpeed: (BlenderSpeed)x;
@end

NS_ASSUME_NONNULL_END
