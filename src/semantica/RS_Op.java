package semantica;


public class RS_Op extends RS_Base{
    
    private String op;
    private String tipo;
    
    public RS_Op(String pOp, String pTipo){
        this.op = pOp;
        this.tipoRS = "op";
        this.tipo = pTipo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
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
