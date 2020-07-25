package proyectoCompilador;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.StringReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.logging.Level;
import java.util.logging.Logger;
import java_cup.runtime.ComplexSymbolFactory;
import jflex.exceptions.SilentExit;



public class Proyecto1Compi {
    public static void main(String[] args) throws SilentExit, Exception {
        //generarJavalexer();                               //-----> genera el archivo Scanner.java
        //generarJavaparser();                              //-----> genera los archivos parser.java y sym.java
        try {
            String ST = new String(Files.readAllBytes(Paths.get("src/proyectoCompilador/PruebaVariables.txt")));
            System.out.print(ST);
            System.out.print("\n");
            System.out.print("\n");
            System.out.print("--------------------------------Parseo---------------------------------");
            System.out.print("\n");
            System.out.print("\n");
            
            ScannerCup lex = new ScannerCup(new BufferedReader (new StringReader(ST)));
            
            parser par = new parser(lex);
            par.parse();
            
        } catch (IOException ex) {
            ex.printStackTrace();
        } catch (Exception ee){
            ee.printStackTrace();
        }
        
    }
    
    public static void generarJavalexer() throws SilentExit{
        String ruta = "src/proyectoCompilador";
        String opcFlex[] = { ruta + "/scannerCup.jflex", "-d", ruta };
        jflex.Main.generate(opcFlex);
    }
    
    public static void generarJavaparser(){
        
        String ruta = "src/proyectoCompilador";
        String opcCUP[] = { "-destdir", ruta, "-parser", "parser", ruta + "sintactico.cup" };
       
        String[] param = new String[5];
        param[0] = "-destdir";
        param[1] = "src/proyectoCompilador";
        param[2] = "-parser";
        param[3] = "parser";
        param[4] = "src/proyectoCompilador/sintactico.cup";
        try{
            java_cup.Main.main(param);
        }
        catch(Exception e){
            System.out.print(e.toString());
        }
    }
}
