public class Fibonnaci{
    public static void main(String[] args) {
        int prev2 = 0;
        int prev1 = 1;
        int newFibo;
        System.out.println("The First Number Is "+prev2);
        System.out.println("The Second Number Is "+prev1);

        for(int i = 0; i <= 18; i++){
            newFibo = prev2 + prev1;
            System.out.print(newFibo +" ");
            prev2 = prev1;
            prev1 = newFibo;
        }

    }
}