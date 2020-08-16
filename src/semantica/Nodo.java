package semantica;

public class Nodo {
    
    private RS_base valor;
    private Nodo siguiente;
    
    public Nodo(RS_base pRS){
        this.valor = pRS;
        this.siguiente = null;
    }
    
    public Nodo(){
        this.siguiente = null;
    }
    
    public RS_base getValor() {
        return valor;
    }

    public void setValor(RS_base valor) {
        this.valor = valor;
    }

    public Nodo getSiguiente() {
        return siguiente;
    }

    public void setSiguiente(Nodo siguiente) {
        this.siguiente = siguiente;
    }
}