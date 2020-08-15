package proyectoCompilador;

public abstract class Token{

    protected String nombre = ""; //Identifier
    protected String tipo = "";
    protected String subclase = "";
    protected String ambito = "";

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

    public String getTipo(){
        return tipo;
    }

    public void setAmbito(String pAmbito){
        ambito = pAmbito;
    }

    public String getAmbito(){
        return ambito;
    }

    public void setSubclase(String pSubclase){
        subclase = pSubclase;
    }

    public String getSubclase(){
        return subclase;
    }

    public String toString(){
        String res = "";
        res += "TOKEN/n"
        res += "Nombre: " + nombre + "/n";
        res += "Subclase: " + subclase + "/n";
        res += "Tipo: " + tipo + "/n";
        res += "Ambito: " + ambito + "/n";
    }

}