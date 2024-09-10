/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Administrator
 */
public class UserDAO {

    public static boolean register(String email, String pwd) {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement("insert into users values(userid_seq.nextval,?,?)");
            ps.setString(1, email);
            ps.setString(2, pwd);
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
    public static int login(String email, String pwd) {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement("select * from users where email = ? and pwd = ?");
            ps.setString(1, email);
            ps.setString(2, pwd);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) // found
            {
                return  rs.getInt("userid");
            } else {
                return -1;
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return -1;
        } finally {
            Database.close(con);
        }
    }

    public static boolean changePassword(String email, String oldpwd, String newpwd) {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement("update users set pwd = ? where email = ? and pwd = ?");
            ps.setString(1, newpwd);
            ps.setString(2, email);
            ps.setString(3, oldpwd);
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

    public static String getPassword(String email) {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement("select pwd from users where email = ?");
            ps.setString(1,email);
            ResultSet rs = ps.executeQuery();
            if ( rs.next())
                return  rs.getString(1);
            else
                return null;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return null;
        } finally {
            Database.close(con);
        }
    }
}
