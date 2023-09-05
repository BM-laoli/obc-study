//
//  main.c
//  affirmation
//
//  Created by administrator on 2023/9/5.
//

#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char * argv[]) {
    
    // error
    if(argc != 3){
        fprintf(stderr, "Error ");
        return  1;
    }
    
    int count = atoi(argv[2]);
    
    for (int i =0; i < count; i ++) {
        printf("You are %s ! \n",argv[1]);
    }
    return 0;
}
