//
//  main.m
//  Callbacks
//
//  Created by administrator on 2023/9/1.
//

#import <Foundation/Foundation.h>
#import "BNRLogger.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BNRLogger *logger = [[BNRLogger alloc]init];
//        __unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:logger selector:@selector(updateLastTime:) userInfo:nil repeats:YES];
        
//        NSURL *url = [NSURL URLWithString:@"https://filesamples.com/samples/document/txt/sample3.txt"];
//        NSURLRequest *req = [NSURLRequest requestWithURL:url];
//        __unused NSURLConnection *fetchConn = [[NSURLConnection alloc] initWithRequest:req delegate:logger startImmediately:YES];
        
        [[NSNotificationCenter defaultCenter] addObserver:logger selector:@selector(zoneChange) name:NSSystemTimeZoneDidChangeNotification object:nil];
        
        
        
        [[NSRunLoop currentRunLoop]run];
    }
    return 0;
}
