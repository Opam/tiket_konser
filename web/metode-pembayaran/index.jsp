<%-- 
    Document   : index
    Created on : Jul 12, 2023, 4:22:09 PM
    Author     : OPAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>

<% Connection connection=null; //connect to database
    Statement statement=null;
    ResultSet rs=null;
    try {
        String connectionURL = "jdbc:mysql://localhost/tiket-konser-summerfest";
        String username="root";
        String password="";
        Class.forName("com.mysql.jdbc.Driver");
        connection=DriverManager.getConnection(connectionURL, username, password);
        
        statement=connection.createStatement();
        String query="SELECT * FROM `mtd_bayar`";
        rs=statement.executeQuery(query);
    %>
    
<!DOCTYPE html>
<html lang="en">
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Metode Pembayaran - Tiket Summerfest</title>
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
                  <a class="nav-link" href="#">Metode Pembayaran</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link active" href="../transaksi/index.jsp">Transaksi</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
        <section class="intro">
            <div class="bg-image h-100" style="background-color: #f5f7fa;">
              <div class="mask d-flex align-items-center h-100">
                <div class="container mt-5">
                    <div class="row justify-content-scenter">
                        <div class="col-12">
                            <h1 class="text-center">DATA METODE PEMBAYARAN</h1>
                        </div>
                    </div>
                    <div class="row mt-3"> 
                        <div class="col-4 mx-0">
                            <a href="tambah.jsp"><button type="button" class="btn btn-success">Tambah Data Metode Pembayaran</button></a>
                        </div>
                        <div class="col-4 mx-0">
                        </div>
                        <div class="col-4 mx-0">
                            <a href="ekspor.jsp" target="_blank"><button type="button" class="btn btn-info text-white">Download Data Pembayaran</button></a>
                        </div>
                    </div>
                  <div class="row justify-content-center mt-2">
                    <div class="col-12">
                      <div class="card">
                        <div class="card-body p-0">
                          <div class="table-responsive table-scroll" data-mdb-perfect-scrollbar="true" style="position: relative">
                            <table class="table table-striped mb-0">
                              <thead style="background-color: #002d72;">
                                <tr style="color: #FFF">
                                  <th scope="col">kd Pembayaran</th>
                                  <th scope="col">Metode Pembayaran</th>
                                  <th scope="col">Aksi</th>
                                </tr>
                              </thead>
                              <tbody>
                                  <% while (rs.next()){ %>
                                <tr>
                                    <td> <%out.println(rs.getInt("kdPembayaran"));%> </td>
                                    <td> <%out.println(rs.getString("Metode_Pembayaran"));%> </td>
                                    <td><a href="edit.jsp?kdPembayaran=<%out.println(rs.getInt("kdPembayaran"));%>"><button type="button" class="btn btn-warning">Edit</button></a> |  <a href="delete.jsp?kdPembayaran=<%out.println(rs.getInt("kdPembayaran"));%>"><button type="button" class="btn btn-danger">Delete</button></a></td>
                                </tr>
                                <% } %>
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>

    <script src="bootstrap-5.3.0-dist/js/bootstrap.min.js"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"
    ></script>
    <script
        src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"
    ></script>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
        integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
        crossorigin="anonymous"
    ></script>
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
    </body>
</html>

    
<%
        rs.close();
        statement.close();
        connection.close();
    
    } catch (Exception e) {
        System.err.println("GAGAL KONEKSI"+e.getMessage());
        out.println("GAGAL"+e.getMessage());
    }
    %>