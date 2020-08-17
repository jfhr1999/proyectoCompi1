package semantica;

public class RS_Funcion extends RS_Base{
    
    private String nombre;
    
    public RS_Funcion(String pNombre){
        this.nombre = pNombre;
        this.tipoRS = "funcion";     
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
}
