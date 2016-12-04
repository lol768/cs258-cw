import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Assignment {

    public static class DatabaseConnection {
        private static final String DEFAULT_HOST = "localhost"; // TODO: Daisy it
        private static final String DEFAULT_USERNAME = "assignment_user"; // TODO: Daisy it
        private static final String DEFAULT_PASSWORD = "password123"; // TODO: Daisy it
        private static final int DEFAULT_PORT = 49161; // TODO: Daisy it
        private static final String DEFAULT_SID = "xe"; // TODO: Daisy it


        private <T> T getValueOrOverride(T defaultValue, String name) {
            final String envValue = System.getenv("COURSEWORK_" + name);
            if (envValue != null) {
                if (Integer.class == defaultValue.getClass()) {
                    return (T) new Integer(Integer.parseInt(envValue));
                }
                return (T) envValue;
            }
            return defaultValue;
        }

        private void assertDriverPresent() {
            try {
                Class.forName ("oracle.jdbc.OracleDriver");
            } catch (ClassNotFoundException e) {
                System.err.println("Oracle driver missing, terminating!");
                System.exit(-1);
            }
        }

        public Connection getConnection() {
            this.assertDriverPresent();
            String host = this.getValueOrOverride(DEFAULT_HOST, "HOST");
            String username = this.getValueOrOverride(DEFAULT_USERNAME, "USERNAME");
            String password = this.getValueOrOverride(DEFAULT_PASSWORD, "PASSWORD");
            String sid = this.getValueOrOverride(DEFAULT_SID, "SID");
            int port = this.getValueOrOverride(DEFAULT_PORT, "PORT");

            String connectionStr = "jdbc:oracle:thin:@" + host + ":" + port +  ":" + sid;
            try {
                Connection conn = DriverManager.getConnection (
                        connectionStr, username, password);
            } catch (SQLException e) {
                System.err.println("Failed to acquire a database connection, terminating!");
                System.exit(-1);
            }
        }
    }

    /**
     * Class to handle the frontend stuff:
     *
     * [*] Displaying the menu
     * [*] Performing input validation
     * [*] Calling the respective functions on the passed in class
     */
    public static class Frontend {

        /**
         *
         */
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
                    if (opt < 0 || opt > this.opts.size()) {
                        
                    }
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
