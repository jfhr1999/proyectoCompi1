package proyectoCompilador;

package proyectoCompilador;
import java.util.ArrayList;

class TablaSimbolos {
    protected ArrayList<Token> simbolos;

    public TablaSimbolos(){
        simbolos = new ArrayList<Token>();
    }

    public boolean agregarToken(Token pToken){ //Retorna true si logró insertar, y false si no lo pudo hacer
        boolean res = false;
        boolean alreadyExists = buscarToken(pToken);
        if(!alreadyExists){
            simbolos.add(pToken);
            res = true;
        }
        return res;
    }

    public boolean buscarToken(Token pToken){ //Retorna true si encontró el token en la tabla, y false si no
        boolean res = false;
        for(Token t : simbolos){
            if(t.getTipo().equals(pToken.getTipo()) && t.getNombre().equals(pToken.getNombre()){ //Qué vamos a usar para comparar los tokens?
                res = true;
                break;
            }
        }
        return res;
    }

    @Override
    public String toString(){
        String res = "";
        res += "-------TABLA SIMBOLOS-------/n"
        for(Token t: simbolos){
            res += t.toString();
        }
        return res;
    }

}