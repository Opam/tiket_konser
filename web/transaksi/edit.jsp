<%-- 
    Document   : edit
    Created on : Jul 13, 2023, 4:12:11 AM
    Author     : muham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Edit Data Transaksi - Tiket Summerfest</title>
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
    <h1>Edit Data Transaksi</h1>

    <%@page import ="java.sql.*"%>
    <% 
        String kdTransaksi = request.getParameter("kdTransaksi");
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
            String query="SELECT * FROM transaksi WHERE kdTransaksi='"+kdTransaksi+"'";
            rs = statement.executeQuery(query);
            while (rs.next()) {
    %>

    <form method="post" action="proses_edit.jsp?kdTransaksi=<%= kdTransaksi %>">
        Kode Transaksi <br> <input type="text" name="kdTransaksi" value="<%=rs.getString("kdTransaksi")%>"><br>
        Nama Peserta <br><input type="text" name="Nama_Peserta" value="<%=rs.getString("Nama_Peserta")%>"><br>
        Admin <br>
        <select name="admin">
            <% 
            Connection adminConn = null;
            Statement adminStatement = null;
            ResultSet adminRs = null;
            try {
                String adminQuery = "SELECT * FROM admin";
                adminConn = DriverManager.getConnection(connectionURL, username, password);
                adminStatement = adminConn.createStatement();
                adminRs = adminStatement.executeQuery(adminQuery);
                while (adminRs.next()) {
                    String adminKdAdmin = adminRs.getString("kdAdmin");
                    String adminNamaAdmin = adminRs.getString("Nama_Admin");
            %>
                    <option value="<%=adminKdAdmin%>" <%= (adminKdAdmin.equals(rs.getString("admin"))) ? "selected" : "" %>><%=adminNamaAdmin%></option>
            <% 
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (adminRs != null) adminRs.close();
                if (adminStatement != null) adminStatement.close();
                if (adminConn != null) adminConn.close();
            }
            %>
        </select><br>
        Kode Tiket <br> <input type="text" name="kdTiket" value="<%=rs.getInt("kdTiket")%>"><br>
        Kode Pembayaran <br> <input type="text" name="kdPembayaran" value="<%=rs.getInt("kdPembayaran")%>"><br>
        Uang Bayar <br> <input type="text" name="Uang_Bayar" value="<%=rs.getInt("Uang_Bayar")%>"><br>
        Kembalian <br> <input type="text" name="Kembalian" value="<%=rs.getInt("Kembalian")%>"><br><br> 
        <input type="submit" value="Update">
    </form>

    <%
        }
        rs.close();
        statement.close();
        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    %>
</body>
</html>

