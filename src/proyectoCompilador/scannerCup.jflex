package proyectoCompilador;
import java_cup.runtime.Symbol;

%%

%class ScannerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%column

%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yycolumn, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yycolumn, yycolumn);
    }
%}

ALPHA = [A-Za-z]
DIGIT = [0-9]
HEX = [A-F]
POW2 = (2|4|8|16|32|64|128|256)
Ident = {ALPHA}({ALPHA}|{DIGIT})*
Op = ("<<"|">>"|"**"|"<"|">"|"&"|"|"|"~")
Reserved = ("as"|"constructor"|"delete"|"from"|"hex"|"import"|"mapping"|"modifier"|"var"|"view")
Transac = ("balance"|"callcode"|"call"|"delegatecall"|"send"|"transfer")
Units = ("days"|"ether"|"finney"|"hours"|"minutes"|"seconds"|"szabo"|"weeks"|"wei"|"years")
Scientific = {DIGIT}+"."?{DIGIT}*e("-"|"+")?{DIGIT}+
Hexadecimal = hex(\"({DIGIT}|{HEX})+\"|\'({DIGIT}|{HEX})+\')
Numbers = ({Scientific}|{DIGIT}+"."{DIGIT}+|{DIGIT}+"."|"."{DIGIT}+|{DIGIT}+)
Escape = (\\(n|xNN|uNNN))
Strings = (\"([^\"\\\r\n]|{Escape})*\"|\'([^\'\\\r\n]|{Escape})*\')
Comments = ((\/\*([^\*]|(\*+[^\*\/]))*\*+\/)|(\/\/.*))
Type = ("bytes"{POW2}|"int"{POW2}|"uint"{POW2}|"bool"|"byte"|"bytes"|"address"|"int"|"string"|"ufixed"|"uint")
Mod = ("payable"|"internal")
Most_Important_Op = ("*"|"/"|"%")
Equals = ("+="|"-="|"*="|"/=")
Same_Different_Op = ("=="|"!=")
Greater_Lesser_Op = (">="|">"|"<="|"<")
Least_Important_Op = ("+"|"-")
Version = ("^"{DIGIT}"."{DIGIT}"."{DIGIT})
Boolean_Value = (True|False)

%%


{Comments} {}
{Strings} {return new Symbol(sym.String, yyline, yycolumn, yytext());}
{Numbers} { String str = yytext();
            while(str.substring(0, 1).equals("0")){
                str = str.substring(1);
            }
            return new Symbol(sym.Number, yyline, yycolumn, str);}
{Hexadecimal} {return new Symbol(sym.Hexadecimal, yyline, yycolumn, yytext());}
(pragma|Pragma) {return new Symbol(sym.Pragma, yyline, yycolumn, yytext());}
(solidity) {return new Symbol(sym.Solidity, yyline, yycolumn, yytext());}
(contract) {return new Symbol(sym.Contract, yyline, yycolumn, yytext());}
(enum) {return new Symbol(sym.Enum, yyline, yycolumn, yytext());}
{Type} {return new Symbol(sym.Var_Type, yyline, yycolumn, yytext());}
(public) {return new Symbol(sym.Public, yyline, yycolumn, yytext());}
(private) {return new Symbol(sym.Private, yyline, yycolumn, yytext());}
(struct) {return new Symbol(sym.Struct, yyline, yycolumn, yytext());}
(function) {return new Symbol(sym.Function, yyline, yycolumn, yytext());}
{Mod} {return new Symbol(sym.Modifier, yyline, yycolumn, yytext());}
(returns) {return new Symbol(sym.Returns, yyline, yycolumn, yytext());}
(return) {return new Symbol(sym.Return, yyline, yycolumn, yytext());}
{Boolean_Value} {return new Symbol(sym.Boolean_Value, yyline, yycolumn, yytext());}
(this) {return new Symbol(sym.This, yyline, yycolumn, yytext());}
(while) {return new Symbol(sym.While, yyline, yycolumn, yytext());}
(do) {return new Symbol(sym.Do, yyline, yycolumn, yytext());}
(for) {return new Symbol(sym.For, yyline, yycolumn, yytext());}
(if) {return new Symbol(sym.If, yyline, yycolumn, yytext());}
(else) {return new Symbol(sym.Else, yyline, yycolumn, yytext());}
(break) {return new Symbol(sym.Break, yyline, yycolumn, yytext());}
(continue) {return new Symbol(sym.Continue, yyline, yycolumn, yytext());}
{Version} {return new Symbol(sym.Version, yyline, yycolumn, yytext());}
("^") {return new Symbol(sym.Caret, yyline, yycolumn, yytext());}
("{") {return new Symbol(sym.O_Braces, yyline, yycolumn, yytext());}
("}") {return new Symbol(sym.C_Braces, yyline, yycolumn, yytext());}
("[") {return new Symbol(sym.O_Brackets, yyline, yycolumn, yytext());}
("]") {return new Symbol(sym.C_Brackets, yyline, yycolumn, yytext());}
("(") {return new Symbol(sym.O_Parentheses, yyline, yycolumn, yytext());}
(")") {return new Symbol(sym.C_Parentheses, yyline, yycolumn, yytext());}
("=") {return new Symbol(sym.Equal, yyline, yycolumn, yytext());}
(",") {return new Symbol(sym.Comma, yyline, yycolumn, yytext());}
(";") {return new Symbol(sym.Semicolon, yyline, yycolumn, yytext());}
(".") {return new Symbol(sym.Period, yyline, yycolumn, yytext());}
("?") {return new Symbol(sym.QuestionMark, yyline, yycolumn, yytext());}
(":") {return new Symbol(sym.Colon, yyline, yycolumn, yytext());}
("||") {return new Symbol(sym.Or, yyline, yycolumn, yytext());}
("&&") {return new Symbol(sym.And, yyline, yycolumn, yytext());}
("!") {return new Symbol(sym.ExclamationMark, yyline, yycolumn, yytext());}
{Same_Different_Op} {return new Symbol(sym.Same_Different_Op, yyline, yycolumn, yytext());}
{Equals} {return new Symbol(sym.Equals, yyline, yycolumn, yytext());}
{Greater_Lesser_Op} {return new Symbol(sym.Greater_Lesser_Op, yyline, yycolumn, yytext());}
{Least_Important_Op} {return new Symbol(sym.Least_Important_Op, yyline, yycolumn, yytext());}
{Most_Important_Op} {return new Symbol(sym.Most_Important_Op, yyline, yycolumn, yytext());}
{Reserved} {return new Symbol(sym.Reserved, yyline, yycolumn, yytext());}
{Transac} {return new Symbol(sym.Transac, yyline, yycolumn, yytext());}
{Units} {return new Symbol(sym.Units, yyline, yycolumn, yytext());}
{Op} {return new Symbol(sym.Operator, yyline, yycolumn, yytext());}
{Ident} {return new Symbol(sym.Identifier, yyline, yycolumn, yytext());}
[\r\n" "\t] {}
. {return new Symbol(sym.ERROR, yyline, yycolumn, yytext());}