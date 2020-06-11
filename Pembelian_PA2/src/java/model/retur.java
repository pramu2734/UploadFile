package model;

public class retur {
    
   private String noretur,tglretur,kdsupplier,kdbarang,total,qty,subtotal;
   
   public retur() {
   }
   
   public retur(String noretur, String tglretur, String kdsupplier,
           String kdbarang, String total,
           String qty, String subtotal) {
       this.noretur = noretur;
       this.tglretur = tglretur;
       this.kdsupplier = kdsupplier;
       this.kdbarang = kdbarang;
       this.total = total;
       this.qty = qty;
       this.subtotal = subtotal;
   }

    public String getNoretur() {
        return noretur;
    }

    public void setNoretur(String noretur) {
        this.noretur = noretur;
    }
    public String getTglretur() {
        return tglretur;
    }
    public void setTglretur(String tglretur) {
        this.tglretur = tglretur;
    }
    public String getTotal(){
        return total;
    }
    public void setTotal(String total) {
        this.total = total;
    }
    public String getKdsupplier() {
        return kdsupplier;
    }
    public void setKdsupplier(String kdsupplier) {
        this.kdsupplier = kdsupplier;
    }
    public String getKdbarang() {
        return kdbarang;
    }
    public void setKdbarang(String kdbarang) {
        this.kdbarang = kdbarang;
    }
    public String getQty() {
        return qty;
    }
    public void setQty(String qty) {
        this.qty = qty;
    }
    public String getSubtotal() {
        return subtotal;
    }
    public void setSubtotal (String subtotal) {
        this.subtotal = subtotal;
    }
    
    public String selectAll(){
        String sql = "select * from retur";
        return sql;
    }
    
    public String select(){
        String sql = "select * from retur where "
                + "no_retur='"+noretur+"'";
        return sql;
    }
    
    public String toDelete() {
        return "DELETE FROM sementara2 "
                + " WHERE kode='" + kdbarang + "'";
    }
    
    public String toInsert() {
        return "INSERT INTO sementara2 VALUES('"
                + noretur + "','"
                + kdbarang + "','"
                + qty + "','"
                + subtotal + "')";
    }

    public boolean proses2(String toInsert, String URL, String tambah) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
