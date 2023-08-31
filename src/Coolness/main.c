//
//  main.c
//  Coolness
//
//  Created by administrator on 2023/8/25.
//

#include <stdio.h>
#include <readline/readline.h>
#include <stdlib.h>

void fnWhile()
{
    int i = 0;
    while (i  < 12) {
        printf("%d is cool. \n", i);
        i++;
    }
}

void fnFor()
{
    /*
     for (int i = 0; i<12; i++) {
         printf("%d is cool. \n", i);
     }
     */
    
    /*
     for (int i = 0; i<12; i++) {
         if(i==8){
             break;
         }
         printf("%d is cool. \n", i);
     }
     */
    
    for (int i = 0; i<12; i++) {
        if(i%3 == 0){
            continue;// 跳过本次循环
        }
        printf("%d is cool. \n", i);
    }
}

void doWhile()
{
    int i =0;
    do {
        printf("%d dow \n",i);
        i++;
    } while( i<13 );
}

// step = 3. form 99 -> 0 ,if %5 = 0 prtinf("Found one!")
void t(int start)
{
    int i = start;
    while (i != 0) {
        printf("N %d \n",i);
        if(i % 5 == 0) {
            printf("Found one! \n");
        }
        i = i-3;
    }
}

// readline
void fnRealine()
{
    printf("Where should I start counting ? \n");
    const char *name = readline(NULL);
    int s = atoi(name); // 把 "23" -> integer (ASCII TO Interge) atoi :)
    t(s);
}

int main(int argc, const char * argv[]) {
    //fnWhile();
    //fnFor();
    //doWhile();
    //t(99);
    fnRealine();
    return 0;
}
