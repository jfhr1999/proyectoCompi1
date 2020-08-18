package semantica;

public class RS_DO extends RS_Base {
    String valor;
    String nombre;
    String tipo;
    
    public RS_DO(String exp){
        this.valor = exp;
        this.tipoRS = "expresion";
        this.tipo = "";
    }
    
    public RS_DO(String pConst, String pTipo){
        this.valor = pConst;
        this.tipoRS = "constante";
        this.tipo = pTipo;
    }
    
    public RS_DO(String pDir, String pNombre, String pTipo){
        this.valor = pDir;
        this.nombre = pNombre;
        this.tipoRS = "direccion";
        this.tipo = pTipo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTipoRS() {
        return tipoRS;
    }

    public void setTipoRS(String tipoRS) {
        this.tipoRS = tipoRS;
    }
    
    
    
}
