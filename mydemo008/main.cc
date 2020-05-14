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
#include <stdio.h>
    void myprint()
    {
        printf("mydemo008.\n");
    }
#endif

int main()
{
    printf("Version %d.%d\n", VERSION_MAJOR, VERSION_MINOR);
    myprint();
    #ifdef HAVE_PRINTF
        printf("have printf\n");
    #endif
    return 0;
}