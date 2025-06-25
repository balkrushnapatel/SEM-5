public class Lab2 {
    public static void main(String[] args) {
        int sum = 0,max = 0,x1 = 0,x2 = 0;
        
        for (int i = 0; i <= 4; i++) {
            for (int j = 0; j <= 4; j++) {
                sum = 3 * i + 2 * j;
                if(sum > max && i + j <=4){
                    max = sum;
                    x1 = i;
                    x2 = j;
                }
            }
        }
        System.out.println("value of x1 is " + x1 + " And value of x2 is " + x2);
        System.out.println("value of max is " + max);
    }
}
