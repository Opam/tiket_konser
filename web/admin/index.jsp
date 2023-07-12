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
        String query="SELECT * FROM `admin`";
        rs=statement.executeQuery(query);
    %>
    
<!DOCTYPE html>
<html lang="en">
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Tiket Summerfest</title>
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
        crossorigin="anonymous"
    />
    <link rel="stylesheet" href="bootstrap-5.3.0-dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="style.css" />
    <link
        href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
        rel="stylesheet"
    />
    </head>

    <body>
        <section class="intro">
            <div class="bg-image h-100" style="background-color: #f5f7fa;">
              <div class="mask d-flex align-items-center h-100">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <h1 class="text-center">DATA ADMIN</h1>
                        </div>
                    </div>
                    <div class="row"> 
                        <div class="col-4">
                        </div>
                        <div class="col-4">
                            <a href="tambah.jsp"><button type="button" class="btn btn-success">Tambah Data Admin</button></a>
                        </div>
                        <div class="col-4">
                            <a href="ekspor.jsp"><button type="button" class="btn btn-info">Download Data Admin</button></a>
                        </div>
                    </div>
                  <div class="row justify-content-center">
                    <div class="col-12">
                      <div class="card">
                        <div class="card-body p-0">
                          <div class="table-responsive table-scroll" data-mdb-perfect-scrollbar="true" style="position: relative">
                            <table class="table table-striped mb-0">
                              <thead style="background-color: #002d72;">
                                <tr style="color: #FFF">
                                  <th scope="col">kd Admin</th>
                                  <th scope="col">Nama Admin</th>
                                  <th scope="col">No Telp</th>
                                  <th scope="col">Aksi</th>
                                </tr>
                              </thead>
                              <tbody>
                                  <% while (rs.next()){ %>
                                <tr>
                                    <td> <%out.println(rs.getInt("kdAdmin"));%> </td>
                                    <td> <%out.println(rs.getString("Nama_Admin"));%> </td>
                                    <td> <%out.println(rs.getString("No_Telp"));%> </td>
                                    <td><a href="edit.jsp?kdAdmin=<%out.println(rs.getInt("kdAdmin"));%>"><button type="button" class="btn btn-warning">Edit</button></a> |  <a href="delete.jsp?kdAdmin=<%out.println(rs.getInt("kdAdmin"));%>"><button type="button" class="btn btn-danger">Delete</button></a></td>
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