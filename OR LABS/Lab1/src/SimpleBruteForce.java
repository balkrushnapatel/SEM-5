public class SimpleBruteForce {
    public static void main(String[] args) {
        int[] tasks = {10, 20, 30};
        int n = tasks.length;

        int minDiff = Integer.MAX_VALUE;
        int[] bestAssign = new int[n]; // Task assignment to servers

        // Try all 8 combinations using 3 nested loops (0 or 1 for each task)
        for (int t1 = 0; t1 <= 1; t1++) {
            for (int t2 = 0; t2 <= 1; t2++) {
                for (int t3 = 0; t3 <= 1; t3++) {

                    int load0 = 0, load1 = 0;

                    if (t1 == 0) load0 += tasks[0]; else load1 += tasks[0];
                    if (t2 == 0) load0 += tasks[1]; else load1 += tasks[1];
                    if (t3 == 0) load0 += tasks[2]; else load1 += tasks[2];

                    int diff = Math.abs(load0 - load1);

                    if (diff < minDiff) {
                        minDiff = diff;
                        bestAssign[0] = t1;
                        bestAssign[1] = t2;
                        bestAssign[2] = t3;
                    }
                }
            }
        }

        // Print the best assignment
        System.out.println("Best Task Assignment (Balanced):");
        for (int i = 0; i < n; i++) {
            System.out.println("Task " + (i + 1) + " → Server " + bestAssign[i]);
        }
    }
}