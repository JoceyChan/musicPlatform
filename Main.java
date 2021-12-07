import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Scanner;

import org.sqlite.javax.SQLiteConnectionPoolDataSource;

import java.util.Date;

public class Main {
    private Connection c = null;
    private String dbName;
    private boolean isConnected = false;
    org.sqlite.SQLiteConfig config;

    private void openConnection(String _dbName) {
        dbName = _dbName;

        if (isConnected == false) {
            System.out.println("Opening: " + _dbName);
            try {
                config = new org.sqlite.SQLiteConfig();
                config.enforceForeignKeys(true);
                String connectionString = new String("jdbc:sqlite:");
                connectionString += dbName;

                Class.forName("org.sqlite.JDBC"); // registers jdbc driver

                c = DriverManager.getConnection(connectionString, config.toProperties()); // open connection
                c.setAutoCommit(false); // disables autotransactions
                
                //PreparedStatement s1 = c.prepareStatement("PRAGMA foreign_keys = ON; ");
                //s1.executeUpdate();

                PreparedStatement s2 = c.prepareStatement("PRAGMA foreign_keys; ");
                ResultSet set = s2.executeQuery();

                /* while(set.next()){
                    int val = set.getInt(1);
                    System.out.printf("%-10d\n", val);
                } */

                //s1.close();
                s2.close();
                set.close();

                isConnected = true;
                System.out.print("Connected. ");
            } catch (Exception e) { // catch errors
                System.err.println(e.getClass().getName() + ": " + e.getMessage());
                System.exit(0);
            }
        }
    }

    private void closeConnection() {
        if (true == isConnected) {
            System.out.println("Close database: " + dbName);

            try {
                c.close();
                isConnected = false;
                dbName = "";
                System.out.println("Closed the database");
            } catch (Exception e) {
                System.err.println(e.getClass().getName() + ": " + e.getMessage());
                System.exit(0);
            }

        }
    }

    public static void main(String args[]) {
        Scanner scan = new Scanner(System.in);
        String input = " ";
        Main dbconnection = new Main();
    
        dbconnection.openConnection("tpch.sqlite");
        System.out.println("Hello");
    }

    
}