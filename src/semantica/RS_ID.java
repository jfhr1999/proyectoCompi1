package semantica;

public class RS_ID extends RS_Base{
    
    private String nombre;
    
    public RS_ID(String pNombre){
        this.nombre = pNombre;
        this.tipoRS = "id";     
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
}
