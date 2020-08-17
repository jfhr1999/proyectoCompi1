package proyectoCompilador;

public class Token{

    protected String nombre = ""; //Identifier
    protected String tipo = "";
    protected String subclase = "";
    protected String alcance;

    public Token(){
    }

    public void setNombre(String pNombre){
        nombre = pNombre;
    }

    public String getNombre(){
        return nombre;
    }

    public void setTipo(String pTipo){
        tipo = pTipo;
    }
    
    public String getAlcance() {
        return alcance;
    }

    public void setAlcance(String alcance) {
        this.alcance = alcance;
    }

    public String getTipo(){
        return tipo;
    }

    public void setSubclase(String pSubclase){
        subclase = pSubclase;
    }

    public String getSubclase(){
        return subclase;
    }

    public String toString(){
        String res = "";
        res += "TOKEN\n";
        res += "Nombre: " + nombre + "\n";
        res += "Subclase: " + subclase + "\n";
        res += "Tipo: " + tipo + "\n";
        return res;
    }
}