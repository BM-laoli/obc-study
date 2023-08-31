//
//  main.m
//  Constant
//
//  Created by administrator on 2023/8/31.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"\u03c0 is %f",M_PI);
        NSLog(@"%d is larger", MAX(10, 20));
        
        NSLocale *here = [NSLocale currentLocale];
        //NSString *currency = [here objectForKey:@"currency"];
        NSString *currency = [here objectForKey:NSLocaleCountryCode];
        NSLog(@"Money is %@", currency);
    }
    return 0;
}
