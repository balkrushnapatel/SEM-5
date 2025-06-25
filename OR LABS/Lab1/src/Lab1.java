public class Lab1 {
    public static void main(String[] args) {
        //Take aRandom array
        int[] arr = {7, 3, 9, 1, 5};

        //Using For Loop we can use Swap Sort Method
        for (int i = 0; i < arr.length; i++) {
            for (int j = i + 1; j < arr.length; j++) {
                if (arr[i] > arr[j]) {
                    //Swapping
                    int temp = arr[i];
                    arr[i] = arr[j];
                    arr[j] = temp;
                }
            }
        }

        System.out.println("Sorted array in ascending order:");
        for (int i = 0; i < arr.length; i++) {
            System.out.print(arr[i] + " ");
        }
    }
}
