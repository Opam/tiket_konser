<%-- 
    Document   : edit
    Created on : Jul 12, 2023, 4:32:49 PM
    Author     : OPAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Edit Metode Pembayaran - Tiket Summerfest</title>
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
                  <a class="nav-link active" href="#">Metode Pembayaran</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="../transaksi/index.jsp">Transaksi</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12">
                    <h1 class="text-center mt-3">EDIT DATA METODE PEMBAYARAN</h1>
                </div> 
            </div>

    <%@page import ="java.sql.*"%>
    <% 
           
           String kdPembayaran = request.getParameter("kdPembayaran");
           Connection connection=null;
           Statement statement=null;
           ResultSet rs=null;
           try {
               String connectionURL = "jdbc:mysql://localhost/tiket-konser-summerfest";
               String username = "root";
               String password = "";
               Class.forName("com.mysql.jdbc.Driver");
               connection = DriverManager.getConnection(connectionURL, username, password);
               
               statement = connection.createStatement();
               String query="SELECT * FROM mtd_bayar WHERE kdPembayaran="+kdPembayaran+"";
               rs = statement.executeQuery(query);
               while (rs.next()) {
        %>

    <form action="" method="POST" action="proses_edit.jsp?kdPembayaran=<%= kdPembayaran %>">
        <div class="mb-3">
            <label for="basic-url" class="form-label">Kode Metode Pembayaran</label>
            <input type="text" name="kdPembayaran" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="<%out.println(rs.getInt("kdPembayaran"));%>">
        </div>

        <div class="mb-3">
            <label for="basic-url" class="form-label">Metode Pembayaran</label>
            <input type="text" name="Metode_Pembayaran" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="<%out.println(rs.getString("Metode_Pembayaran"));%>">
        </div>
        <div class="mb-3">
            <input type="submit" value="Update">
        </div>
    </form>
    <%
            }
            rs.close();
            statement.close();
            connection.close();
           } catch (Exception e) {
               System.err.println("GAGAL KONEKSI"+e.getMessage());
               out.println("GAGAL"+e.getMessage());
           }
        %>
    </div>
</body>

</html>