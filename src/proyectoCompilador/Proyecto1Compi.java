package proyectoCompilador;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.logging.Level;
import java.util.logging.Logger;
import jflex.exceptions.SilentExit;



public class Proyecto1Compi {

    
    public static void main(String[] args) throws SilentExit, Exception {
        //generarJavalexer();                               //-----> genera el archivo Scanner.java
        //generarJavaparser();                              //-----> genera los archivos parser.java y sym.java
        parsear();                                        //-----> ejecuta el proceso de parseo
    }
    
    public static void generarJavalexer() throws SilentExit{
        String[] path = new String[]{"src/proyectoCompilador/minijava.flex"};    //String que contiene el path al scanner en jflex
        jflex.Main.generate(path);
    }
    
    public static void generarJavaparser(){
        String[] param = new String[5];
        param[0] = "-destdir";
        param[1] = "src/proyectoCompilador";
        param[2] = "-parser";
        param[3] = "parser";
        param[4] = "src/proyectoCompilador/minijava.cup";
        try{
            java_cup.Main.main(param);
        }
        catch(Exception e){
            System.out.print(e.toString());
        }
    }
    
    
    public static void parsear() throws Exception{
        try {
            Scanner scan = new Scanner(new FileReader("C:\\Users\\josef\\Desktop\\Github\\proyectoCompi1\\src\\proyectoCompilador\\p.txt"));
            
            parser par = new parser(scan);
            par.parse();
            
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Proyecto1Compi.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
 
}
