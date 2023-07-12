<%-- 
    Document   : proses_edit
    Created on : Jul 12, 2023, 4:34:18 PM
    Author     : OPAM
--%>

<%@page import = "java.sql.*" %>

<%
    String kdAdmin = request.getParameter("kdAdmin");
    String Nama_Admin = request.getParameter("Nama_Admin");
    String No_Telp = request.getParameter("No_Telp");
    
    if (kdAdmin != null) {
        Connection conn=null;
        PreparedStatement ps =null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/tiket-konser-summerfest","root","");
            
            String query = "UPDATE admin SET kdAdmin=?, Nama_Admin=?, No_Telp=? WHERE kdAdmin=?";
            ps =conn.prepareStatement(query);
            ps.setInt(1, Integer.parseInt(kdAdmin));
            ps.setString(2, Nama_Admin);
            ps.setString(3, No_Telp);
            ps.setInt(4, Integer.parseInt(kdAdmin));
            int i = ps.executeUpdate();
            
            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            response.sendRedirect("index.jsp");
        }
    }

    %>
