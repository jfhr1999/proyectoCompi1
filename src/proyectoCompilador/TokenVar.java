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
    protected String valor;
    
    public TokenVar(){
        super();
    }

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }
    
    
    
    public String toString(){
        String res = "";
        res += super.toString();
        res += "Alcance: " + alcance + "\n";
        return res;
    }
}
