package semantica;

public class Nodo {
    
    private RS_Base valor;
    private Nodo siguiente;
    
    public Nodo(RS_Base pRS){
        this.valor = pRS;
        this.siguiente = null;
    }
    
    public Nodo(){
        this.siguiente = null;
    }
    
    public RS_Base getValor() {
        return valor;
    }

    public void setValor(RS_Base valor) {
        this.valor = valor;
    }

    public Nodo getSiguiente() {
        return siguiente;
    }

    public void setSiguiente(Nodo siguiente) {
        this.siguiente = siguiente;
    }
}