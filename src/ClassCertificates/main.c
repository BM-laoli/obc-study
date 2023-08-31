//
//  main.c
//  ClassCertificates
//
//  Created by administrator on 2023/8/25.
//

#include <stdio.h>
#include <unistd.h>

static float lastTemperatutre = 32.0;
static float remainningAngleTotal = 180.0;

void congratulateStudent(char *student, char *course, int numDays)
{
    printf("%s has done as much %s Programing as I could fit into %d days \n",student, course, numDays);
}

// 获取不到的 作用域
void showCookTimeForTurkey(int pounds)
{
    int necessaryM = 15 + 15 *pounds;
    if(necessaryM > 120) {
        int halfway = necessaryM /2;
        printf("is %d \n",halfway);
    }
    // printf("is %d \n",halfway);
}

// 用这个例子来分析 堆栈调用链非常 简单易懂
void singTheSong(int numberOfBottles)
{
    if(numberOfBottles == 0) {
        printf("There are simply no more bottles of beer no the wall. \n");
    } else {
        printf("%d bottle of beer on the wall. %d bottels of beer. \n",numberOfBottles,numberOfBottles);
        int nextBee = numberOfBottles -1;
        printf("Thake one down, %d emply \n", nextBee);
        
        // 递归
        singTheSong(nextBee);
        
        printf("Put a bottle int the recycling, %d emply in the bin. \n", numberOfBottles);
    }
}

float fahrenheitFromCelsius(float cel)
{
    return cel * 1.8 + 32.0;
}

float remainingAngle(float a1, float a2)
{
    return remainningAngleTotal - (a1 + a2);
}

int main(int argc, const char * argv[]) {
    /*
     congratulateStudent("Kate", "Coca",5);
     sleep(2);
     congratulateStudent("Bo", "Oc",4);
     sleep(2);
     congratulateStudent("Joney", "C#",1);
     */
    
    /*
     int taotal = 10;
     int trp = 1;
     showCookTimeForTurkey(taotal - trp);
     */
    
    // singTheSong(5);
    
    /*
     printf("bf te %f. \n",lastTemperatutre);
     lastTemperatutre = fahrenheitFromCelsius(18);
     printf("Templ is %f. \n",  lastTemperatutre);
     printf("af te %f. \n",lastTemperatutre);
     */
    
    // printf("A1 = 30 ,A2 =  60, A3 = %.2f. \n", remainingAngle(30.0,60.0));
    
    printf("\"5\" squared is \"%d\" \n", 5*5);
    
    return 0;
}



