#include <stdio.h>

void InsertionSort(int arr[], int n){
    for (int i = 1; i < n; i++) {
        int ptr = arr[i];
        int j = i - 1;

        while (j >= 0 && arr[j] > ptr) {
            arr[j + 1] = arr[j];
            j--;
        }

        arr[j + 1] = ptr;
    }
}

int main() {
    int arr[] = {1,5,9,7,3,4,8,2,60,41,18,12};
    int n = sizeof(arr) / sizeof(arr[0]);
    
    printf("UnSorted array:\n");
    for (int i = 0; i < n; i++) {
        printf("%d ", arr[i]);
    }

    InsertionSort(arr, n);

    printf("\nSorted array:\n");
    for (int i = 0; i < n; i++) {
        printf("%d ", arr[i]);
    }

    return 0;
}
