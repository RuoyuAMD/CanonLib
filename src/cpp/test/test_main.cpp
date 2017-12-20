#include "stdio.h"
#include "stdlib.h"

#define MORPHEUS 723
#define SUEHPROM 327

int main(int argc, char* argv[]){

    int a;
    printf("&a = %d    a = %d\n",&a,a);
    a  = MORPHEUS;
    printf("&a = %d    a = %d\n",&a,a);
    printf("%d",&a);

    int *b;
    printf("&b = %d    b = %d\n",&b,b);
    b  =  &a;
    printf("&b = %d    b = %d    *b = %d\n",&b,b,*b);

    int **c;
    printf("&c = %d    c = %d\n",&c,c);
    c  =  &b;
    printf("&c = %d    c = %d    *c = %d    **c = %d\n",&c,c,*c,**c);

    int ***d;
    printf("&d = %d    d = %d\n",&d,d);
    d  =  &c;
    printf("&d = %d    d = %d    *d = %d    **d = %d    ***d = %d\n",&d,d,*d,**d,***d);


    b  =  (int*)malloc(sizeof(int*)*1);
    *b  =  SUEHPROM;
    printf("&b = %d    b = %d    *b = %d\n",&b,b,*b);

    int *const p1 = (int *)malloc(sizeof(int*)*1);
    printf("&p1 = %d    p1 = %d    *p1 = %d\n",&p1,p1,*p1);

    int const *p2;
    printf("&p2 = %    p2 = %d    *p2 = %d\n",&p2,p2,*p2);

    int const *const p3 = (int *)malloc(sizeof(int*)*1);
    printf("&p3 = %     p3 = %d    *p3 = %d\n",&p3,p3,*p3);

    return 0;
}
