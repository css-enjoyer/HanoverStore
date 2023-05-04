
package Model;

import java.util.ArrayList;

public class ProductInventory {
    
    ArrayList<Product> pList = new ArrayList();
    Product pOffer;
    
    /* 
    public ProductInventory() {
        Product p1 = new Product(1, "Travis Scott x Jordan 1s", "94,689.00", "Images/Featured-TSJordan1s.png", 8);
        Product p2 = new Product(2, "Nike x Yeezy Zen Grey", "185,699.00", "Images/Featured-NikeXYeezyZenGrey.png", 4);
        Product p3 = new Product(3, "Adidas X Gucci Gazelle", "53,364.00", "Images/AdidasXGucciGazelleRed.png", 5);
        Product p4 = new Product(4, "Rick Owens Vintage Sneaks", "81,055.00", "Images/RickOwensVintageSneaks.png", 8);
        Product p5 = new Product(5, "Js1 RH Dior", "353,587.50", "Images/Jordan1RetroHighDior.png", 9);
        Product p6 = new Product(6, "Adidas Y3 Runners", "40,259.00", "Images/AdidasY3Runner4D.png", 5);
        Product p7 = new Product(7, "Nike SBD CLs", "31,125.50", "Images/NikeSBDunkLowCoffeeLovers.png", 5);
        Product p8 = new Product(8, "Air Max 1 Atmost E", "33,499.00", "Images/NikeAirMax1AtmosElephant.png", 7);
        Product p9 = new Product(9, "Kobe 6 Protro", "43,099.00", "Images/Kobe6ProtroEYBL.png", 5);
        Product p10 = new Product(10, "J1 RH Trophy Room", "89,099.00", "Images/Jordan1RetroHighTrophyRoom.png", 6);    

        pOffer = new Product(11, "AC/DC Chuck Taylors", "4,520.00", "Images/Offer-ChuckTaylorXACDC.jpg", 9);    

        pList.add(p1);
        pList.add(p2);
        pList.add(p3);
        pList.add(p4);
        pList.add(p5);
        pList.add(p6);
        pList.add(p7);
        pList.add(p8);
        pList.add(p9);
        pList.add(p10);
    }
    */
    
    public ArrayList getProductInvetory() {
        return pList;
    }
    public Product getProductOffer() {
        return pOffer;
    }
    
    public void addProductInventory(Product p) {
        pList.add(p);
    }
    public void setProductOffer(Product p) {
        pOffer = p;
    }
}
