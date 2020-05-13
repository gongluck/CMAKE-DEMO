/*
 * @Author: gongluck 
 * @Date: 2020-05-13 10:36:07 
 * @Last Modified by: gongluck
 * @Last Modified time: 2020-05-13 15:57:25
 */

#include "config.h"

#ifdef USEMYPRINT
#include "myprint/myprint.h"
#else
#include <stdio.h>
    void myprint()
    {
        printf("mydemo004.\n");
    }
#endif

int main()
{
    myprint();
    return 0;
}