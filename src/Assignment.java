import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Assignment {

    public static class Frontend {

        private List<String> opts = new ArrayList<>();

        public Frontend() {
            this.opts.add("Modules by student");
            this.opts.add("Ghost modules");
            this.opts.add("Popularity ratings");
            this.opts.add("Top student(s)");
            this.opts.add("Harshness ranking");
            this.opts.add("Leaf modules");
            this.opts.add("Risky exams");
            this.opts.add("Twisted prerequisites");
        }

        private void showMenu() {
            for (int i = 0; i < this.opts.size(); i++) {
                System.out.println(i+1 + ") " + this.opts.get(i));
            }
            System.out.println("0) Quit");
        }

        public void begin() {
            Scanner scanner = new Scanner(System.in);
            int opt = -1;
            while (opt != 0) {
                try {
                    opt = scanner.nextInt();
                } catch (NumberFormatException e) {
                    System.err.println("Invalid number supplied, please try again.\n");
                    continue;
                }

            }
            scanner.close();
        }

    }

    public static void main(String[] args) {
        Frontend frontend = new Frontend();
        frontend.begin();
    }
}
