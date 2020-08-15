package proyectoCompilador;

public class TokenFuncion extends Token{
    
    protected int cantParams = 0; //No se necesita para comparar, pero se va a imprimir en la tabla?

    public TokenFuncion(){
        subclase = "funcion";
    }

    public void setCantParams(int pCant){
        cantParams = pCant;
    }

    public int getCantParams(){
        return cantParams;
    }

    public String toString(){
        res = "";
        res += super.toString();
        res += "Cantidad parametros: " + cantParams + "/n";
        return res;
    }
    
}