<%-- 
    Document   : delete
    Created on : Jul 12, 2023, 4:25:54 PM
    Author     : OPAM
--%>

<%@page import="java.sql.*"%>
<%
    String kdAdmin = request.getParameter("kdAdmin");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/tiket-konser-summerfest", "root", "");
        String query = "DELETE FROM admin WHERE kdAdmin=?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, Integer.parseInt(kdAdmin));
        int rowsDeleted = pstmt.executeUpdate();
        response.sendRedirect("index.jsp");

    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("index.jsp");
    }
%>

