//
//  BNRLogger.m
//  Callbacks
//
//  Created by administrator on 2023/9/1.
//

#import "BNRLogger.h"

@implementation BNRLogger

- (void)dealloc
{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)zoneChange: (NSNotification *)note
{
    // 注意管理内存强弱引用的问题
    // 使用self
    void (^myBlocks)(void);
    __weak BNRLogger *weakSelf = self;
    myBlocks = ^{
        // 局部强引用没问题 因为指针是blocck的 它会被释放掉
        BNRLogger *innerSelf = weakSelf;
        // 同样的 我们的原则是通过geeter setter 获取变量值 而不是 直接用！
        NSLog(@"Self %@",innerSelf);
    };

    NSLog(@"The System time zone change");
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"res get %lu", [data length]);
    
    if(!_incomingData){
        _incomingData = [[NSMutableData alloc]init];
    }
    [_incomingData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"error %@",[error localizedDescription]);
    _incomingData = nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"all");
    NSString *string = [[NSString alloc]initWithData:_incomingData encoding:NSUTF8StringEncoding];
    _incomingData = nil;
    NSLog(@" %lu", [string length]);
    NSLog(@"All string %@",string);
}

- (NSString *)lastTimeString
{
    // 所有实例 共享
    static NSDateFormatter *dataFormatter =nil;
    if(!dataFormatter){
        dataFormatter = [[NSDateFormatter alloc]init];
        [dataFormatter setTimeStyle:NSDateFormatterMediumStyle];
        [dataFormatter setDateStyle:NSDateFormatterMediumStyle];
        NSLog(@"created dateFormatter");
    }
    return [dataFormatter stringFromDate:self.lastTime];
}

- (void) updateLastTime: (NSTimer *)t
{
    NSDate *now = [NSDate date];
    [self setLastTime:now];
    NSLog(@"Just set time to %@", self.lastTimeString);
}
@end
