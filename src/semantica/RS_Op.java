package semantica;


public class RS_Op extends RS_Base{
    
    private String op;
    
    public RS_Op(String pOp){
        this.op = pOp;
        this.tipoRS = "op";   
    }
    
    public void setOp(String op) {
        this.op = op;
    }

    public String getOp() {
        return op;
    }

    public String getTipoRS() {
        return tipoRS;
    }
 
}
