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
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Tambah Metode Pembayaran - Tiket Summerfest</title>
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
            <a class="navbar-brand text-danger fw-bold" href="../index.jsp">JKT48 Summerfest</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link" aria-current="page" href="../admin/index.jsp">Admin</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="../tiket/index.jsp">Tiket</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="../index.jsp">Metode Pembayaran</a>
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
                            <h1 class="text-center mt-3">TAMBAH DATA TIKET</h1>
                        </div> 
                    </div>
    <form action="" method="POST">
        <div class="mb-3">
            <label for="basic-url" class="form-label">Kode Tiket</label>
            <input type="text" name="kdTiket" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
        </div>

        <div class="mb-3">
            <label for="basic-url" class="form-label">Nama_Tiket</label>
            <input type="text" name="Nama_Tiket" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
        </div>
        
        <div class="mb-3">
            <label for="basic-url" class="form-label">Harga</label>
            <input type="text" name="Harga" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
        </div>
        
        <div class="mb-3">
            <button type="submit" name="submit" value="Simpan"  class="btn btn-success">Simpan</button>
            <a href="index.jsp"><button type="button" class="btn btn-danger">Kembali</button></a>
        </div>
    </form>
    </div>
</body>

</html>

<%@page import ="java.sql.*"%>
<%@page import ="javax.swing.*"%>
<%
    //Panggil hasil inputan di form
    String kdTiket=request.getParameter("kdTiket");
    String Nama_Tiket=request.getParameter("Nama_Tiket");
    String Harga=request.getParameter("Harga");
    String URL = "jdbc:mysql://localhost/tiket-konser-summerfest";
    //Koneksi database
    Connection conn = null;
    PreparedStatement ps = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    int updateQuery=0;
    //Notifikasi bahwa seluruh form tidak boleh kosong
    if (kdTiket!=null && Nama_Tiket!=null && Harga!=null) {
        try {
            conn=DriverManager.getConnection(URL,"root","");
            String query = "INSERT INTO tiket (kdTiket, Nama_Tiket, Harga) VALUES (?,?,?)";
            ps = conn.prepareStatement(query);
            ps.setString(1, kdTiket);
            ps.setString(2, Nama_Tiket);
            ps.setString(3, Harga);

            updateQuery=ps.executeUpdate();
            if(updateQuery!=0) {
                JOptionPane.showMessageDialog(null,"Berhasil Tambah Data Tiket");
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
