package proyectoCompilador;

import java.util.ArrayList;

class TablaSimbolos {
    protected ArrayList<Token> simbolos;

    public TablaSimbolos(){
        simbolos = new ArrayList<Token>();
    }

    public boolean agregarToken(Token pToken){ //Retorna true si logró insertar, y false si no lo pudo hacer
        boolean alreadyExists = buscarToken(pToken);
        if(!alreadyExists){
            simbolos.add(pToken);
            return true;
        }
        return false; //variable ya declarada
    }

    public boolean buscarToken(Token pToken){ //Retorna true si encontró el token en la tabla, y false si no
        for(Token t : simbolos){
            if(t.getNombre().equals(pToken.getNombre()) && t.getSubclase().equals(pToken.getSubclase())){
                return true;
            }
        }
        return false;
    }

    public String toString(){
        String res = "";
        res += "-------TABLA SIMBOLOS-------/n";
        for(Token t: simbolos){
            res += t.toString();
        }
        return res;
    }

}