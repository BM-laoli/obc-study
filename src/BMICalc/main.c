//
//  main.c
//  BMICalc
//
//  Created by administrator on 2023/8/26.
//

#include <stdio.h>
#include <time.h>
#include <stdlib.h>

typedef struct {
    float h;
    int w;
} Person;

float bodyMassIndex(Person p)
{
    return p.w / (p.h * p.h);
}

void test_tim(void)
{
    struct tm now;
    
    long sec_1970 = time(NULL);
    printf("1970 -> now %ld \n", sec_1970);
    
    localtime_r(&sec_1970, &now);
    printf("time is %d:%d:%d \n", now.tm_hour, now.tm_min, now.tm_sec);
//    sec_1970 += 4000000000;
    localtime_r(&sec_1970, &now);
    printf("time is %d-%d-%d %d:%d:%d \n", now.tm_mon+1, now.tm_mday,now.tm_year+1900,now.tm_hour, now.tm_min, now.tm_sec);
    
}

// 测试堆栈 内存调用和缓冲区
void testDui(void)
{
    // 以下是连续的一块 buffer 内存空间 它在堆中存储
    float *startOfBuffer;
    startOfBuffer = malloc(1000 * sizeof(float));
    // --使用buffer
    
    // 释放
    free(startOfBuffer);
    startOfBuffer = NULL;
}

int main(int argc, const char * argv[]) {
    
/*
 Person mk;
 mk.h=1.7;
 mk.w=96;
 printf("mk BMI is %.2f \n", bodyMassIndex(mk));
 */
    
     // test_tim();
    // testDui();

    // 我们把对象存到堆中
    Person *mk = (Person *) malloc(sizeof(Person));
    mk->h = 1.7;
    mk->w=96;
    
     printf("mk BMI is %.2f \n", bodyMassIndex(*mk));// 指针变量mk，从指针变量获取原始值 *mk, 指针变量定义 *mk, 指针类型(Person *)
    
    free(mk);
    mk=NULL;
     
    return 0;
}
