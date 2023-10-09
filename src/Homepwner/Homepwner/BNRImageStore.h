//
//  BNRImageStore.h
//  Homepwner
//
//  Created by 李仕增 on 2023/10/9.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNRImageStore : NSObject

+ (instancetype) sharedStore;
- (void) setImage:(UIImage *) image forkey: (NSString *)key;
- (UIImage *) imageForKey: (NSString *) key;
- (void) deleteImageForKey: (NSString *) key;

@end

NS_ASSUME_NONNULL_END
