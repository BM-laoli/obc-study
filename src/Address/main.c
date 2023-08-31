//
//  main.c
//  Address
//
//  Created by administrator on 2023/8/26.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    int i = 17;
    // 获取内存地址
    printf("i Stores its vlaue at %p \n", &i);
    printf("mian fn value at %p \n", &main);
    
    // 指针
    int *addressOfI = &i;
    printf("Point i %p \n", addressOfI);
    // 访问原数据 通过指针
    printf("Point i %d \n", *addressOfI);
    //
    int x=22;
    *addressOfI = x;
    printf("Point 修改后？？ %d \n", *addressOfI);
    
    //sizeof 4bite 说明是在 32位模式下运行
    printf("An int is %zu \n", sizeof(int));
    printf("A 22 is %zu \n",sizeof(addressOfI));
    int *y;
    //printf("Null %d \n",y);
    
    printf("float siez if %zu \n", sizeof(float));
    
    
    
    return 0;
}
