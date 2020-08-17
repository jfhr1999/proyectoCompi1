package semantica;

public class RS_Tipo extends RS_Base{
    
    private String tipo;
    
    public RS_Tipo(String pTipo){
        this.tipo = pTipo;
        this.tipoRS = "tipo";
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getTipoRS() {
        return tipoRS;
    }
   
    
}
