//
//  BNRObserver.m
//  Callbacks
//
//  Created by administrator on 2023/9/2.
//

#import "BNRObserver.h"

@implementation BNRObserver
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSString *oldValue = [change objectForKey:NSKeyValueChangeOldKey];
    NSString *newValue = [change objectForKey:NSKeyValueChangeNewKey];
    NSLog(@"Observred: %@ of %@ was changed form %@ to %@",keyPath, object, oldValue, newValue);
}
@end
