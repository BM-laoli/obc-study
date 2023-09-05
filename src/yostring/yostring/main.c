//
//  main.c
//  yostring
//
//  Created by administrator on 2023/9/5.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, const char * argv[]) {
    char x = 0x21; // '!'
    while (x <= '~') {// '~'
        printf("%x is %c \n",x,x);
        x++;
    }
    
    char *start = malloc(5);
    start[0] = 'L';
    start[1] = 'o';
    start[2] = 'v';
    start[3] = 'e';
    start[4] = '\0';
    printf("%s has %zu char \n",start,strlen(start));
    printf("The 3 chat is %c \n", *(start+2));
    start[2] = 'i';
    printf("The 3 chat is %c \n", *(start+2));
    free(start);
    start = NULL;
    
    // char *start = "Love"// 效果一样 就是这不能改！
    
    return 0;
}
