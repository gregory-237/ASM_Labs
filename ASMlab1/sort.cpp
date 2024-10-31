#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>

void selection_sort_code()
{
    unsigned int N;
    int* array;
    printf("Enter array length: ");
    scanf_s("%u", &N);

    array = (int*)malloc(N * sizeof(int));


    int i = 0;
    do{
        printf("array[%d] = ", i);
        scanf_s("%d", &array[i]);
        ++i;
    }while (i < N);


    i = 0;
    do{

        int min_idx = i;
        int j = i + 1;
        do {
            if (array[j] < array[min_idx]) min_idx = j;
            ++j;
        } while (j < N);

        int temp = array[min_idx];
        array[min_idx] = array[i];
        array[i] = temp;
        ++i;
    } while (i < N - 1);


    i = 0;
    do{
        printf("%d ", array[i]);
        ++i;
    }while (i < N);


    free(array);
}

void simple_selection_sort_code()
{
    unsigned int N;
    int* array;
    printf("Enter array length: ");
    scanf_s("%u", &N);

    array = (int*)malloc(N * sizeof(int));


int i = 0;
cycle_input_start:
    printf("array[%d] = ", i);
    scanf_s("%d", &array[i]);
    i += 1;
    goto cycle_input_end;

cycle_input_end:
    if (i < N) goto cycle_input_start;



i = 0;
int min_idx, j, temp;

outer_loop:
    if (i >= N - 1) goto end;

    min_idx = i;
    j = i + 1;

inner_loop:
    if (j >= N) goto swap;

    if (array[j] < array[min_idx]) min_idx = j;
    j += 1;
    goto inner_loop;

swap:
    temp = array[min_idx];
    array[min_idx] = array[i];
    array[i] = temp;
    i += 1;
    goto outer_loop;

end:
    i = 0;
    goto cycle_output_start;


cycle_output_start:
    printf("array[%d] = %d\n", i, array[i]);
    i += 1;
    goto cycle_output_end;

cycle_output_end:
    if (i < N) goto cycle_output_start;

    free(array);
}


void main() {
   /* selection_sort_code();*/
    simple_selection_sort_code();
}