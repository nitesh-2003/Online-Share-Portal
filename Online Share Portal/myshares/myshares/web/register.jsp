<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../styles.css"/>
        <title>Registration</title>
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
                        <f:view>
                              <h2>Registration </h2>
                            <h:form  id="registerform">
                                <table>
                                    <tr>
                                        <td>Email Address : </td>
                                        <td><h:inputText id="email" value="#{User.email}"  required="true" />
                                    </tr>
                                    <tr>
                                        <td>Password : </td>
                                        <td><h:inputSecret id="pwd" value="#{User.pwd}"  required="true" />
                                    </tr>

                                    <tr>
                                        <td>Re-enter Password : </td>
                                        <td><h:inputSecret id="pwd2" value="#{User.pwd2}"  required="true" />
                                    </tr>
                                </table>
                                <p/>
                                <h:commandButton actionListener="#{User.register}" value="Register" />
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
