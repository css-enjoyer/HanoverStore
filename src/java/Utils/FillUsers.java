/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import Security.Security;

/**
 *
 * @author maxim
 */
public class FillUsers {

    private static Connection conn;

    public static void main(String[] args) {
        try {
            Class dbDriver = Class.forName("org.apache.derby.jdbc.ClientDriver");
            String username = "app";
            String password = "app";
            String url = "jdbc:derby://localhost:1527/HanoverStoreDB";
            conn = DriverManager.getConnection(url, username, password);
        } catch (SQLException sqle) {
            System.out.println("SQLException error occured - "
                    + sqle.getMessage());
        } catch (ClassNotFoundException nfe) {
            System.out.println("ClassNotFoundException error occured - "
                    + nfe.getMessage());
        }

        try {
            String saveUserQuery = "INSERT INTO USERS (USER_NAME, USER_PASSWORD, USER_ROLE) VALUES (?, ?, ?)";
            PreparedStatement saveUserPS = conn.prepareStatement(saveUserQuery);
            String keyStr = "ics_2609ics_2609";
            byte[] key = keyStr.getBytes();
            String cipherStr = "AES/ECB/PKCS5Padding";
            for (int i = 2; i <= 10; i++) {
                saveUserPS.setString(1, "user" + i + "@gmail.com");
                // encrypt password
                String encryptedPassword = Security.encrypt("user" + i, key, cipherStr);
                saveUserPS.setString(2, encryptedPassword);
                saveUserPS.setString(3, "user");
                saveUserPS.execute();
                System.out.println("number: " + i);
            }

        } catch (SQLException sqle) {
            System.out.println("SQLException error occured - "
                    + sqle.getMessage());
        }

    }
}
