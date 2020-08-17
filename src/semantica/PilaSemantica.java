package semantica;

public class PilaSemantica {
    private Nodo inicio;
    private int tamanio;
    
    public PilaSemantica(){
        inicio = null;
        tamanio = 0;   
    }
    public boolean esVacia(){
        return inicio == null;
    }
    
    public int getTamanio(){
        return tamanio;
    }
    //revisar, posibles problemas mas adelante
    public void push(RS_Base pRSbase) {
        Nodo nodo = new Nodo();
        nodo.setValor(pRSbase);
        if (esVacia()) {
            inicio = nodo;
        }
        else{
            nodo.setSiguiente(inicio);
            inicio = nodo;
        }
        tamanio++;
    } 
    
    public RS_Base pop() throws Exception{
        Nodo n = new Nodo();
        if (!esVacia()) {
            n = inicio;
            inicio = inicio.getSiguiente();
            tamanio--;
            return n.getValor();
        }
        else{
            throw new Exception("La pila se encuentra vacia.");
        }
    }
        
    public RS_Base top() throws Exception{
       if(!esVacia()){
           return inicio.getValor();
       } else {
            throw new Exception("La pila se encuentra vacia.");
        }
    }
    
    //determina si existe el RS dentro de la pila y retorna boolean
    public boolean buscar(RS_Base referencia){
        Nodo aux = inicio;
        boolean existe = false;
        while(existe != true && aux != null){
            if (referencia.equals(aux.getValor())) { 
                existe = true;
                break;
            }
            else{
                aux = aux.getSiguiente();
            }
        }
        return existe;
    }
    
    public boolean buscarWhile(RS_While referencia){
        Nodo aux = inicio;
        boolean existe = false;
        while(existe != true && aux != null){
            if (referencia.getTipoRS().equals(aux.getValor().getTipoRS())) { 
                existe = true;
                break;
            }
            else{
                aux = aux.getSiguiente();
            }
        }
        return existe;
    }
    
    public void clear(){
        inicio = null;
        tamanio = 0;
    }
    
}
