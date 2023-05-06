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
            Font bfBold22 = new Font(Font.FontFamily.HELVETICA, 22, Font.BOLD, new BaseColor(0, 0, 0)); 
            Font bfBold18 = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD, new BaseColor(0, 0, 0)); 
            Font bfBold12 = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD, new BaseColor(0, 0, 0)); 
            Font bfLight10 = new Font(Font.FontFamily.HELVETICA, 10, Font.NORMAL, new BaseColor(140, 140, 140)); 
            try {
                System.out.println("Generating Receipt...");
                PdfWriter writer = PdfWriter.getInstance(doc, os);
                doc.open();
                
                Paragraph title = new Paragraph("Hanover", bfBold22);
                Paragraph receipt = new Paragraph("Receipt", bfBold18);
                Paragraph address1 = new Paragraph("España Blvd, Sampaloc, Manila", bfLight10);
                Paragraph address2 = new Paragraph("1008 Metro Manila", bfLight10);
                
                title.setAlignment(Element.ALIGN_LEFT);
                address1.setAlignment(Element.ALIGN_LEFT);
                address2.setAlignment(Element.ALIGN_LEFT);
                receipt.setAlignment(Element.ALIGN_RIGHT);

                
                doc.add(title);
                doc.add(address1);
                doc.add(address2);
                doc.add(receipt);
                
                doc.add(Chunk.NEWLINE);
                
                PdfPTable table = new PdfPTable(3);
                table.getDefaultCell().setPadding(10);
                table.setWidthPercentage(100);
                float[] columnWidths = {.8f, 4f, 2f};
                table.setWidths(columnWidths);

                PdfPCell qtyHeader = new PdfPCell(new Paragraph("QTY", bfBold12));
                PdfPCell descHeader = new PdfPCell(new Paragraph("DESCRIPTION", bfBold12));
                PdfPCell amountHeader = new PdfPCell(new Paragraph("AMOUNT", bfBold12));
                
                qtyHeader.setColspan(1);
                qtyHeader.setBorderWidth(1);
                qtyHeader.setHorizontalAlignment(Element.ALIGN_CENTER);
                qtyHeader.setPadding(10);
                qtyHeader.setBackgroundColor(BaseColor.LIGHT_GRAY);
                
                descHeader.setColspan(1);
                descHeader.setBorderWidth(1);
                descHeader.setHorizontalAlignment(Element.ALIGN_CENTER);
                descHeader.setPadding(10);
                descHeader.setBackgroundColor(BaseColor.LIGHT_GRAY);
                
                amountHeader.setColspan(1);
                amountHeader.setBorderWidth(1);
                amountHeader.setHorizontalAlignment(Element.ALIGN_CENTER);
                amountHeader.setPadding(10);
                amountHeader.setBackgroundColor(BaseColor.LIGHT_GRAY);
                
                table.addCell(qtyHeader);
                table.addCell(descHeader);
                table.addCell(amountHeader);
                
                float totalAmount = 0;
                for(int i = 0; i < sessionCart.size(); i++) {
                    Product item = (Product)sessionCart.get(i);
                    PdfPCell nameCell = new PdfPCell(new Phrase(item.getName()));
                    PdfPCell amountCell = new PdfPCell(new Phrase(item.getPrice()));
                    PdfPCell qtyCell = new PdfPCell(new Phrase("1"));
                    
                    nameCell.setHorizontalAlignment(Element.ALIGN_LEFT);
                    amountCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    qtyCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    nameCell.setPadding(10);
                    amountCell.setPadding(10);
                    qtyCell.setPadding(10);
                    
                    table.addCell(qtyCell);
                    table.addCell(nameCell);
                    table.addCell(amountCell);
                    
                    totalAmount += Double.parseDouble(item.getPrice().replaceAll(",",""));
                }
                // add footer row with total amount
                PdfPCell subtotalTextCell = new PdfPCell(new Phrase("Subtotal"));
                subtotalTextCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
                subtotalTextCell.setColspan(2);
                subtotalTextCell.setPadding(10);
                table.addCell(subtotalTextCell);
                PdfPCell subtotalCell = new PdfPCell(new Phrase(String.valueOf(totalAmount)));
                subtotalCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                subtotalCell.setPadding(10);
                table.addCell(subtotalCell);

                PdfPCell taxTextCell = new PdfPCell(new Phrase("Sales Tax 8%"));
                taxTextCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
                taxTextCell.setColspan(2);
                taxTextCell.setPadding(10);
                table.addCell(taxTextCell);
                double taxAmount = totalAmount * 0.08;
                PdfPCell taxCell = new PdfPCell(new Phrase(String.valueOf(taxAmount)));
                taxCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                taxCell.setPadding(10);
                table.addCell(taxCell);
                
                PdfPCell totalTextCell = new PdfPCell(new Phrase("Total Amount"));
                totalTextCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
                totalTextCell.setColspan(2);
                totalTextCell.setPadding(10);
                table.addCell(totalTextCell);
                totalAmount += taxAmount;
                PdfPCell totalCell = new PdfPCell(new Phrase("PHP " + totalAmount, bfBold12));
                totalCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                totalCell.setPadding(10);
                table.addCell(totalCell);
                
                doc.add(table);
                doc.close();
                sessionCart.clear();
                System.out.println("Receipt Generated...");
            } catch(Exception e) {
                e.printStackTrace();
            }
            session.setAttribute("cart-list", sessionCart);     
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
