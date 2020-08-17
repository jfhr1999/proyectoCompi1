package semantica;

public class RS_DO extends RS_Base {
    String valor;
    String nombre;
    
    public RS_DO(String pConst){
        this.valor = pConst;
        this.tipoRS = "constante";
    }
    
    public RS_DO(String pDir, String pNombre){
        this.valor = pDir;
        this.nombre = pNombre;
        this.tipoRS = "direccion";
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
