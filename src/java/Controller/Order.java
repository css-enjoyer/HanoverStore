package Controller;


import Model.Cart;
import Model.Product;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Order extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/pdf");
        
        //Handle Order        
        HttpSession session = request.getSession();
        ArrayList<Cart> sessionCart = (ArrayList<Cart>)session.getAttribute("cart-list");
        if(sessionCart.isEmpty()) {
            session.setAttribute("order-status", null);
        } else {
            session.setAttribute("order-status", true);
            
            //Create PDF         
            ServletOutputStream os = response.getOutputStream();
            Document doc = new Document();
//            Font bfBold18 = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD, new BaseColor(0, 0, 0)); 
            try {
                System.out.println("Generating Receipt...");
                PdfWriter writer = PdfWriter.getInstance(doc, os);
                doc.open();
                
                Paragraph title = new Paragraph("Order Receipt");
                title.setAlignment(Element.ALIGN_CENTER);
                doc.add(title);
                doc.add(Chunk.NEWLINE);
                
                PdfPTable table = new PdfPTable(3);
                table.setWidthPercentage(100);
                PdfPCell qtyHeader = new PdfPCell(new Paragraph("QTY"));
                PdfPCell descHeader = new PdfPCell(new Paragraph("DESCRIPTION"));
                PdfPCell amountHeader = new PdfPCell(new Paragraph("AMOUNT"));
                qtyHeader.setHorizontalAlignment(Element.ALIGN_CENTER);
                descHeader.setHorizontalAlignment(Element.ALIGN_CENTER);
                amountHeader.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(qtyHeader);
                table.addCell(descHeader);
                table.addCell(amountHeader);
                for(int i = 0; i < sessionCart.size(); i++) {
                    Product item = (Product)sessionCart.get(i);
                    PdfPCell nameCell = new PdfPCell(new Phrase(item.getName()));
                    PdfPCell amountCell = new PdfPCell(new Phrase(item.getPrice()));
                    PdfPCell qtyCell = new PdfPCell(new Phrase("1"));
                    nameCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    amountCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    qtyCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table.addCell(qtyCell);
                    table.addCell(nameCell);
                    table.addCell(amountCell);
                }
                doc.add(table);
                doc.close();
                sessionCart.clear();
                System.out.println("Receipt Generated...");
            } catch(Exception e) {
                e.printStackTrace();
            }
            session.setAttribute("cart-list", sessionCart);     
        }
//        response.sendRedirect("HomeJSP.jsp");
        
        
        
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
