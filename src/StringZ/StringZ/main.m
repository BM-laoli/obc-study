//
//  main.m
//  StringZ
//
//  Created by administrator on 2023/8/31.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 写文件
        /**
         NSError *error;
         NSMutableString *str = [[NSMutableString alloc]init];
         for (int i = 0; i < 10; i++) {
             [str appendString:@"Aarion is cool!\n"];
         }
         
         BOOL success = [str writeToFile:@"/tmp/cool.txt" atomically:YES encoding:NSUTF8StringEncoding error:&error];
         
         if(success){
             NSLog(@"done writing ");
         }else{
             NSLog(@"error: %@", [error localizedDescription]);
         }
         */
        
        //读文件
        /**
         NSError *error;
         NSString *str = [[NSString alloc]initWithContentsOfFile:@"/etc/resolv.conf" encoding:NSASCIIStringEncoding error:&error];
         
         if(!str){
             NSLog(@"error: %@", [error localizedDescription]);
         }else{
             NSLog(@"red done %@ ", str);
         }
         */
        
        // 写在文件并保存下来
       /**
        NSError *err;
        NSURL *url = [NSURL URLWithString:@"https://pngimg.com/uploads/google/google_PNG102344.png"];
        NSURLRequest *req= [NSURLRequest requestWithURL:url];
        NSData *data = [NSURLConnection sendSynchronousRequest:req returningResponse:NULL error:&err];
        
        if(!data){
            NSLog(@"error %@", [err localizedDescription]);
            return 1;
        }
        
        NSLog(@"file %lu bytes",(unsigned long) [data length]);
        
        BOOL wireen = [data writeToFile:@"/tmp/google.png"
                                options:NSDataWritingAtomic
                                error:&err];
        if(!wireen){
            NSLog(@"error %@", [err localizedDescription]);
            return 1;
        }
        NSLog(@"Success!");
        */
        
        // 读文件 写入到Data中
        NSData *readData = [NSData dataWithContentsOfFile:@"/tmp/google.png"];
        NSLog(@"The file read the disk %lu bytes",(unsigned long) [readData length]);
        
    }
    return 0;
}
