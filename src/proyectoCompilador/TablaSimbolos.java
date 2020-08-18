package proyectoCompilador;

import java.util.ArrayList;

class TablaSimbolos {
    protected ArrayList<Token> simbolos;

    public TablaSimbolos(){
        simbolos = new ArrayList<Token>();
    }

    public void agregarToken(Token pToken){ //Retorna true si logró insertar, y false si no lo pudo hacer{
        simbolos.add(pToken);
    }

    public boolean buscarTokenFuncion(Token pToken){ //Retorna true si encontró el token en la tabla, y false si no
        for(Token t : simbolos){
            if(t.getNombre().equals(pToken.getNombre()) && t.getSubclase().equals(pToken.getSubclase())){
                return true;
            }
        }
        return false;
    }
    
    public boolean buscarTokenVariable(Token pToken){ //Retorna true si encontró el token en la tabla, y false si no
        for(Token t : simbolos){
            if(t.getNombre().equals(pToken.getNombre()) && t.getSubclase().equals(pToken.getSubclase())){
                if(t.getAlcance().equals(pToken.getAlcance())){
                    return true;
                }else{
                    if(t.getAlcance().equals("global")){
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public boolean buscarVariable(String nombre, String scope){
        for(Token t : simbolos){
            if(t.getNombre().equals(nombre)){
                if(t.getAlcance().equals(scope) || t.getAlcance().equals("global")){
                    return true;
                }
            }
        }
        return false;
    }
    
    public String buscarTipoVariable(String nombre, String scope){
        for(Token t : simbolos){
            if(t.getNombre().equals(nombre)){
                if(t.getAlcance().equals(scope) || t.getAlcance().equals("global")){
                    return t.tipo;
                }
            }
        }
        return "error";
    } 
    
    public String toString(){
        String res = "";
        res += "-------TABLA SIMBOLOS-------\n";
        for(Token t: simbolos){
            res += t.toString();
        }
        return res;
    }

}