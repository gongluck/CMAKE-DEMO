/*
 * @Author: gongluck 
 * @Date: 2020-05-17 14:42:02 
 * @Last Modified by: gongluck
 * @Last Modified time: 2020-05-17 17:46:14
 */

#include <stdio.h>

#ifdef USESUBMODULE
#include "myfun.h"
#endif//USESUBMODULE

int main()
{
    printf("hello, cmake!\n");
#ifdef USESUBMODULE
    printf("1+1=%d\n", myfun(1, 1));
#endif//USESUBMODULE
    return 0;
}