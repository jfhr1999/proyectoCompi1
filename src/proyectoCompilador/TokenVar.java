/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectoCompilador;

/**
 *
 * @author Juanq
 */
public class TokenVar extends Token{
    protected String alcance;
    protected String tipoAlcance;
    
    public TokenVar(String nombre, String tipo, String subclase, String ambito, String alcance, String tipoAlcance){
        super(nombre, tipo, subclase, ambito);
        this.alcance = alcance;
        this.tipoAlcance = tipoAlcance;
    }
    
    public String toString(){
        String res = "";
        res += super.toString();
        res += "Alcance: " + alcance + " (" + tipoAlcance + ")";
        return res;
    }
}
