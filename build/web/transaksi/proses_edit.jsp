<%-- 
    Document   : proses_edit
    Created on : Jul 13, 2023, 4:12:30 AM
    Author     : muham
--%>

<%@page import="java.sql.*"%>

<%
    String kdTransaksi = request.getParameter("kdTransaksi");
    String Nama_Peserta = request.getParameter("Nama_Peserta");
    String admin = request.getParameter("admin");
    String kdTiket = request.getParameter("kdTiket");
    String kdPembayaran = request.getParameter("kdPembayaran");
    String Uang_Bayar = request.getParameter("Uang_Bayar");
    String Kembalian = request.getParameter("Kembalian");

    if (kdTransaksi != null) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/tiket-konser-summerfest","root","");
            
            String query = "UPDATE transaksi SET Nama_Peserta=?, admin=?, kdTiket=?, kdPembayaran=?, Uang_Bayar=?, Kembalian=? WHERE kdTransaksi=?";
            ps = conn.prepareStatement(query);
            ps.setString(1, Nama_Peserta);
            ps.setString(2, admin);
            ps.setString(3, kdTiket);
            ps.setString(4, kdPembayaran);
            ps.setString(5, Uang_Bayar);
            ps.setString(6, Kembalian);
            ps.setString(7, kdTransaksi);
            
            int i = ps.executeUpdate();

            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp");
        } finally {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }
    }
%>

