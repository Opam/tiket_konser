<%-- 
    Document   : delete
    Created on : Jul 12, 2023, 4:25:54 PM
    Author     : OPAM
--%>

<%@page import = "java.sql.*"%>
<%
    String kdAdmin=request.getParameter("kdAdmin");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/konser-tiket-summerfest","root","");
        Statement st=conn.createStatement();
        int i=st.executeUpdate("DELETE FROM admin WHERE kdAdmin="+kdAdmin+"");
        response.sendRedirect("index.jsp");
        
    } catch (Exception e) {
        response.sendRedirect("index.jsp");
        
    }


%>
