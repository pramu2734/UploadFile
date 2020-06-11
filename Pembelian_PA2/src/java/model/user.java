package model;

public class user {
   String iduser,namauser,hakakses,pass;
    
   public user(String iduser, String namauser, String hakakses, String pass) { 
       this.iduser = iduser;  
       this.namauser = namauser;
       this.hakakses = hakakses;
       this.pass = pass;
   }
   
    public String getIduser() {
        return iduser;
    }
    
    public void setIduser(String iduser) {
        this.iduser = iduser;
    }
    
    public String getNamauser() {
        return namauser;
    }
    
    public void setNamauser(String namauser) {
        this.namauser = namauser;
    }
    
    public String getHakakses() {
        return hakakses;
    }
    
    public void setHakakses(String hakakses) {
        this.hakakses = hakakses;
    }
    
    public String getPass() {
        return pass;
    }
    
    public void setPass(String pass) {
        this.pass = pass;
    }
    
    public String selectAll() {
        String sql = "select * from user";
        return sql;
    }
    public String select() {
        String sql = "select * from user where " 
                + "nm_user='"+namauser+"'";
        return sql;
    }
    
    public String toUpdate() {
        return " UPDATE user SET " + 
                "nm_user='" + namauser + 
                "', hakakses='" + hakakses +
                "', pass='" + pass + 
                "'WHERE id_user='" + iduser + "'";
    }
    
    public String toDelete() {
        return " DELETE FROM user " 
                + " WHERE id_user='" + iduser + "'";
    }
    
    public String toInsert() {
        return " INSERT INTO user VALUES ('"
                + iduser + "','" 
                + namauser +"','" 
                + hakakses + "','" 
                + pass + "')";
    }
    
}