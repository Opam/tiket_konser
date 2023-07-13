<%-- 
    Document   : delete
    Created on : Jul 12, 2023, 4:25:54 PM
    Author     : OPAM
--%>

<%@page import="java.sql.*"%>
<%
    String kdPembayaran = request.getParameter("kdPembayaran");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/tiket-konser-summerfest", "root", "");
        String query = "DELETE FROM mtd_bayar WHERE kdPembayaran=?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, Integer.parseInt(kdPembayaran));
        int rowsDeleted = pstmt.executeUpdate();
        response.sendRedirect("index.jsp");

    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("index.jsp");
    }
%>

