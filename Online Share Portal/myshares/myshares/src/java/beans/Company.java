package beans;

public class Company {
  private String stockcode,company;

    public Company(String stockcode, String company) {
        this.stockcode = stockcode;
        this.company = company;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getStockcode() {
        return stockcode;
    }

    public void setStockcode(String stockcode) {
        this.stockcode = stockcode;
    }

    public Company() {
    }
}
