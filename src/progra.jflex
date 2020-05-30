import java.util.*;
%%
%class dios
%standalone
%line
%column
ALPHA = [A-Za-z]
DIGIT = [0-9]
HEX = [A-F]
POW2 = (2|4|8|16|32|64|128|256)
Ident = {ALPHA}({ALPHA}|{DIGIT})*
Op = ("&&"|"=="|"||"|"<<"|">>"|"**"|"!="|"<="|">="|"+="|"-="|"*="|"/="|"!"|"^"|"<"|">"|"&"|"|"|"^"|"~"|"+"|"-"|"*"|"/"|"%"|"="|","|";"|"."|"("|")"|"["|"]"|"?"|":"|"{"|"}")
Reserved = ("bytes"{POW2}|"uint"{POW2}|"address"|"as"|"bool"|"break"|"bytes"|"byte"|"constructor"|"Pragma"|"continue"|"contract"|"delete"|"do"|"else"|"enum"|"false"|"for"|"from"|"function"|"hex"|"if"|"import"|"internal"|"int"|"mapping"|"modifier"|"payable"|"private"|"public"|"returns"|"return"|"solidity"|"string"|"struct"|"this"|"true"|"ufixed"|"uint"|"var"|"view"|"while")
Transac = ("balance"|"callcode"|"call"|"delegatecall"|"send"|"transfer")
Units = ("days"|"ether"|"finney"|"hours"|"minutes"|"seconds"|"szabo"|"weeks"|"wei"|"years")
Scientific = {DIGIT}+"."?{DIGIT}*e("-"|"+")?{DIGIT}+
Hexadecimal = hex(\"-?({DIGIT}|{HEX})+\"|\'-?({DIGIT}|{HEX})+\')
Numbers = {Hexadecimal}|-?({Scientific}|{DIGIT}+"."{DIGIT}+|{DIGIT}+"."|"."{DIGIT}+|{DIGIT}+)
Escape = (\\(n|xNN|uNNN))
Strings = (\"([^\"\\]|{Escape})*\"|\'([^\'\\]|{Escape})*\')
Literals = ({Strings}|{Numbers})
Comments = ("//".*)

%{
    ArrayList<String> indentifiers = new ArrayList();
    ArrayList<String> operators = new ArrayList();
    ArrayList<String> reserved = new ArrayList();
    ArrayList<String> transac = new ArrayList();
    ArrayList<String> units = new ArrayList();
    ArrayList<String> literals = new ArrayList();
%}

%eof{
    /*System.out.print("Identificadores: ");
    for(int i=0; i<indentifiers.size();i++){
        if(i==indentifiers.size()-1)
            System.out.print(indentifiers.get(i)+"\n");
        else
            System.out.print(indentifiers.get(i)+", ");
    }
    System.out.print("Operadores: ");
    for(int i=0; i<operators.size();i++){
        if(i==operators.size()-1)
            System.out.print(operators.get(i)+"\n");
        else
            System.out.print(operators.get(i)+", ");
    }
    System.out.print("Palabras reservadas: ");
    for(int i=0; i<reserved.size();i++){
        if(i==reserved.size()-1)
            System.out.print(reserved.get(i)+"\n");
        else
            System.out.print(reserved.get(i)+", ");
    }
    System.out.print("Palabras TRANSAC: ");
    for(int i=0; i<transac.size();i++){
        if(i==transac.size()-1)
            System.out.print(transac.get(i)+"\n");
        else
            System.out.print(transac.get(i)+", ");
    }
    System.out.print("Palabras UNITS: ");
    for(int i=0; i<units.size();i++){
        if(i==units.size()-1)
            System.out.print(units.get(i)+"\n");
        else
            System.out.print(units.get(i)+", ");
    }
    System.out.print("Literales: ");
    for(int i=0; i<literals.size();i++){
        if(i==literals.size()-1)
            System.out.print(literals.get(i)+"\n");
        else
            System.out.print(literals.get(i)+", ");
    }*/
%eof}

%%

{Literals} {literals.add(yytext()); System.out.println(yytext() + "  Literal  " + yyline);}
{Reserved} {reserved.add(yytext()); System.out.println(yytext() + "  Palabra Reservada  " + yyline);}
{Transac} {transac.add(yytext()); System.out.println(yytext() + "  TRANSAC  " + yyline);}
{Units} {units.add(yytext()); System.out.println(yytext() + "  UNITS  " + yyline);}
{Op} {operators.add(yytext()); System.out.println(yytext() + "  Operador  " + yyline);}
{Ident} {indentifiers.add(yytext()); System.out.println(yytext() + "  Identificador  " + yyline);}
\n {}
. {}