<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../styles.css"/>
        <title>Home Page</title>
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
                <td height="50px">
                   <%@include file="menu.jsp"%>
                </td>
            </tr>
            <tr>
                <td valign="top">
                  <div>
                  <h2>My Shares </h2>
                  <f:view>
                  <h:form>
                   <h:dataTable  value="#{Shares.myShares}"  var="shares"
                        border="1" rendered='#{Shares.myShares != null}' width="100%">
                    <h:column>
                        <f:facet name="header"> <f:verbatim>Company</f:verbatim>
                        </f:facet>
                        <h:outputText value="#{shares.company}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header"> <f:verbatim>No. of Shares</f:verbatim> </f:facet>
                        <h:outputText value="#{shares.noshares}"/>
                    </h:column>

                    <h:column>
                        <f:facet name="header"> <f:verbatim>Share Value</f:verbatim>
                        </f:facet>
                        <h:outputText value="#{shares.sharevalue}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header"> <f:verbatim>Net Value</f:verbatim>
                        </f:facet>
                        <h:outputText value="#{shares.netvalue}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header"> <f:verbatim>&nbsp;</f:verbatim> </f:facet>
                        <h:outputLink value="deleteshares.jsp">
                             <h:outputText value="Delete"/>
                             <f:param name="stockcode" value="#{shares.stockcode}"/>
                       </h:outputLink>
                       &nbsp;
                       <h:outputLink value="updateshares.jsp">
                             <h:outputText value="Update"/>
                             <f:param name="stockcode" value="#{shares.stockcode}"/>
                             <f:param name="noshares" value="#{shares.noshares}"/>
                       </h:outputLink>
                    </h:column>
                   </h:dataTable>
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
