/*
 * @Author: gongluck 
 * @Date: 2020-05-13 10:36:07 
 * @Last Modified by: gongluck
 * @Last Modified time: 2020-05-13 15:57:25
 */

#include <stdio.h>
#include "config.h"

#ifdef USEMYPRINT
#include "myprint/myprint.h"
#else
    void myprint()
    {
        printf("mydemo006.\n");
    }
#endif

int main()
{
    myprint();
    #ifdef HAVE_PRINTF
        printf("have printf\n");
    #endif
    return 0;
}