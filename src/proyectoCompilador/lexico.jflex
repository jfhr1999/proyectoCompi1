package analisis;

import java_cup.runtime.Symbol;



%%

%{
    //Código de usuario
    String cadena= "";
%}

%cup
%class scanner
%public
%line
%char
%column
%full
%state CADENA
%ignorecase

//simbolos

PAR_A   = "("
PAR_C   = ")"
LLAV_A  = "{"
LLAV_C  = "}" 
COMA    = ","
PYCOMA  = ";"
ASIGNA  = "="

//palabras reservadas

INT1     = "int"
CHAR1    = "char"
PUB      = "public"
PRI      = "private"
VOI      = "void"
PRINT    = "print"

//expresiones

ENTERO  = [0-9]+   
ID      = [A-Za-zñÑ][_0-9A-Za-zñÑ]*

SPACE   = [\ \r\t\f\t]
ENTER   = [\ \n]

%%

<YYINITIAL> {INT1}      { return new Symbol(sym.INT1, yyline, yycolumn,"entero");}
<YYINITIAL> {CHAR1}     { return new Symbol(sym.CHAR1, yyline, yycolumn,"caracter");}
<YYINITIAL> {PUB}       { return new Symbol(sym.PUB, yyline, yycolumn,"publico");}
<YYINITIAL> {PRI}       { return new Symbol(sym.PRI, yyline, yycolumn,"privado");}
<YYINITIAL> {VOI}       { return new Symbol(sym.VOI, yyline, yycolumn,yytext());}
<YYINITIAL> {PRINT}     { return new Symbol(sym.PRINT, yyline, yycolumn,yytext());}


<YYINITIAL> {PAR_A}     {return new Symbol(sym.PAR_A, yyline, yycolumn,yytext());}
<YYINITIAL> {PAR_C}     {return new Symbol(sym.PAR_C, yyline, yycolumn,yytext());}
<YYINITIAL> {LLAV_A}    {return new Symbol(sym.LLAV_A, yyline, yycolumn,yytext());}
<YYINITIAL> {LLAV_C}    {return new Symbol(sym.LLAV_C, yyline, yycolumn,yytext());}
<YYINITIAL> {COMA}      {return new Symbol(sym.COMA, yyline, yycolumn,yytext());}
<YYINITIAL> {PYCOMA}    {return new Symbol(sym.PYCOMA, yyline, yycolumn,yytext());}
<YYINITIAL> {ASIGNA}    {return new Symbol(sym.ASIGNA, yyline, yycolumn,yytext());}


<YYINITIAL> {ENTERO}    { return new Symbol(sym.ENTERO, yyline, yycolumn,yytext());}
<YYINITIAL> {ID}        {return new Symbol(sym.ID, yyline, yycolumn,yytext());}
<YYINITIAL> [\"]        { yybegin(CADENA); cadena+="\""; }
<YYINITIAL> {SPACE}     { /*Espacios en blanco, ignorados*/ }
<YYINITIAL> {ENTER}     { /*Saltos de linea, ignorados*/}


<YYINITIAL> . {
        String errLex = "Error léxico : '"+yytext()+"' en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1);
        System.out.println(errLex);
}

<CADENA> {
        [\"] { String tmp=cadena+"\""; cadena=""; yybegin(YYINITIAL);  return new Symbol(sym.CADENA, yychar,yyline,tmp); }
        [\n] {String tmp=cadena; cadena="";  
                System.out.println("Se esperaba cierre de cadena (\")."); 
                yybegin(YYINITIAL);
            }
        [^\"] { cadena+=yytext();}
}