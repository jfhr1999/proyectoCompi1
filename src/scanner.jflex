import java.util.*;

%%

%class Scanner
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
Hexadecimal = hex(\"({DIGIT}|{HEX})+\"|\'({DIGIT}|{HEX})+\')
Numbers = ({Scientific}|{DIGIT}+"."{DIGIT}+|{DIGIT}+"."|"."{DIGIT}+|{DIGIT}+)
Escape = (\\(n|xNN|uNNN))
Strings = (\"([^\"\\\r\n]|{Escape})*\"|\'([^\'\\\r\n]|{Escape})*\')
Literals = ({Hexadecimal}|{Strings})
Comments = ((\/\*([^\*]|(\*+[^\*\/]))*\*+\/)|(\/\/.*))

%{
    ArrayList<String> identifiers = new ArrayList();
    ArrayList<String> operators = new ArrayList();
    ArrayList<String> reserved = new ArrayList();
    ArrayList<String> transac = new ArrayList();
    ArrayList<String> units = new ArrayList();
    ArrayList<String> literals = new ArrayList();
    ArrayList<String> errors = new ArrayList();
    public void printList(ArrayList<String> list){
        Collections.sort(list);
        if(!list.isEmpty()){
            for(String s : list){
                System.out.println(s);
            }
            System.out.print("\n");
        }
    }
%}

%eof{
    System.out.println("Token               Tipo               Linea");
    printList(identifiers);
    printList(operators);
    printList(reserved);
    printList(transac);
    printList(units);
    printList(literals);
    if(!errors.isEmpty()){
        System.out.println("\nErrores:\nError          Linea");
        printList(errors);
    }
%eof}

%%
{Comments} {}
{Literals} {literals.add(yytext() + "               Literal               " + String.valueOf(yyline+1));}
{Numbers} { String str = yytext();
            while(str.substring(0, 1).equals("0")){
                str = str.substring(1);
            }
            literals.add(str + "               Literal               " + String.valueOf(yyline+1));}
{Reserved} {reserved.add(yytext() + "               Palabras Reservadas               " + String.valueOf(yyline+1));}
{Transac} {transac.add(yytext() + "               TRANSAC               " + String.valueOf(yyline+1));}
{Units} {units.add(yytext() + "               UNITS               " + String.valueOf(yyline+1));}
{Op} {operators.add(yytext() + "               Operadores               " + String.valueOf(yyline+1));}
{Ident} {identifiers.add(yytext() + "               Identificadores               " + String.valueOf(yyline+1));}
[\r\n" "\t] {}
. {errors.add(yytext() + "          " + String.valueOf(yyline+1));}