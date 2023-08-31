//
//  main.c
//  PBR
//
//  Created by administrator on 2023/8/26.
//

#include <stdio.h>
#include <math.h>

// 米 转化为英寸 和英寸
void metersToFeetAndInches(double meters, unsigned int *ftPtr, double *intPtr)
{
    double rawFeet = meters * 3.281;
    double integerPart;
    modf(rawFeet, &integerPart);
    int feet = (int)integerPart;
    
    if(ftPtr){
        printf("Stroing %u to adddress %p \n", feet, ftPtr);
        *ftPtr = feet;
    }
    
    double fraToo = rawFeet - feet;
    double inches = fraToo * 12.0;
    
    if(intPtr){
        printf("Stroing %.2f to adddress %p \n", inches, intPtr);
        *intPtr = inches;
    }
}

int main(int argc, const char * argv[]) {
    double pi = 3.14;
    double integerPart;
    double fractionPart;
    
    fractionPart = modf(pi, &integerPart);
    printf("i = %.0f, f =%.2f, \n", integerPart, fractionPart);
    
    // 一个常见的转换工具
    double metins = 3;
    unsigned int feet;
    double inches;
    
    printf("输入值 %.1f ，英寸%d, 英尺%.1f \n", metins, feet, inches);
    
    
    return 0;
}
