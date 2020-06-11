<%@page import="java.sql.ResultSet"%>
<%@page import="control.koneksi"%>
<%@page import="model.barang,model.supplier,model.pemesanan"%>
<%@page import="java.util.Date"%>
<%@include file="config/autokode.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% java.util.Date waktu = new java.util.Date();
    int tanggal = waktu.getDate();
    int tahun = waktu.getYear() + 1900;
    int bulan = waktu.getMonth() + 1;
    String tgl = tahun + "-" + bulan + "-" + tanggal;
    pemesanan pemesanan = new pemesanan();
    barang barang = new barang();
    supplier supplier = new supplier();
    koneksi kon = new koneksi();
    ResultSet rs = null;
    ResultSet qrybarang = null;
    ResultSet qrypemesanan = null;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transaksi Pemesanan</title>
    </head>
    <body>
    <sql:query var="ttl" dataSource="${dataSource}">
    SELECT SUM(quantity) AS ttl_D,
    SUM(subtotal) AS ttl_K FROM sementara
    </sql:query>
    <h1>Transaksi Pemesanan Barang</h1></br>
    <table border="0">
        <form action="ServletPemesanan" method="post">
            <h2>Data Pemesanan</h2>
            <tr>
                <td>No Pesan</td>       <td>: <input type="text" name="no_pesan" id="nopesan" value=""
                readonly="readonly"/>
                <input type="button" onclick="pesan()" value="Add No Pesan" class="button"></td>
            </tr>
            <tr>
                <td>Tanggal Pesan</td>  <td>: <input type="text" name="tanggal" value=<%= tgl%> readonly="readonly"></td>
            </tr>
            <tr>
                <td>Barang</td>         <td>: <select name="kode" onchange="showEmp(this.value);">
                        <option value="-1">Pilih Barang</option>
                        <%
                            rs = kon.stmt.executeQuery("SELECT * from barang ");
                            while (rs.next()) {
                                barang.setKodebarang(rs.getString("kd_brg"));
                                barang.setNamabarang(rs.getString("nm_brg"));
                        %>
                        <option value="<%=barang.getKodebarang()%>"><%=barang.getKodebarang()%>
                        || <%=barang.getNamabarang()%></option>
                        <%  } %>
                    </select></td>
            </tr>
            <input type="hidden" name="emp_id" id="emp_id" value="">
            <tr>
                <td>Harga Barang</td>   <td>: <input type="text" name="harga" id="ename" value=""
                readonly="readonly" onkeyup="sumPesan();"></td>
            </tr>
            <tr>
                <td>Jumlah Pesan</td>   <td>: <input type="text" name="jml" id="jml" onkeyup="sumPesan();"></td>
            </tr>
            <tr>
                <td>Subtotal</td>       <td>: <input type="text" name="sub" id="subtotal" readonly="readonly"></td>
            </tr>
            <tr>
                <td><input type="submit" value="TAMBAH" name="aksi1"></td>
            </tr>
    </table>
    <h2>Data Supplier</h2>
    Supplier    <select name="supplier">
        <option value="-1">Pilih Supplier</option>
        <%
            rs = kon.stmt.executeQuery("SELECT * from supplier ");
            while (rs.next()) {
                supplier.setKodesupp(rs.getString("kd_supp"));
                supplier.setNamasupp(rs.getString("nm_supp"));
        %>
        <option value="<%=supplier.getKodesupp()%>"><%=supplier.getNamasupp()%></option>
        <%  } %>
    </select><br><br>
    
    <table width="535" border="1" align="center">
        <tr align="center">
            <td colspan="5"><h3>Data Untuk Dipesan</h3></td>
        </tr>
        <tr>
            <th>Kode Barang</th>
            <th>Quantity</th>
            <th>Subtotal</th>
            <th>AKSI</th>
        </tr>
        <%
            rs = kon.stmt.executeQuery("SELECT * from sementara");
            while (rs.next()) {
                out.println("<tr class=isi>"
                        + "<td>" + rs.getString(2) + "</td>"
                        + "<td>" + rs.getString(3) + "</td>"
                        + "<td>" + rs.getString(4) + "</td>"
                        + "<td><a href=ServletPemesanan?aksi2=HAPUS&kode=" + rs.getString(2) + ">Hapus</a></td>"
                        + "</tr>");
            }
        %>
    </table>
    <c:forEach var='ttlDK'items='${ttl.rowsByIndex}'><br>
        <table border="0">
            <tr><td>Total Jumlah Barang Dipesan</td> <td>:
                    <input type="text" readonly="readonly" name="totjum" size="1" value="${ttlDK[0]}"></td></tr>
            <tr><td>Total Bayar</td>    <td>:
                    <input type="text" readonly="readonly" name="tobay" value="${ttlDK[1]}"></td></tr>
    </c:forEach>
    <%kon.close();%>
            <tr><td><input type="submit" value="PROSES" name="aksi3"> <input type="reset" value="CANCEL"></td></tr>
        </table>
    </form>
    </body>
</html>
    