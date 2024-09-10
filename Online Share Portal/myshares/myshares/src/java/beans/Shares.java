package beans;

import dao.SharesDAO;
import java.util.ArrayList;
import java.util.List;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.model.SelectItem;
import javax.servlet.http.HttpSession;

public class Shares {
    private  String  stockcode, message, company;
    private int noshares;
    private double sharevalue;
   
    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public double getSharevalue() {
        return sharevalue;
    }

    public void setSharevalue(double sharevalue) {
        this.sharevalue = sharevalue;
    }

    public int getNoshares() {
        return noshares;
    }

    public void setNoshares(int noshares) {
        this.noshares = noshares;
    }


    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public double getNetvalue() {
     return noshares * sharevalue;
    }
    

    public String getStockcode() {
        return stockcode;
    }

    public void setStockcode(String stockcode) {
        this.stockcode = stockcode;
    }

    public ArrayList<SelectItem> getCompanies() {
         ArrayList<Company> companies = SharesDAO.getCompanies();
         ArrayList<SelectItem> items = new ArrayList<SelectItem>();
         for( Company c : companies)
             items.add( new SelectItem(c.getStockcode(), c.getCompany()));
         
         System.out.println(items);
         return items;
    }

     public void  addShares(ActionEvent evt) {
        HttpSession ses = (HttpSession) FacesContext
                .getCurrentInstance()
                .getExternalContext().getSession(false);
        int userid = (Integer) ses.getAttribute("userid");
        boolean done = SharesDAO.addShares(userid, stockcode,noshares);
        if ( done)
             message = "Shares added successfully!";
        else
            message = "Sorry! Could not add shares!";

     }

      public void  updateShares(ActionEvent evt) {
        HttpSession ses = (HttpSession) FacesContext
                .getCurrentInstance()
                .getExternalContext().getSession(false);
        int userid = (Integer) ses.getAttribute("userid");
        boolean done = SharesDAO.updateShares(userid,stockcode,noshares);
        if ( done)
             message = "Shares Updated successfully!";
        else
            message = "Sorry! Could not update shares!";

     }

      public List<Shares> getMyShares() {
        HttpSession ses = (HttpSession) FacesContext
                .getCurrentInstance()
                .getExternalContext().getSession(false);
        int userid = (Integer) ses.getAttribute("userid");
        List<Shares> shares = SharesDAO.getMyShares(userid);
        return shares;
     }
}





