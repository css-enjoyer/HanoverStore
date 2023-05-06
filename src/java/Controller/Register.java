/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Security.Security;
import nl.captcha.Captcha;

/**
 *
 * @author maxim
 */
public class Register extends HttpServlet {

    private Connection conn;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            // Load driver
            Class.forName(getServletContext().getInitParameter("dbDriverClass"));

            // Establish connection
            String dbUsername = getServletContext().getInitParameter("dbUsername");
            String dbPassword = getServletContext().getInitParameter("dbPassword");

            StringBuffer url = new StringBuffer(getServletContext().getInitParameter("dbDriverURL"))
                    .append("://")
                    .append(getServletContext().getInitParameter("dbHost"))
                    .append(":")
                    .append(getServletContext().getInitParameter("dbPort"))
                    .append("/")
                    .append(getServletContext().getInitParameter("dbName"));

            conn = DriverManager.getConnection(url.toString(), dbUsername, dbPassword);
        } catch (SQLException sqle) {
            System.out.println("SQLException error occured - "
                    + sqle.getMessage());
        } catch (ClassNotFoundException nfe) {
            System.out.println("ClassNotFoundException error occured - "
                    + nfe.getMessage());
        }

        // start new session
        HttpSession session = request.getSession();

        // get user input
        String username = request.getParameter("username");
        String userRole = request.getParameter("userRole");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");

        if (!password1.equals(password2)) {
            String msg = "Passwords do not match, pw1: " + password1 + " pw2: " + password2;
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("Error.jsp").forward(request, response);
            return;
        }

        try {
            // Check if username exists in db
            String userCheckQuery = "SELECT * FROM USERS WHERE USER_NAME = ?";
            PreparedStatement userCheckPS = conn.prepareStatement(userCheckQuery);
            userCheckPS.setString(1, username);
            ResultSet rs = userCheckPS.executeQuery();

            // get user's captcha answer
            Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
            request.setCharacterEncoding("UTF-8");
            String answer = request.getParameter("answer");

            if (rs.next()) {
                String msg = "Username already exists";
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("Error.jsp").forward(request, response);
            } else {
                // verify captcha first
                if (!captcha.isCorrect(answer)) {
                    String msg = "Captcha answer is wrong!";
                    request.setAttribute("msg", msg);
                    request.getRequestDispatcher("Error.jsp").forward(request, response);
                    return;
                }
                // save user to db
                String saveUserQuery = "INSERT INTO USERS (USER_NAME, USER_PASSWORD, USER_ROLE) VALUES (?, ?, ?)";
                PreparedStatement saveUserPS = conn.prepareStatement(saveUserQuery);
                saveUserPS.setString(1, username);
                // encrypt password
                String keyStr = getServletContext().getInitParameter("dbSecurityKey");
                byte[] key = keyStr.getBytes();
                String cipherStr = getServletContext().getInitParameter("dbCipher");
                String encryptedPassword = Security.encrypt(password1, key, cipherStr);
                saveUserPS.setString(2, encryptedPassword);
                saveUserPS.setString(3, userRole);
                saveUserPS.execute();

                // proceed to content page
                session.setAttribute("username", username);
                // sets the username and pw to redirect to homejsp to automatically login
//                response.sendRedirect("LandingJSP.jsp");
                
                request.setAttribute("registerSuccess", true);
                request.setAttribute("username", username);
                request.setAttribute("password", password1);
                request.getRequestDispatcher("Login").forward(request, response);
            }

        } catch (SQLException sqle) {
            sqle.printStackTrace();
            // redirect to error page
            String msg = sqle.getMessage();
            request.setAttribute("msg", msg);
            response.sendRedirect("Error.jsp");
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
