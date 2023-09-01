//
//  BNRLogger.h
//  Callbacks
//
//  Created by administrator on 2023/9/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 实现delegate 就要overview 其方法
@interface BNRLogger : NSObject<NSURLConnectionDelegate, NSURLConnectionDataDelegate>
{
    NSMutableData *_incomingData;
}

@property (nonatomic) NSDate *lastTime;

// 实现delete的方法
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;
- (void)zoneChange: (NSNotification *)note;

- (NSString *) lastTimeString;
- (void) updateLastTime: (NSTimer *)t;
@end

NS_ASSUME_NONNULL_END
