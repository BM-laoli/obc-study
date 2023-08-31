//
//  main.c
//  NumberTest
//
//  Created by administrator on 2023/8/25.
//

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, const char * argv[]) {
    
//    int x = 255;
//    printf("X is %d. \n",x); // 10进制
//    printf("x is %o. \n",x); // 8进制
//    printf("x is %x. \n",x); // 16进制
    
//    long long
//    long a = 255;
//    printf("X is %ld. \n",a); // 10进制
//    printf("x is %lo. \n",a); // 8进制
//    printf("x is %lx. \n",a); // 16进制
//
    
//    无符号
//    unsigned long x = 255;
//    printf("x is %lu. \n",x);
//    // 默认情况下 8 16 都是 无符号的
//    printf("x is %lo. \n",x);
    
//    printf("11/3 = ,%d \n", 11/3);
//    printf("11/3 = %f. \n", 11/(float)3);
    
    // abs
    printf("-5 abs = %d\n",abs(-5));
    
    // 浮点数 带十进制小数的数 分float32 double64 long double128 用 %f %e 格式化
    // 12345.6789 = 1.23456789 * 10^4
    double y = 12345.6789;
    printf("y is %f \n",y);
    printf("y is %.2f \n",y);
    printf("y is %e \n",y);
    
    printf("1 弧度的sin = %f \n", sin(1));
    return 0;
}
