#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define nElem 10000

int cmpfunc (const void *a, const void *b) {
   return ( *(int*)a - *(int*)b );
}

int main () {
    srand(time(NULL));

    int array[nElem];

    for(int i=0; i<nElem; i++)
        array[i] = rand();

    qsort(array, nElem, sizeof(int), cmpfunc);

    return 0;
}
