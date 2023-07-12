<%-- 
    Document   : ekspor
    Created on : Jul 12, 2023, 4:33:28 PM
    Author     : OPAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Data Mahasiswa</title>
    </head>
    <body>
        <%@page import ="java.sql.*"%>
        <%@page import ="java.io.*"%>
        
        <% Connection connection=null;
           Statement statement=null;
           ResultSet rs=null;
           try {
               String connectionURL = "jdbc:mysql://localhost/uas_web1";
               String username = "root";
               String password = "";
               Class.forName("com.mysql.jdbc.Driver");
               connection = DriverManager.getConnection(connectionURL, username, password);
               
               statement = connection.createStatement();
               String query="SELECT * FROM `mahasiswa`";
               rs = statement.executeQuery(query);
               
               String exportToExcel = request.getParameter("exportToExcel");
               if (exportToExcel != null && exportToExcel.toString().equalsIgnoreCase("YES")) {
                    response.setContentType("application/vnd.ms-excel");
                    response.setHeader("Content-Disposition", "inline; filename="+ "data.xls");
                }
        %>
        <table border="1">
            <tr>
                <th>NIM Mahasiswa</th>
                <th>Nama Mahasiswa</th>
                <th>Jenis Kelamin</th>
                <th>Agama</th>
                <th>Alamat</th>
                <th>Nomor Telepon</th>
            </tr>
            <% while (rs.next()) { %>
            <tr>
                <td> <%out.println(rs.getInt("nimMhs"));%> </td>
                <td> <%out.println(rs.getString("Nama"));%> </td>
                <td> <%out.println(rs.getString("Jenis_kelamin"));%> </td>
                <td> <%out.println(rs.getString("Agama"));%> </td>
                <td> <%out.println(rs.getString("Alamat"));%> </td>
                <td> <%out.println(rs.getString("Telp"));%> </td>
            </tr> 
            <% } %>
        </table>
        <%
            rs.close();
            statement.close();
            connection.close();
           } catch (Exception e) {
               System.err.println("GAGAL KONEKSI"+e.getMessage());
               out.println("GAGAL"+e.getMessage());
           }
        %>
    </body>
</html>
