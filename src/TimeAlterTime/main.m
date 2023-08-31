//
//  main.m
//  TimeAlterTime
//
//  Created by administrator on 2023/8/26.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *now = [NSDate date];
        NSLog(@"NSDAte Object lives at %p",now);
        NSLog(@"The Date is %@",now);
        
        double seconds = [now timeIntervalSince1970];
        NSLog(@"It has been %f seconds the start of 1970", seconds);
        
        // 看看当前计算机的name
        NSHost *host = [NSHost currentHost];
        NSString *hostName = [host localizedName];
        NSLog(@"The host name is %@",hostName);
        
        //传递参数和多个参数
        NSDate *laster = [now dateByAddingTimeInterval:10000];
        NSLog(@"laster is %@",laster);
        
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSLog(@"My Cal is %@",[cal calendarIdentifier]);
        
        unsigned long day = [cal ordinalityOfUnit:NSCalendarUnitDay
                                           inUnit:NSCalendarUnitMonth
                                          forDate:now];
        NSLog(@"this is day %lu", day);
        
        // 也许你可以嵌套 但是不推荐！
        NSLog(@"The Date is %f",[[NSDate date] timeIntervalSince1970]);
        // NSDate *now = [[NSDate alloc]init]; 一步到位
        //  id = ts 中的 any
        id delegate;
        delegate = [[NSDate alloc]init];
        
        NSDateComponents *comps = [[NSDateComponents alloc]init];
        [comps setYear:1999];
        [comps setMonth:4];
        [comps setDay:21];
        [comps setHour:13];
        [comps setMinute:12];
        [comps setSecond:22];
        
        NSDateComponents *comps2 = [[NSDateComponents alloc]init];
        [comps setYear:2023];
        [comps setMonth:8];
        [comps setDay:26];
        [comps setHour:13];
        [comps setMinute:12];
        [comps setSecond:22];
        
        NSCalendar *g = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDate *dateOfBrith = [g dateFromComponents:comps];
        NSDate *dateOfBrith2 = [g dateFromComponents:comps2];
        
        double secSWithEnd = [dateOfBrith timeIntervalSinceDate:dateOfBrith2];
        NSLog(@"出生到现在你活了 %.0f s", secSWithEnd);
        
        NSString *sl = @"I";
        NSLog(@"This is show ok %@",sl);
        
        
    }
    return 0;
}
