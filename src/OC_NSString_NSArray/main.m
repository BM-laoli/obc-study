//
//  main.m
//  OC_NSString_NSArray
//
//  Created by administrator on 2023/8/29.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /**
         NSString *st1 = @"This is st1";
         NSLog(@"St1: %@", st1);
         
         NSDate *now = [[NSDate alloc] init];
         NSString *st2 = [NSString stringWithFormat: @"The Time is %@", now];
         NSLog(@"St2 %@",st2);
         
         // 常见方法举例
         //st1.length
         //BOOL *isEq = [st1 isEqualToString:@"2"];
         //*st1 = [st1 uppercaseString];
         NSString *search = @"IS";
         NSRange rang =  [st1 rangeOfString: search options:NSCaseInsensitiveSearch];
         if(rang.location != NSNotFound){
             NSLog(@"Fund %lu",(unsigned long)rang.location);
         }
         */
        
        /**
         NSDate *now = [NSDate date];
         NSDate *tm = [now dateByAddingTimeInterval:24.0 * 60.0 * 60.0];
         NSDate *yd = [now dateByAddingTimeInterval:-24.0 * 60.0 * 60.0];
         NSArray *datelist = @[now, tm, yd];
         NSLog(@"The f date %@", datelist[0]);
         NSLog(@"The s date %@", datelist[1]);
         NSLog(@"This lenght %lu", [datelist count]);
         
         // 遍历
         for (NSDate *d in datelist) {
             NSLog(@"Here is a date: %@", d);
         }
         
         // 可变的Array
         NSMutableArray *dateM = [NSMutableArray array];
         [dateM addObject:now];
         [dateM addObject:tm];
         for (NSDate *d in dateM) {
             NSLog(@"Here is a date: %@", d);
         }
         
         [dateM removeObjectAtIndex:0];
         NSLog(@"lenght %lu",[dateM count]);
         */
        
        NSString *nameString = [NSString stringWithContentsOfFile:@"/usr/share/dict/propernames" encoding:NSUTF8StringEncoding error:nil];
        NSString *wordString = [NSString stringWithContentsOfFile:@"/usr/share/dict/words" encoding:NSUTF8StringEncoding error:nil];
        
        NSArray *nameArray = [nameString componentsSeparatedByString:@"\n"];
        NSArray *wordArray = [wordString componentsSeparatedByString:@"\n"];
        
        for(NSString *name in nameArray){
            for(NSString *word in wordArray){
                NSComparisonResult res = [name caseInsensitiveCompare:@"Wolf"];
                if(res == NSOrderedSame){
                    NSLog(@"See name %@, word %@",name,word);
                }
            }
        }
    }
    return 0;
}
