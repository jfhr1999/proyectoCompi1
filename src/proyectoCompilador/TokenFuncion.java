package proyectoCompilador;
import java.util.ArrayList;

public class TokenFuncion extends Token{
    
    protected int cantParams = 0; //No se necesita para comparar, pero se va a imprimir en la tabla?
    //protected ArrayList<TokenVar> params = new ArrayList();

    public TokenFuncion(String nombre, String tipo, String subclase, String ambito, int cantParams, ArrayList<TokenVar> params){
        super();
        this.cantParams = cantParams;
        //this.params = params;
    }

    public void setCantParams(int pCant){
        cantParams = pCant;
    }

    public int getCantParams(){
        return cantParams;
    }

    public String toString(){
        String res = "";
        res += super.toString();
        res += "Cantidad parametros: " + cantParams + "/n";
        return res;
    }
    
}