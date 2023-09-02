//
//  main.m
//  VowelCounter
//
//  Created by administrator on 2023/9/2.
//

#import <Foundation/Foundation.h>
#import "NSString+BNRVowelCounting.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *string = @"Hello";
        NSLog(@"%@ has %d vowels",string, [string bnr_vowelCount]);
    }
    return 0;
}
