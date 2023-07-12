<%-- 
    Document   : proses_edit
    Created on : Jul 12, 2023, 4:34:18 PM
    Author     : OPAM
--%>

<%@page import = "java.sql.*" %>

<%
    String kdPembayaran = request.getParameter("kdPembayaran");
    String Metode_Pembayaran = request.getParameter("Metode_Pembayaran");
    
    if (kdPembayaran != null) {
        Connection conn=null;
        PreparedStatement ps =null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/tiket-konser-summerfest","root","");
            
            String query = "UPDATE mtd_bayar SET kdPembayaran=?, Metode_Pembayaran=? WHERE kdPembayaran=?";
            ps =conn.prepareStatement(query);
            ps.setInt(1, Integer.parseInt(kdPembayaran));
            ps.setString(2, Metode_Pembayaran);
            ps.setInt(3, Integer.parseInt(kdPembayaran));
            int i = ps.executeUpdate();
            
            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            response.sendRedirect("index.jsp");
        }
    }

    %>
