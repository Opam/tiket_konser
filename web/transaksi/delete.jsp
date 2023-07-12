<%-- 
    Document   : delete
    Created on : Jul 13, 2023, 4:12:03 AM
    Author     : muham
--%>

<%@page import="java.sql.*"%>
<%
    String kdTransaksi = request.getParameter("kdTransaksi");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/tiket-konser-summerfest", "root", "");
        String query = "DELETE FROM transaksi WHERE kdTransaksi=?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, Integer.parseInt(kdTransaksi));
        int rowsDeleted = pstmt.executeUpdate();
        response.sendRedirect("index.jsp");

    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("index.jsp");
    }
%>
