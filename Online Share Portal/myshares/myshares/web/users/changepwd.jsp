<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../styles.css"/>
        <title>Change Password</title>
    </head>
    <body>
        <table width="700px" height="600px" align="center"  bgcolor="white">
            <tr height="50px">
                <td height="50px">
                  <%@include file="../header.html"%>
                </td>
            </tr>
            <tr>
                <td height="50px">
                   <%@include file="menu.jsp"%>
                </td>
            </tr>
            <tr>
                <td valign="top">
                  <div>

                  <h2>Change Password </h2>

                  <%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

 <f:view>
        <h:form  id="changepwdform">
            <table>
                <tr>
                    <td>Old Password : </td>
                    <td><h:inputSecret id="oldpwd" value="#{User.oldpwd}"  required="true" />
                </tr>
                 <tr>
                    <td>New Password : </td>
                    <td><h:inputSecret id="pwd" value="#{User.pwd}"  required="true" />
                </tr>
                 <tr>
                    <td>Re-enter New Password : </td>
                    <td><h:inputSecret id="pwd2" value="#{User.pwd2}"  required="true" />
                </tr>
            </table>
            <p/>
            <h:commandButton actionListener="#{User.changePassword}" value="Change Password" />
            <p/>
            <h3><h:outputText value="#{User.message}"/> </h3>
        </h:form>
 </f:view>
                  </div>
                </td>
            </tr>
            <tr>
                <td height="30px">
                   <%@include file="../footer.html"%>
                </td>
            </tr>
        </table>
    </body>
</html>
