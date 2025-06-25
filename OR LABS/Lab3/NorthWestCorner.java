import java.util.Arrays;

public class NorthWestCorner{
    public static void main(String[] args) {
        int[][] cost = {
            {12, 10, 12, 13},
            {7, 11, 8, 14},
            {6, 16, 11, 7}
        };
        // Demand is the row
        int[] demand = {180, 150, 350, 320};
        
        // Supply is the column
        int[] supply = {500, 300, 200};

        // Allocation Matrix
        int[][] finalarr = new int[supply.length][demand.length];

        int totalsupply = Arrays.stream(supply).sum();
        int totaldemand = Arrays.stream(demand).sum();

        System.out.println("Length Of Supply is : "+supply.length);
        System.out.println("Length Of Demand is : "+demand.length);

        System.out.println("The Total Supply Is : "+totalsupply);
        System.out.println("The Total Demand Is : "+totaldemand);
        if(totalsupply == totaldemand){
            System.out.println("The Total Supply And Total Demand Are Same :");
            for(int i = 0; i < supply.length; i++){
                for(int j = 0; j < demand.length; j++){
                    if(demand[j] < supply[i]){
                        finalarr[i][j] = demand[j];
                        supply[i] -= demand[j];
                        demand[j] = 0;
                    }
                    else if (demand[j] > supply[i]){
                        finalarr[i][j] = supply[i];
                        demand[j] -= supply[i];
                        supply[i] = 0;
                        break;
                    }
                    else{
                        finalarr[i][j] = supply[i];
                        demand[j] = 0;
                        supply[i] = 0;
                    }
                }
            }
            int sum = 0;
            for(int i = 0; i < supply.length; i++){
                for(int j = 0; j < demand.length; j++){
                    sum += finalarr[i][j] * cost[i][j];
                }
            }
            System.out.println(sum);
        }

    }
}