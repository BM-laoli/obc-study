//
//  main.m
//  RandomItems
//
//  Created by administrator on 2023/9/6.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *arr = [NSMutableArray array];
        [arr addObject:@"One"];
        [arr addObject:@"Tow"];
        [arr addObject:@"Thired"];
        [arr insertObject:@"Zero" atIndex:0];
        
        for(NSString *item in arr){
            NSLog(@"Arris %@ \n",item);
        }
        arr = nil;
        
    }
    return 0;
}
