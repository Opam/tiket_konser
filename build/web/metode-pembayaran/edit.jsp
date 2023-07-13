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
    <title>Edit Data</title>
</head>

<body>
    <h1>Edit Admin - Tiket Summerfest</h1>

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

    <form method="post" action="proses_edit.jsp?kdPembayaran=<%= kdPembayaran %>">
        kdPembayaran <br> <input type="text" name="kdPembayaran" value="<%out.println(rs.getInt("kdPembayaran"));%>"><br>
        Metode_Pembayaran <br><input type="text" name="Metode_Pembayaran" value="<%out.println(rs.getString("Metode_Pembayaran"));%>"><br>
        <input type="submit" value="Update">
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
</body>

</html>