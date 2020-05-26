import java.util.*;
%%
%class dios
%standalone
%line
%column
ALPHA = [A-Za-z]
DIGIT = [0-9]
POW2 = (2|4|8|16|32|64|128|256)
Ident = {ALPHA}({ALPHA}|{DIGIT})*
Op = ("&&"|"=="|"||"|"<<"|">>"|"**"|"!="|"<="|">="|"+="|"-="|"*="|"/="|"!"|"^"|"<"|">"|"&"|"|"|"^"|"~"|"+"|"-"|"*"|"/"|"%"|"="|","|";"|"."|"("|")"|"["|"]"|"?"|":"|"{"|"}")
Reserved = ("bytes"POW2|"uint"POW2|"address"|"as"|"bool"|"break"|"bytes"|"byte"|"constructor"|"Pragma"|"continue"|"contract"|"delete"|"do"|"else"|"enum"|"false"|"for"|"from"|"function"|"hex"|"if"|"import"|"internal"|"int"|"mapping"|"modifier"|"payable"|"private"|"public"|"returns"|"return"|"solidity"|"string"|"struct"|"this"|"true"|"ufixed"|"uint"|"var"|"view"|"while")
Transac = ("balance"|"callcode"|"call"|"delegatecall"|"send"|"transfer")
Units = ("days"|"ether"|"finney"|"hours"|"minutes"|"seconds"|"szabo"|"weeks"|"wei"|"years")

%{
    List<String> indentifiers = new ArrayList();
    List<String> operators = new ArrayList();
    List<String> reserved = new ArrayList();
    List<String> transac = new ArrayList();
    List<String> units = new ArrayList();
%}

%eof{
    System.out.print("Identificadores: ");
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
%eof}

%%

{Reserved} {reserved.add(yytext());}
{Transac} {transac.add(yytext());}
{Units} {units.add(yytext());}

{Ident} {indentifiers.add(yytext());}
{Op} {operators.add(yytext());}
\n {}
. {}