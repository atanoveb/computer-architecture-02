// 컴퓨터구조_과제_02 (C)
// 32202643
// 여지훈

#include <stdio.h>

void Sorting(int arr[], int len)
{
    int i, j, temp;

    for (i = 1; i < len; i++)
    {
        j = i - 1;
        temp = arr[i];

        while (j >= 0 && arr[j] > temp)
        {
            arr[j + 1] = arr[j];
            j--;
        }

        arr[j + 1] = temp;
    }
}

int main(void)
{
    int arr[] = {4, 2, 6, 3, 5, 1};
    int len = sizeof(arr) / sizeof(int);

    printf("---- Before Sorting ---- \n");
    for (int i = 0; i < len; i++)
    {
        printf("%d ", arr[i]);
    }
    printf("\n");

    Sorting(arr, len);

    printf("---- After Sorting ---- \n");
    for (int i = 0; i < len; i++)
    {
        printf("%d ", arr[i]);
    }
    printf("\n");

    return 0;
}