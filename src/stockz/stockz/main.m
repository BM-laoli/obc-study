//
//  main.m
//  stockz
//
//  Created by administrator on 2023/9/1.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        写文件
//        NSMutableArray *stocks= [[NSMutableArray alloc]init];
//        NSMutableDictionary *stock;
//
//        stock = [NSMutableDictionary dictionary];
//        [stock setObject:@"AAPL" forKey:@"symbol"];
//        [stock setObject:[NSNumber numberWithInt:200] forKey:@"shares"];
//        [stocks addObject:stock];
//
//        stock = [NSMutableDictionary dictionary];
//        [stock setObject:@"GOOG" forKey:@"symbol"];
//        [stock setObject:[NSNumber numberWithInt:160] forKey:@"shares"];
//        [stocks addObject:stock];
//
//        [stocks writeToFile:@"/tmp/stocks.plist" atomically:YES];
        // XML格式
        
        // 读取
        NSArray *stockList = [NSArray arrayWithContentsOfFile:@"/tmp/stocks.plist"];
        
        for (NSDictionary *d in stockList) {
            NSLog(@"I have %@ shares of %@", [d objectForKey:@"shares"], [d objectForKey:@"symbol"]);
        }
    }
    return 0;
}
