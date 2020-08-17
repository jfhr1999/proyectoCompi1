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
    
    public String buscarRSTipo(){
        Nodo aux = inicio;
        while(aux != null){
            if (aux.getValor().getTipoRS().equals("tipo")) { 
                RS_Tipo id = (RS_Tipo) aux.getValor();
                return id.getTipo();
            }
            else{
                aux = aux.getSiguiente();
            }
        }
        return "";
    }
    
    public String buscarAlcance(){
        Nodo aux = inicio;
        while(aux != null){
            if (aux.getValor().getTipoRS().equals("funcion")) { 
                RS_Funcion id = (RS_Funcion) aux.getValor();
                return id.getNombre();
            }
            else{
                aux = aux.getSiguiente();
            }
        }
        return "global";
    }
    
    public boolean buscarWhile(){
        Nodo aux = inicio;
        while(aux != null){
            if (aux.getValor().getTipoRS().equals("while")) { 
                return true;
            }
            else{
                aux = aux.getSiguiente();
            }
        }
        return false;
    }
    
    public void clear(){
        inicio = null;
        tamanio = 0;
    }
    
    public void printPila(){
        Nodo aux = inicio;
        while(aux != null){
            System.out.println("Registro: " + aux.getValor().tipoRS);
            aux = aux.getSiguiente();
        }
    }
    
}
