//
//  BNRHypnosisViewController.h
//  HypnoNerd
//
//  Created by 李仕增 on 2023/9/18.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNRHypnosisViewController : UIViewController<UITextFieldDelegate>;
@property(nullable, nonatomic,weak)   id<UITextFieldDelegate> delegate;
@property(nonatomic, weak) UITextField *textFiled1;
@property (nonatomic, strong) UIView *view;
@end

NS_ASSUME_NONNULL_END
