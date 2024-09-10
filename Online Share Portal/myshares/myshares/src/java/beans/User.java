
package beans;

import dao.UserDAO;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

public class User {
    private int userid;
    private String email,pwd,pwd2, oldpwd;

    public String getOldpwd() {
        return oldpwd;
    }

    public void setOldpwd(String oldpwd) {
        this.oldpwd = oldpwd;
    }

    public String getPwd2() {
        return pwd2;
    }

    public void setPwd2(String pwd2) {
        this.pwd2 = pwd2;
    }
    private String message="";

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public User() {
    }

    public String login() {
         
       userid = UserDAO.login( email, pwd);
       if ( userid < 0 )
       {
           message = "Sorry! Invalid Login";
           return "login";
       }
       else {
           // put userid in session attribute
           // put email in session attribute
           HttpSession ses  = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
           ses.setAttribute("userid", userid);
           ses.setAttribute("email", email);
           return "home";
       }

    }

    public void  register(ActionEvent evt) {
       if (! pwd.equals(pwd2))
       {
             message = "Password do not match!";
             return;
       }
       boolean done =  UserDAO.register( email, pwd);
       if ( done )
       {
           message = "Registration is successful. Click <a href=login.jsp>here</a> to login.";
       }
       else
           message = "Sorry! Registration Failed!" ;
    }

     public void  changePassword(ActionEvent evt) {
       if (! pwd.equals(pwd2))
       {
             message = "Password do not match!";
             return;
       }
       boolean done =  UserDAO.changePassword(email, oldpwd, pwd);
       if ( done )
       {
           message = "Password has been changed successfully.";
       }
       else
         message = "Sorry! Could not change password!" ;
    }

    public void recoverPassword(ActionEvent evt) {
         // get password
        String password = UserDAO.getPassword(email);
        if ( password == null)
            message = "Sorry! Could not get password for the given email address";
        else {
            try {
            // send mail to user
            Properties props = System.getProperties();
            Session session = Session.getDefaultInstance(props, null);
            // construct the message
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress("admin@homepc.com"));
            msg.setRecipient(Message.RecipientType.TO,new InternetAddress(email));
            msg.setDataHandler(
                    new DataHandler(
                       new String("<html><body>Dear User,<p/>Use the following password to login. <p/>Password:" + password + "<p/>Webmaster,<br/>MyShares.com</body></html>"),
                       "text/html")
                    );
            msg.setSubject("Password Recovery");
            // send message
            Transport.send(msg);
            message = "Password is sent to your email address. Use that password to login!";
            }
            catch(Exception ex) {
                System.out.println(ex.getMessage());
                message = "Sorry! Could not send mail!";
            }
         }
    }
}
