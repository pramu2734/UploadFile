<%@page import="control.koneksi"%>
<%@page import="java.sql.*"%>
<h1>Data Master Akun</h1>
<table border="0">
    <form action="AkunServlet" method="post" onsubmit="return validasi_inputAkun(this)">
        <input type="hidden" name="aksi" value="${param.aksi}"/>
        <tr>
            <td>Nomor Akun</td> <td>: <input type="text" name="no" value="${param.no_akun}"/> </td>
        </tr>
         <tr>
            <td>Nama Akun</td> <td>: <input type="text" name="nama" value="${param.nm_akun}"/> </td>
        </tr>
        <tr>
            <td><input type="submit" value="Simpan" class="button"/></td> <td> </td>
        </tr>
    </form>
    </td></tr></table><br>
    
    
    <form action="" method="post">
        Cari Data Akun : <input type="text" name="cari" value="${param.cari}"/>
        <input type="submit" value="Cari" class="button"/> <br>
    </form>
        <sql:query var="queryakun" dataSource="${dataSource}">
            SELECT * from akun where no_akun like '%${param.cari}%' or nm_akun like '%${param.cari}%'
        </sql:query>
        <br><table border="1" width="100%" cellpadding="0" cellspacing="0">
            <tr class="head">
                <td>Nomor Akun</td><td>Nama Akun</td><td>Action</td>
            </tr>
            <c:forEach var="rowakun" items="${queryakun.rowsByIndex}">
            <tr class="isi">
                <td valign='top'>${rowakun[0]}</td>
                <td valign='top'>${rowakun[1]}</td>
                <td valign='top'><a href='AkunServlet?aksi=HAPUS&no=${rowakun[0]}'> Hapus </a> | <a href='beranda.jsp?halaman=tampilakun&aksi=GANTI&no_akun=${rowakun[0]}&nm_akun=${rowakun[1]}'> Edit </a>
                </td>
            </tr>
            </c:forEach>
        </table>
