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

     private void insertUser(String name, int passcode, String email, int nationkey) {
        try {
            String maxUser = "SELECT MAX(u_userkey) FROM user; ";           //sql query
            PreparedStatement maxUserStatement = c.prepareStatement(maxUser);        //making the query a statement so its runnable
            ResultSet maxresult = maxUserStatement.executeQuery();       //storing the resutls in a result set
            int userID = maxresult.getInt(1) + 1;

            String insertUserQ = "INSERT INTO user(u_userkey, u_userName, u_passcode, u_email, u_nationkey) VALUES (?,?,?,?,?)";
            PreparedStatement insertUser = c.prepareStatement(insertUserQ);
           
            insertUser.setInt(1, userID);
            insertUser.setString(2, name);
            insertUser.setInt(3, passcode);
            insertUser.setString(4, email);
            insertUser.setInt(5, nationkey);
            insertUser.executeUpdate();

            c.commit();
            maxresult.close();         
            maxUserStatement.close();              //close the result set
            insertUser.close();
        } catch (Exception e) {           // check for errors 
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            try {
                c.rollback();
            } catch (Exception e1) {
                System.err.println(e1.getClass().getName() + ": " + e1.getMessage());
            }
        }

    }

    public static void main(String args[]) {
        Scanner scan = new Scanner(System.in);
        String input = " ";
        Main dbconnection = new Main();
    
        dbconnection.openConnection("tpch.sqlite");
        System.out.println("Are you a user or an artist? (1 for user, 2 for artist)");
        int input2 = Integer.parseInt(scan.nextLine());
        if (input2 == 1) {
            System.out.println("What is your username?");
            String userName = String.valueOf(scan.nextLine());
            System.out.println("What is your passcode?");
            int passcode = Integer.parseInt(scan.nextLine());
            System.out.println("What is your email?");
            String email = String.valueOf(scan.nextLine());
            System.out.println("What nation are you from? Type 1 for United States, 2 for Japan, 3 for Korea, 4 for Canada, 5 for United Kingdom, 6 for Saudi Arabia, 7 for Iraq, 8 for India, or 9 for Taiwan ");
            int nationkey = Integer.parseInt(scan.nextLine());
            dbconnection.insertUser(userName, passcode, email, nationkey);
            
        }
        else if (input2 == 2){
            System.out.println("What is your username?");
            String artistName = String.valueOf(scan.nextLine());
            System.out.println("What is your passcode?");
            int passcode = Integer.parseInt(scan.nextLine());
            System.out.println("What is your email?");
            String email = String.valueOf(scan.nextLine());
            System.out.println("What nation are you from? Type 1 for for United States, 2 for Japan, 3 for Korea, 4 for Canada, 5 for United Kingdom, 6 for Saudi Arabia, 7 for Iraq, 8 for India, or 9 for Taiwan ");
        } 
    }

    
}