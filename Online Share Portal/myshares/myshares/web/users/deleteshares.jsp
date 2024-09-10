<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../styles.css"/>
        <title>Delete Shares</title>
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

                  <h2>Delete Shares</h2>
                  <%
                   if ( request.getParameter("stockcode")!= null ) {

                       String stockcode = request.getParameter("stockcode");
                       beans.User u = (beans.User) session.getAttribute("User");
                       int userid = u.getUserid();
                       if ( dao.SharesDAO.deleteShares(userid,stockcode))
                           out.println("Shares were deleted successfully!");
                       else
                           out.println("Shares were NOT deleted due to error!");
                   }
                  %>

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


