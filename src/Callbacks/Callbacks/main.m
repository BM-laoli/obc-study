//
//  main.m
//  Callbacks
//
//  Created by administrator on 2023/9/1.
//

#import <Foundation/Foundation.h>
#import "BNRLogger.h"
#import "BNRObserver.h"

typedef void (^ArrayEnumerateBlock)(id, NSUInteger, BOOL *);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        // 初始化两个array 保存原数据和去除元印之后的数据
//        NSArray *oldStrings = [NSArray arrayWithObjects:@"Sauerkraut", @"Ranyun",@"Big Berd Ranch", @"Miss",nil];
//        NSLog(@"old strings:%@", oldStrings);
//        NSMutableArray *devowlizedStrings = [NSMutableArray array];
//        NSArray *vowles = [NSArray arrayWithObjects:@"a", @"e", @"i" , @"o", @"u", nil];
//
//
//        // 定义
//        // void (^devowelizer)(id,NSUInteger, BOOL*);
//        // 简化版本typedenf协助
//        ArrayEnumerateBlock devowelizer;
//
//        // 实现
//        devowelizer = ^(id string, NSUInteger i, BOOL *stop){
//            NSMutableString *newString = [NSMutableString stringWithString:string];
//            for (NSString *s in vowles) {
//                NSRange fullRanger = NSMakeRange(0, [newString length]);
//                [newString replaceOccurrencesOfString:s withString:@"" options:NSCaseInsensitiveSearch range:fullRanger];
//            }
//            [devowlizedStrings addObject:newString];
//        };
//
//        // 测试
//        [oldStrings enumerateObjectsUsingBlock:devowelizer];
//        NSLog(@"new strings: %@",devowlizedStrings);
//
//
//        // 具备返回值的block
//        double (^divBlock)(double,double);
//        divBlock = ^(double i, double a)
//        {
//            return i+a;
//        };
//        NSLog(@"doucb %.2f",divBlock(1.0,2.0));
//
        
        // 测试
         BNRObserver *obs = [[BNRObserver alloc]init];
         BNRLogger *logger = [[BNRLogger alloc]init];
        __unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:logger selector:@selector(updateLastTime:) userInfo:nil repeats:YES];
        
        // 当lastTime 何时发生变化
//        [logger addObserver:obs
//               forKeyPath:@"lastTime"
//               options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
//               context:nil];
        
        // 独立的属性
        [logger addObserver:obs
               forKeyPath:@"lastTimeString"
               options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
               context:nil];
        
        [[NSRunLoop currentRunLoop]run];
    }
    return 0;
}
