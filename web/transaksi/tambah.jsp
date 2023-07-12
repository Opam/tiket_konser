<%-- 
    Document   : tambah
    Created on : Jul 13, 2023, 2:01:29 AM
    Author     : muham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*"%>
<%@page import ="javax.swing.*"%>
<%@page import="javax.swing.JOptionPane"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tambah Transaksi</title>
</head>
<body>
    <h1>Tambah Transaksi</h1>
    <form action="" method="POST">
        <label>Kode Transaksi</label><br>
        <input type="text" name="kdTransaksi" /><br />

        <label>Nama Peserta</label><br>
        <input type="text" name="Nama_Peserta" /><br />

        <label>Admin</label><br>
        <select name="admin">
            <% 
            Connection connection = null;
            Statement statement = null;
            ResultSet rs = null;
            try {
                String connectionURL = "jdbc:mysql://localhost/tiket-konser-summerfest";
                String username = "root";
                String password = "";
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(connectionURL, username, password);

                statement = connection.createStatement();
                String query = "SELECT * FROM admin";
                rs = statement.executeQuery(query);

                while (rs.next()) {
                    String kdAdmin = rs.getString("kdAdmin");
                    String Nama_Admin = rs.getString("Nama_Admin");
                    %>
                    <option value="<%=kdAdmin%>"><%=Nama_Admin%></option>
                    <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            }
            %>
        </select><br />

        <label>Kode Tiket</label><br>
        <input type="text" name="kdTiket" /><br />

        <label>Kode Pembayaran</label><br>
        <input type="text" name="kdPembayaran" /><br />

        <label>Uang Bayar</label><br>
        <input type="text" name="Uang_Bayar" /><br />

        <label>Kembalian</label><br>
        <input type="text" name="Kembalian" /><br /><br />

        <input type="submit" name="submit" value="Simpan" /><br />
        <a href="index.jsp">Kembali</a>
    </form>
</body>
</html>

<%
    String kdTransaksi = request.getParameter("kdTransaksi");
    String Nama_Peserta = request.getParameter("Nama_Peserta");
    String admin = request.getParameter("admin");
    String kdTiket = request.getParameter("kdTiket");
    String kdPembayaran = request.getParameter("kdPembayaran");
    String Uang_Bayar = request.getParameter("Uang_Bayar");
    String Kembalian = request.getParameter("Kembalian");
    String URL = "jdbc:mysql://localhost/tiket-konser-summerfest";
    
    Connection conn = null;
    PreparedStatement ps = null;
    int updateQuery = 0;

    if (kdTransaksi != null && Nama_Peserta != null && admin != null && kdTiket != null && kdPembayaran != null && Uang_Bayar != null && Kembalian != null) {
        try {
            conn = DriverManager.getConnection(URL, "root", "");

            String query = "INSERT INTO transaksi (kdTransaksi, Nama_Peserta, admin, kdTiket, kdPembayaran, Uang_Bayar, Kembalian) VALUES (?,?,?,?,?,?,?)";
            ps = conn.prepareStatement(query);
            ps.setString(1, kdTransaksi);
            ps.setString(2, Nama_Peserta);
            ps.setString(3, admin);
            ps.setString(4, kdTiket);
            ps.setString(5, kdPembayaran);
            ps.setString(6, Uang_Bayar);
            ps.setString(7, Kembalian);

            updateQuery = ps.executeUpdate();
            if (updateQuery != 0) {
                JOptionPane.showMessageDialog(null, "Berhasil Tambah Data Transaksi");
                response.sendRedirect("index.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp");
        } finally {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }
    }
%>
