package semantica;

public class Nodo {
    
    private RS_base valor;
    private Nodo siguiente;
    
    public void Nodo(RS_Tipo rst){
        this.valor = rst;
        this.siguiente = null;
    }
    
    public void Nodo(RS_ID id){
        this.valor = id;
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