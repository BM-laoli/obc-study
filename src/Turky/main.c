//
//  main.c
//  Turky
//
//  Created by administrator on 2023/8/25.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    
    float weight = 14.2;
    
    printf("The turkey weight %f .\n", weight);
    
    float cookingTiem = 15.0 + 15.0 * weight;
    
    printf("Cook it for %f minuts. \n", cookingTiem);
    
    // 同类别的类型转换
    double d = weight + cookingTiem;
    
    printf("double d %f \n", d);
    
    return 0;
}
