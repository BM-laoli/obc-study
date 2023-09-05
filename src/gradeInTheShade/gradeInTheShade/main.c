//
//  main.c
//  gradeInTheShade
//
//  Created by administrator on 2023/9/5.
//

#include <stdio.h>
#include <stdlib.h>

float averageFloats (float *data, int dataCount)
{
    float sum = 0.0;
    for (int i =0; i < dataCount; i++) {
        sum = sum +data[i];
    }
    return  sum/dataCount;
}

int main(int argc, const char * argv[]) {
    
//    float *gBook = malloc(3 * sizeof(float));
//    gBook[0]=60.2;
//    gBook[1]=60.2;
//    gBook[2]=60.2;
//    float avg = averageFloats(gBook, 3);
//    free(gBook);
//    gBook = NULL;
//    printf("avg %.2f \n",avg);
    
//    float gBook[3];
//    gBook[0]=60.2;
//    gBook[1]=60.2;
//    gBook[2]=60.2;
//    float avg = averageFloats(gBook, 3);
    // main 在栈中执行完之后 这些内存会自动的释放掉
//    printf("avg %.2f \n",avg);
    
    // 直面量的创建 也是可以的
    float gBook[] = {60.2,60.2,60.2};
    float avg = averageFloats(gBook,3);
    printf("avg %.2f \n",avg);
    
    
    return 0;
}
