import jflex.exceptions.SilentExit;


public class Proyecto1Compi {

    
    public static void main(String[] args) throws SilentExit {
        //generarJavalexer();
        leer(); 
    }
    
    public static void generarJavalexer() throws SilentExit{
        String[] path = new String[]{"src/Lexer.jflex"};
        jflex.Main.generate(path);
    }
    
    public static void leer(){
        String[] command = new String[]{"src/ejemploSolidity.txt"};  
        Yylex.main(command);
    }
    
}
