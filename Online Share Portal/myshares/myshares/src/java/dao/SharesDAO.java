package dao;

import beans.Company;
import beans.Shares;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class SharesDAO {
    public static ArrayList<Company> getCompanies() {
        try {
            Connection con = Database.getConnection();
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select stockcode, company from shares order by company");
            ArrayList<Company> al = new ArrayList<Company>();
            while( rs.next()) {
                 al.add(  new Company(rs.getString("stockcode"),rs.getString("company")));
            }
            rs.close();
            return al;
        } catch(Exception e) {
            System.out.println("Error In getCompanies() -->" + e.getMessage());
            return(null);
        }
    }


     public static ArrayList<Shares> getMyShares(int userid) {
        try {
            Connection con = Database.getConnection();
            PreparedStatement ps = con.prepareStatement("select s.stockcode, company, noshares, sharevalue from shares s inner join user_shares u on (u.stockcode = s.stockcode) where userid = ?");
            ps.setInt(1,userid);
            ArrayList<Shares> al = new ArrayList<Shares>();
            ResultSet rs = ps.executeQuery();
            while( rs.next()) {
                 Shares s = new Shares();
                 s.setCompany(rs.getString("company"));
                 s.setNoshares(rs.getInt("noshares"));
                 s.setStockcode(rs.getString("stockcode"));
                 s.setSharevalue(rs.getDouble("sharevalue"));
                 al.add(s);
            }
            rs.close();
            return al;
        } catch(Exception e) {
            System.out.println("Error In getMyShares() -->" + e.getMessage());
            return(null);
        }
    }

     public static boolean addShares(int userid, String stockcode, int noshares) {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement("insert into user_shares values(?,?,?)");
            ps.setInt(1, userid);
            ps.setString(2,stockcode);
            ps.setInt(3,noshares);
            if (ps.executeUpdate() == 1) {
                return true;
            } else {
                return false;
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return false;
        } finally {
            Database.close(con);
        }
    }

       public static boolean updateShares(int userid, String stockcode, int noshares) {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement("update user_shares set noshares = ? where userid = ? and stockcode = ?");
            ps.setInt(1, noshares);
            ps.setInt(2,userid);
            ps.setString(3,stockcode);
            if (ps.executeUpdate() == 1) {
                return true;
            } else {
                return false;
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return false;
        } finally {
            Database.close(con);
        }
    }

    public static boolean deleteShares(int userid, String stockcode) {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement("delete from user_shares where userid = ? and stockcode = ?");
            ps.setInt(1,userid);
            ps.setString(2,stockcode);
            if (ps.executeUpdate() == 1) {
                return true;
            } else {
                return false;
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return false;
        } finally {
            Database.close(con);
        }
    }


}