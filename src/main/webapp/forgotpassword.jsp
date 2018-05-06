<%-- 
    Document   : forgotpassword
    Created on : Mar 30, 2018, 7:29:54 AM
    Author     : LAPTOP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="in.hyperon.dbhandler.DbHandler"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String user_id = "";
    Object obj = request.getParameter("fewfuiew");
    if (obj != null) {
        String sql1 = "select user_id from forget_password_table where forgotkey = ?";
        Connection conn= DbHandler.getInstance().getConnection();
        PreparedStatement pst1 = conn.prepareStatement(sql1);
        pst1.setString(1, obj.toString());
        ResultSet rs1 = pst1.executeQuery();
       
        if (rs1.next()) {
            user_id = rs1.getString("user_id");
        }
        rs1.close();
        pst1.close();
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password</title>
    </head>
    <body>
        <form action="UpdateNewPassword" method="post">
            <input type="hidden" name="userid" value="<%=user_id%>" />
            New Password : <input type="password" name="password" /><br/>
            Confirm Password : <input type="password" /><br/>
            <input type="submit" value="Submit" />

        </form>
    </body>
</html>
