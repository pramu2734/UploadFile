package control;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.retur;
import java.sql.*;


public class ServletRetur extends pesan {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            retur retur = new retur();
            PreparedStatement pstmt = null;
            PreparedStatement pstmt1 = null;
            PreparedStatement pstmt2 = null;
            koneksi kon = new koneksi();
            int result = 0;
            int result1 = 0;
            int result2 = 0;
            String res;
            String aksi = request.getParameter("aksi");
            String noretur=request.getParameter("no_retur");
            String tglretur=request.getParameter("tanggal");
            String kdsupplier=request.getParameter("supplier");
            String kdbarang=request.getParameter("kode");
            String total=request.getParameter("toret");
            String qty=request.getParameter("jml");
            String subtotal=request.getParameter("sub");
            String aksi1 = request.getParameter("aksi1");
            String aksi2 = request.getParameter("aksi2");
            String aksi3 = request.getParameter("aksi3");
            retur var = new retur(noretur,tglretur,kdsupplier,kdbarang,total,qty,subtotal);
            String URL = "beranda.jsp?halaman=retur&aksi=SIMPAN";
            if(aksi1 != null){
                out.print(super.proses2(var.toInsert(), URL, "TAMBAH"));
            } else if (aksi2 != null){
                out.print(super.proses2(var.toDelete(), URL, "HAPUS"));
            } else if (aksi3 != null){
                retur.setNoretur(request.getParameter("no_retur"));
                retur.setTglretur(request.getParameter("tanggal"));
                retur.setKdsupplier(request.getParameter("supplier"));
                retur.setTotal(request.getParameter("toret"));
            pstmt=kon.conn.prepareStatement("INSERT detail_retur SELECT '"+retur.getNoretur()+"',"
                + "kode,quantity,subtotal FROM sementara2");
            result=pstmt.executeUpdate();
            pstmt1 = kon.conn.prepareStatement("INSERT INTO retur values('" + retur.getNoretur() + "','"
                + retur.getTglretur() + "','"
                + retur.getTotal() + "','"
                + retur.getKdsupplier() + "')");
    result1 = pstmt1.executeUpdate();
    pstmt2=kon.conn.prepareStatement("TRUNCATE TABLE sementara2");
    result2=pstmt2.executeUpdate();
        if (result +result1 + result2 > 0) {
            out.println("<script>"
                + "alert('Data telah disimpan');"
                + "document.location='beranda.jsp?hal=retur';"
                + " </script>");
        }
            }
            
        } catch (ClassNotFoundException ex) {
                Logger.getLogger(BarangServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
                Logger.getLogger(BarangServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
                out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
