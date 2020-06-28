import jflex.exceptions.SilentExit;


public class Proyecto1Compi {

    
    public static void main(String[] args) throws SilentExit {
        //generarJavalexer();
        leer(); 
    }
    
    public static void generarJavalexer() throws SilentExit{
        String[] path = new String[]{"src/scanner.jflex"};    //String que contiene el path al scanner en jflex
        jflex.Main.generate(path);
    }
    
    public static void leer(){
        String[] command = new String[]{"src/codigo solidity.txt"};  //String que contiene el path del .txt a leer
        Scanner.main(command);
    }
 
}
