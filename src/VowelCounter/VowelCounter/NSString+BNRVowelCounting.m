//
//  NSString+BNRVowelCounting.m
//  VowelCounter
//
//  Created by administrator on 2023/9/2.
//

#import "NSString+BNRVowelCounting.h"

@implementation NSString (BNRVowelCounting)
-(int)bnr_vowelCount
{
    NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiouyAEIOUY"];
    
    NSUInteger count = [self length];
    int sum = 0;
    
    for (int i=0; i < count; i++) {
        unichar c = [self characterAtIndex:i];
        if([charSet characterIsMember:c])
        {
            sum++;
        }
    }
    
    return sum;
}
@end
