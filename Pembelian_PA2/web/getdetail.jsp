<%@page import="java.sql.*"%>
<%@page import="control.koneksi"%>
<%@page import="model.barang"%>
<%
    barang barang = new barang();
    koneksi kon = new koneksi(); //--koneksi database--
    ResultSet rs = null;
    String emp_id = request.getParameter("emp_id").toString();
    String data = null;
    Statement st;
    rs = kon.stmt.executeQuery("SELECT * from pemesanan where no_pesan='" + emp_id + "' ");
    while (rs.next()) {
        data = ":" + rs.getString(3) + ":" + emp_id;
    }
    out.println(data);
%>