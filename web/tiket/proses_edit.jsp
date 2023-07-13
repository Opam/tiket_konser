<%-- 
    Document   : proses_edit
    Created on : Jul 12, 2023, 4:34:18 PM
    Author     : OPAM
--%>

<%@page import = "java.sql.*" %>

<%
    String kdTiket = request.getParameter("kdTiket");
    String Nama_Tiket = request.getParameter("Nama_Tiket");
    String Harga = request.getParameter("Harga");
    
    if (kdTiket != null) {
        Connection conn=null;
        PreparedStatement ps =null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/tiket-konser-summerfest","root","");
            
            String query = "UPDATE tiket SET kdTiket=?, Nama_Tiket=?, Harga=? WHERE kdTiket=?";
            ps =conn.prepareStatement(query);
            ps.setInt(1, Integer.parseInt(kdTiket));
            ps.setString(2, Nama_Tiket);
            ps.setString(3, Harga);
            ps.setInt(4, Integer.parseInt(kdTiket));
            int i = ps.executeUpdate();
            
            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            response.sendRedirect("index.jsp");
        }
    }

    %>
