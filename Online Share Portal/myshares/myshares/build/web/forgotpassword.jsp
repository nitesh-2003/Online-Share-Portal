<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../styles.css"/>
        <title>Forgot Password</title>
    </head>
    <body>
        <%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
        <%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

        <table width="700px" height="600px" align="center"  bgcolor="white">
            <tr height="50px">
                <td height="50px">
                    <%@include file="../header.html"%>
                </td>
            </tr>
            <tr>
                <td valign="top" align="center">
                    <div>
                        <h2>Forgot Password </h2>
                        <f:view>
                            <h:form  id="forgotpwdform">
                               Email Address :
                                    <h:inputText id="email" value="#{User.email}"  required="true" />
                                <p/>
                                <h:commandButton actionListener="#{User.recoverPassword}" value="Submit" />
                                <p/>
                                <h3><h:outputText value="#{User.message}" escape="false"  /> </h3>
                                <p/>
                                <a href="login.jsp">Login </a>
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
