package proyectoCompilador;
import java_cup.runtime.Symbol;

%%

%class ScannerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
%column

%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
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
Ar_Op = ("+"|"-"|"*"|"/"|"%"|"+="|"-="|"*="|"/=")
Bool_Op = ("=="|">="|">"|"<="|"<"|"!="|"||"|"&&"|"!")
Version = ("^"{DIGIT}"."{DIGIT}"."{DIGIT})
Boolean_Value = (True|False)

%%


{Comments} {}
{Strings} {return new Symbol(sym.String, yychar, yyline, yytext());}
{Numbers} { String str = yytext();
            while(str.substring(0, 1).equals("0")){
                str = str.substring(1);
            }
            return new Symbol(sym.Number, yychar, yyline, str);}
{Hexadecimal} {return new Symbol(sym.Hexadecimal, yychar, yyline, yytext());}
(pragma|Pragma) {return new Symbol(sym.Pragma, yychar, yyline, yytext());}
(solidity) {return new Symbol(sym.Solidity, yychar, yyline, yytext());}
(contract) {return new Symbol(sym.Contract, yychar, yyline, yytext());}
(enum) {return new Symbol(sym.Enum, yychar, yyline, yytext());}
{Type} {return new Symbol(sym.Var_Type, yychar, yyline, yytext());}
(public) {return new Symbol(sym.Public, yychar, yyline, yytext());}
(private) {return new Symbol(sym.Private, yychar, yyline, yytext());}
(struct) {return new Symbol(sym.Struct, yychar, yyline, yytext());}
(function) {return new Symbol(sym.Function, yychar, yyline, yytext());}
{Mod} {return new Symbol(sym.Modifier, yychar, yyline, yytext());}
(returns) {return new Symbol(sym.Returns, yychar, yyline, yytext());}
(return) {return new Symbol(sym.Return, yychar, yyline, yytext());}
{Boolean_Value} {return new Symbol(sym.Boolean_Value, yychar, yyline, yytext());}
(this) {return new Symbol(sym.This, yychar, yyline, yytext());}
(while) {return new Symbol(sym.While, yychar, yyline, yytext());}
(do) {return new Symbol(sym.Do, yychar, yyline, yytext());}
(for) {return new Symbol(sym.For, yychar, yyline, yytext());}
(if) {return new Symbol(sym.If, yychar, yyline, yytext());}
(else) {return new Symbol(sym.Else, yychar, yyline, yytext());}
(break) {return new Symbol(sym.Break, yychar, yyline, yytext());}
(continue) {return new Symbol(sym.Continue, yychar, yyline, yytext());}
{Version} {return new Symbol(sym.Version, yychar, yyline, yytext());}
("^") {return new Symbol(sym.Caret, yychar, yyline, yytext());}
("{") {return new Symbol(sym.O_Braces, yychar, yyline, yytext());}
("}") {return new Symbol(sym.C_Braces, yychar, yyline, yytext());}
("[") {return new Symbol(sym.O_Brackets, yychar, yyline, yytext());}
("]") {return new Symbol(sym.C_Brackets, yychar, yyline, yytext());}
("(") {return new Symbol(sym.O_Parentheses, yychar, yyline, yytext());}
(")") {return new Symbol(sym.C_Parentheses, yychar, yyline, yytext());}
("=") {return new Symbol(sym.Equal, yychar, yyline, yytext());}
(",") {return new Symbol(sym.Comma, yychar, yyline, yytext());}
(";") {return new Symbol(sym.Semicolon, yychar, yyline, yytext());}
(".") {return new Symbol(sym.Period, yychar, yyline, yytext());}
("?") {return new Symbol(sym.QuestionMark, yychar, yyline, yytext());}
(":") {return new Symbol(sym.Colon, yychar, yyline, yytext());}
{Reserved} {return new Symbol(sym.Reserved, yychar, yyline, yytext());}
{Transac} {return new Symbol(sym.Transac, yychar, yyline, yytext());}
{Units} {return new Symbol(sym.Units, yychar, yyline, yytext());}
{Ar_Op} {return new Symbol(sym.Arithmetic_Op, yychar, yyline, yytext());}
{Bool_Op} {return new Symbol(sym.Boolean_Op, yychar, yyline, yytext());}
{Op} {return new Symbol(sym.Operator, yychar, yyline, yytext());}
{Ident} {return new Symbol(sym.Identifier, yychar, yyline, yytext());}
[\r\n" "\t] {}
. {return new Symbol(sym.ERROR, yychar, yyline, yytext());}