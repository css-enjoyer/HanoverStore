package Controller;

import Model.Cart;
import Model.Product;
import Model.ProductInventory;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {
    
    Connection con;
    String productOffer;
    
    /* Load PRODUCT database */
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        productOffer = config.getInitParameter("productOffer");
        
        try {
            // Load driver
            Class.forName(config.getInitParameter("dbDriverClass"));
            
            // Establish connection
            String dbUsername = config.getInitParameter("dbUsername");
            String dbPassword = config.getInitParameter("dbPassword");
            
            StringBuffer url = new StringBuffer(config.getInitParameter("dbDriverURL"))
                    .append("://")
                    .append(config.getInitParameter("dbHost"))
                    .append(":")
                    .append(config.getInitParameter("dbPort"))
                    .append("/")
                    .append(config.getInitParameter("dbName"));
            
            con = DriverManager.getConnection(url.toString(), dbUsername, dbPassword);
        }
        catch (SQLException sqle) {
            System.out.println("SQLException error occured - " 
                    + sqle.getMessage());
        } 
        catch (ClassNotFoundException nfe) {
            System.out.println("ClassNotFoundException error occured - " 
            + nfe.getMessage());
        }
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        
        ProductInventory inventory = new ProductInventory();
        
        /* Retrieve products from database */
        try {
            if (con == null) {
                response.sendRedirect("Error404.jsp");
            }
            
            Statement stmt = con.createStatement();
            ResultSet result = stmt.executeQuery("SELECT * FROM product ORDER BY prod_id ASC");
            
            /* Create Product objects */
            while (result.next()) {
                int productID = Integer.parseInt(result.getString("PROD_ID").trim());
                String productName = result.getString("PROD_NAME").trim();
                String productPrice = result.getString("PROD_PRICE").trim();
                String productImage = result.getString("PROD_IMAGE").trim();
                int productRating = Integer.parseInt(result.getString("PROD_RATING").trim());
                
                /* Add Product Offer to Inventory */
                if (productName.equals(productOffer)) {
                    inventory.setProductOffer(new Product(productID, productName, productPrice, productImage, productRating));
                } 
                /* Add Product objects to Inventory */
                else {
                    inventory.addProductInventory(new Product(productID, productName, productPrice, productImage, productRating));
                }
            }
        }
        catch (SQLException sqle) {
            System.out.println("SQLException error occured - " 
                    + sqle.getMessage());
        }
        
        if(user.equals("admin") && pass.equals("admin")) {
            // session.setAttribute("username", user);
            // response.sendRedirect("HomeJSP.jsp");
            
            request.getSession().setAttribute("username", "user");
            request.getSession().setAttribute("inventory", inventory);
            response.sendRedirect("HomeJSP.jsp");
        } 
        else {
            response.sendRedirect("LandingJSP.jsp");
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

