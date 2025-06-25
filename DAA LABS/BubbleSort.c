#include <stdio.h>

void BubbleSort(int arr[], int n){
    for(int i = 0; i < n - 1; i++){
        for (int j = 0; j < n - i - 1; j++){
            if(arr[j] > arr[j + 1]){
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
}

int main(){
    int arr[] = {10, 1, 4, 28, 7, 23, 4, 51, 78, 14};
    int n = sizeof(arr) / sizeof(arr[0]);
    
    printf("UnSorted array:\n");
    for (int i = 0; i < n; i++) {
        printf("%d ", arr[i]);
    }

    BubbleSort(arr, n);

    printf("\nSorted array:\n");
    for(int i = 0; i < n; i++){
        printf("%d ", arr[i]);
    }
    return 0;
}
