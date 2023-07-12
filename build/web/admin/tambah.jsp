<%-- 
    Document   : tambah
    Created on : Jul 12, 2023, 4:34:48 PM
    Author     : OPAM
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tambah Admin - Tiket Summerfest</title>
</head>

<body>
    <h1>Tambah Data Admin</h1>
    <form action="" method="POST">
        <label>Kode Admin</label> <br> <input type="text" name="kdAdmin" /> <br />
        <label>Nama Admin</label> <br> <input type="text" name="Nama_Admin" /> <br />
        <label>Nomor Telepon</label> <br> <input type="text" name="No_Telp" /> <br /><br />
        <input type="submit" name="submit" value="Simpan" /><br />
        <a href="index.jsp">Kembali</a>
    </form>
</body>

</html>

<%@page import ="java.sql.*"%>
<%@page import ="javax.swing.*"%>
<%
    //Panggil hasil inputan di form
    String kdAdmin=request.getParameter("kdAdmin");
    String Nama_Admin=request.getParameter("Nama_Admin");
    String No_Telp =request.getParameter("No_Telp");
    String URL = "jdbc:mysql://localhost/tiket-konser-summerfest";
    //Koneksi database
    Connection conn = null;
    PreparedStatement ps = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    int updateQuery=0;
    //Notifikasi bahwa seluruh form tidak boleh kosong
    if (kdAdmin!=null && Nama_Admin!=null && No_Telp!=null) {
        try {
            conn=DriverManager.getConnection(URL,"root","");
            String query = "INSERT INTO admin (kdAdmin, Nama_Admin, No_Telp) VALUES (?,?,?)";
            ps = conn.prepareStatement(query);
            ps.setString(1, kdAdmin);
            ps.setString(2, Nama_Admin);
            ps.setString(3, No_Telp);
            updateQuery=ps.executeUpdate();
            if(updateQuery!=0) {
                JOptionPane.showMessageDialog(null,"Berhasil Tambah Data Admin");
                response.sendRedirect("index.jsp");
            }
        } catch (Exception e) {
            response.sendRedirect("index.jsp");
        } finally {
            ps.close();
            conn.close();
        }
    }
%>
