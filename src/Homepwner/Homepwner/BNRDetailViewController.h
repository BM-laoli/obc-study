//
//  BNRDetailViewController.h
//  Homepwner
//
//  Created by 李仕增 on 2023/9/21.
//

#import <UIKit/UIKit.h>
@class BNRItem;

NS_ASSUME_NONNULL_BEGIN


@interface BNRDetailViewController : UIViewController
@property (nonatomic,strong) BNRItem *item;
@end

NS_ASSUME_NONNULL_END
