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
<a href="tambah.jsp">Tambah Data Admin</a><br />
<a href="ekspor.jsp">Download Data Admin</a><br/>
<table border="1">
    <tr>
        <th>kd Admin</th>
        <th>Nama Admin</th>
        <th>No Telp</th>
        <th>Aksi</th>
        
    </tr>
    <% while (rs.next()){ %>
    <tr>
        <td> <%out.println(rs.getInt("kdAdmin"));%> </td>
        <td> <%out.println(rs.getString("Nama_Admin"));%> </td>
        <td> <%out.println(rs.getString("No_Telp"));%> </td>
        <td><a href="edit.jsp?kdAdmin=<%out.println(rs.getInt("kdAdmin"));%>">Edit</a> |  <a href="delete.jsp?kdAdmin=<%out.println(rs.getInt("kdAdmin"));%>">Delete</a></td>
        
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