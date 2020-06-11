<%@ page import ="java.sql.*"%>
<%@page import ="control.koneksi"%>
<%-- Auto Number No Retur --%>
<%
    try {
        koneksi kon = new koneksi();
        Class.forName("com.mysql.jdbc.Driver");
        ResultSet noretur = null;
        noretur = kon.stmt.executeQuery("select max(right(no_retur,6)) as no FROM retur");
        while (noretur.next()) {
            if (noretur.first() == false) {
                out.println("<input type='hidden' name='no_retur' value='R000001' id='noret'/>");
            } else {
                noretur.last();
                int autonor = noretur.getInt(1) + 1;
                String nomorr = String.valueOf(autonor);
                int noLong = nomorr.length();
                
                for (int a = 1; a < 7 - noLong; a++) {
                    nomorr = "0" + nomorr;
                }
                String nomerr = "R" + nomorr;
                out.println("<input type='hidden' name='no_retur' id='noret' value='" + nomerr + "'/>");
            }
        }
    } catch (Exception e) {
        out.println(e);
    }
%>