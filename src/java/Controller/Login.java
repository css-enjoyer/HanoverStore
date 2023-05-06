package Controller;

import Model.Cart;
import Model.Product;
import Model.ProductInventory;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.concurrent.atomic.AtomicInteger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Security.Security;

public class Login extends HttpServlet {

    Connection conn;
    String productOffer;
    private AtomicInteger attempts;
    private AtomicInteger attemptsLeft;

    /* Load PRODUCT database */
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        productOffer = config.getInitParameter("productOffer");
        attempts = new AtomicInteger(0);
        attemptsLeft = new AtomicInteger(3);
    }

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

        // verify account
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // check if request is from register
        if (request.getAttribute("registerSuccess") != null
                && (boolean) request.getAttribute("registerSuccess")) {
            request.removeAttribute("registerSuccess");
            username = (String) request.getAttribute("username");
            password = (String) request.getAttribute("password");
        }

        // get key and cipher from dd
        String keyStr = getServletContext().getInitParameter("dbSecurityKey");
        byte[] key = keyStr.getBytes();
        String cipherStr = getServletContext().getInitParameter("dbCipher");
//        String encryptedPassword = Security.encrypt(password, key);

        // add user to session if account is verified
        if (attempts.get() < 3) {
            try {
                String query = "SELECT * FROM USERS WHERE USER_NAME = ?";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setString(1, username);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    // decrypt password from db and then compare to user's input
                    if (Security.decrypt(rs.getString("USER_PASSWORD"), key, cipherStr).equals(password)) {
                        // proceed to content page
                        session.setAttribute("username", username);
                        session.setAttribute("userRole", rs.getString("USER_ROLE"));
                        loadProducts(request, response);
                        response.sendRedirect("HomeJSP.jsp");
                    } else {
                        // 1st case the password is incorrect
                        // Increments attempts if the username / password is incorrect
                        String msg = "Incorrect username or password, you have " + attemptsLeft.decrementAndGet() + " attempts left";
                        // show message incorrect and counter
                        attempts.getAndIncrement();
                        request.setAttribute("msg", msg);
//                    request.getRequestDispatcher("login.jsp").include(request, response);
                        request.getRequestDispatcher("Error.jsp").forward(request, response);
                    }

                } else if (username.isEmpty() || password.isEmpty()) {
                    // show message empty
                    String msg = "username or password is empty!";
                    request.setAttribute("msg", msg);
//                    request.getRequestDispatcher("login.jsp").include(request, response);
                    request.getRequestDispatcher("Error.jsp").forward(request, response);
                } else {
                    // 2nd case either the username or the password is incorrect
                    // Increments attempts if the username / password is incorrect
                    String msg = "Incorrect username or password, you have " + attemptsLeft.decrementAndGet() + " attempts left";
                    // show message incorrect and counter
                    attempts.getAndIncrement();
                    request.setAttribute("msg", msg);
//                    request.getRequestDispatcher("login.jsp").include(request, response);
                    request.getRequestDispatcher("Error.jsp").forward(request, response);
                }
            } catch (SQLException sqle) {
                sqle.printStackTrace();
                // redirect to error page
                String msg = sqle.getMessage();
                request.setAttribute("msg", msg);
                response.sendRedirect("Error.jsp");
            }
        }

        if (attempts.get() >= 3) {
            // show error page when limit reached
            String msg = "error limit reached!";
            request.setAttribute("msg", msg);
//                    request.getRequestDispatcher("login.jsp").include(request, response);
            request.getRequestDispatcher("Error.jsp").forward(request, response);
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

    private void loadProducts(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ProductInventory inventory = new ProductInventory();

        /* Retrieve products from database */
        try {
            if (conn == null) {
                response.sendRedirect("Error404.jsp");
            }

            Statement stmt = conn.createStatement();
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
                } /* Add Product objects to Inventory */ else {
                    inventory.addProductInventory(new Product(productID, productName, productPrice, productImage, productRating));
                }

                request.getSession().setAttribute("inventory", inventory);
            }
        } catch (SQLException sqle) {
            System.out.println("SQLException error occured - "
                    + sqle.getMessage());
        }

    }

}
