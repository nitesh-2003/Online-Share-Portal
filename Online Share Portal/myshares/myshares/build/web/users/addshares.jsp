<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../styles.css"/>
        <title>Add Shares</title>
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

                  <h2>Add Shares </h2>

                  <%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

 <f:view>
        <h:form  id="addshareform">
            <table>
                <tr>
                    <td>Select Company  : </td>
                    <td>
                  <h:selectOneMenu id="stockcode" value="#{Shares.stockcode}" >
                   <f:selectItems value="#{Shares.companies}"/>
                </h:selectOneMenu>
                    </td>
                </tr>
                 <tr>
                    <td>No. Of Shares :  </td>
                    <td><h:inputText  id="noshares" value="#{Shares.noshares}"  required="true" />
                </tr>
            </table>
            <p/>
            <h:commandButton actionListener="#{Shares.addShares}" value="Add Shares" />
            <p/>
            <h3><h:outputText value="#{Shares.message}"/> </h3>
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
