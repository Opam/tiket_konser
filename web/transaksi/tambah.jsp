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
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Tambah Transaksi - Tiket Summerfest</title>
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
        crossorigin="anonymous"
    />
    <link rel="stylesheet" href="../bootstrap-5.3.0-dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../style.css" />
    <link
        href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
        rel="stylesheet"
    />
</head>
<body>
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
          <div class="container">
            <a class="navbar-brand text-danger fw-bold" href="#">JKT48 Summerfest</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link" aria-current="page" href="#">Admin</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Tiket</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Metode Pembayaran</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link active" href="../transaksi/index.jsp">Transaksi</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
    <div class="container">
                        <div class="row justify-content-center">
                        <div class="col-12">
                            <h1 class="text-center mt-3">TAMBAH TRANSAKSI</h1>
                        </div> 
                    </div>
    <form action="" method="POST">
        <div class="mb-3">
            <label for="basic-url" class="form-label">Kode Transaksi</label>
            <input type="text" name="kdTransaksi" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
        </div>

        <div class="mb-3">
            <label for="basic-url" class="form-label">Nama Peserta</label>
            <input type="text" name="Nama_Peserta" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
        </div>
        
        <label for="basic-url" class="form-label">Nama Admin</label>
        <select name="admin" class="form-select form-select-lg">
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

        <label for="basic-url" class="form-label">Nama Tiket</label>
        <select id="tiket" name="tiket" class="form-select form-select-lg">
            <option>Jogja Tour VIP - 50K</option>
            <option>Solo Tour VIP - 50K</option>
            <option>Semarang Tour VIP - 50K</option>
        </select><br/>
        
        <label for="basic-url" class="form-label">Metode Pembayaran</label>
        <select id="mtd_bayar" name="mtd_bayar" class="form-select form-select-lg">
            <option>Link Aja</option>
            <option>ShopeePay</option>
            <option>DANA</option>
        </select><br/>
        
        <div class="mb-3">
            <label for="basic-url" class="form-label">Uang Bayar</label>
            <input type="text" name="Uang_Bayar" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
        </div>
        
        <div class="mb-3">
            <label for="basic-url" class="form-label">Kembalian</label>
            <input type="text" name="Kembalian" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
        </div>
        
        <div class="mb-3">
            <button type="submit" name="submit" value="Simpan"  class="btn btn-success">Simpan</button>
            <a href="index.jsp"><button type="button" class="btn btn-danger">Kembali</button></a>
        </div>
    </form>
    </div>
</body>
</html>

<%
    String kdTransaksi = request.getParameter("kdTransaksi");
    String Nama_Peserta = request.getParameter("Nama_Peserta");
    String admin = request.getParameter("admin");
    String tiket = request.getParameter("tiket");
    String mtd_bayar = request.getParameter("mtd_bayar");
    String Uang_Bayar = request.getParameter("Uang_Bayar");
    String Kembalian = request.getParameter("Kembalian");
    String URL = "jdbc:mysql://localhost/tiket-konser-summerfest";
    
    Connection conn = null;
    PreparedStatement ps = null;
    int updateQuery = 0;

    if (kdTransaksi != null && Nama_Peserta != null && admin != null && tiket != null && mtd_bayar != null && Uang_Bayar != null && Kembalian != null) {
        try {
            conn = DriverManager.getConnection(URL, "root", "");

            String query = "INSERT INTO transaksi (kdTransaksi, Nama_Peserta, admin, tiket, mtd_bayar, Uang_Bayar, Kembalian) VALUES (?,?,?,?,?,?,?)";
            ps = conn.prepareStatement(query);
            ps.setString(1, kdTransaksi);
            ps.setString(2, Nama_Peserta);
            ps.setString(3, admin);
            ps.setString(4, tiket);
            ps.setString(5, mtd_bayar);
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
