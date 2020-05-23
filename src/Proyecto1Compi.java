

import java.io.File;


public class Proyecto1Compi {

    
    public static void main(String[] args) {
        //generarJavalexer("C:/Users/josef/Desktop/Proyecto1Compi/src/Lexer.jflex");
        leer();
        
    }
    
    public static void generarJavalexer(String ruta){
        File archivo = new File(ruta);
        JFlex.Main.generate(archivo);
    }
    
    public static void leer(){
        String[] command = new String[]{"C:/Users/josef/Desktop/Proyecto1Compi/src/ejemploSolidity.txt"};
        
        Yylex.main(command);
    }
    
}
