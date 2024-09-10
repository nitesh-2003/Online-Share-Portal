<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../styles.css"/>
        <title>Login Page</title>
    </head>
    <body>
        <%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
        <%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

        <table width="700px" height="600px" align="center"  bgcolor="white">
            <tr height="50px">
                <td height="50px">
                    <%@include file="/header.html"%>
                </td>
            </tr>
            <tr>
                <td valign="top" align="center">
                    <div>
                        <h2>Login </h2>
                        <f:view>
                            <h:form  id="loginform">
                                <table>
                                    <tr>
                                        <td>Email Address : </td>
                                        <td><h:inputText id="email" value="#{User.email}"  required="true" />
                                    </tr>
                                    <tr>
                                        <td>Password : </td>
                                        <td><h:inputSecret id="pwd" value="#{User.pwd}"  required="true" />
                                    </tr>
                                </table>
                                <p/>
                                <h:commandButton action="#{User.login}" value="Login" />
                                <p/>
                                <h3><h:outputText value="#{User.message}"/> </h3>
                                <p/>
                                <a href="register.jsp">Register </a>
                                <p/>
                                <a href="forgotpassword.jsp">Forgot Password?</a>
                            </h:form>
                        </f:view>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="30px">
                    <%@include file="/footer.html"%>
                </td>
            </tr>
        </table>
    </body>
</html>


</body>
</html>
