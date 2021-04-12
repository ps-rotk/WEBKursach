package com.zoo;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBUtil {
    private static Connection connection = null;

    public static Connection getConnection() {
        if (connection != null) return connection;
        else {
            try {
                //Properties properties = new Properties();
                //properties.load(new FileReader("bd.properties"));
                String driver = "org.postgresql.Driver";
                String url = "jdbc:postgresql://localhost:5432/Zoopark";
                String user = "postgres";
                String password = "root";
                Class.forName(driver);
                connection = DriverManager.getConnection(url, user, password);
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
            return connection;
        }
    }
}
