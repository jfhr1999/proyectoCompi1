package proyectoCompilador;
import static proyectoCompilador.Tokens.*;

%%

%class Scanner
%type Tokens
%line
%column

%{
    public String lexeme;
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
Literals = ({Hexadecimal}|{Strings})
Comments = ((\/\*([^\*]|(\*+[^\*\/]))*\*+\/)|(\/\/.*))
Type = ("bytes"{POW2}|"int"{POW2}|"uint"{POW2}|"bool"|"byte"|"bytes"|"address"|"int"|"string"|"ufixed"|"uint")
Mod = ("payable"|"internal")
Most_Important_Op = ("*"|"/"|"%")
Least_Important_Op = ("+"|"-")
Greater_Lesser_Op = (">="|">"|"<="|"<")
Same_Different_Op = ("=="|"!=")
Equals = ("+="|"-="|"*="|"/=")


%%

{Comments} {}
{Literals} {lexeme=yytext(); return Literal;}
{Numbers} { String str = yytext();
            while(str.substring(0, 1).equals("0")){
                str = str.substring(1);
            }
            lexeme=str; return Literal;}
(pragma|Pragma) {lexeme=yytext(); return Pragma;}
(solidity) {lexeme=yytext(); return Solidity;}
(contract) {lexeme=yytext(); return Contract;}
(enum) {lexeme=yytext(); return Enum;}
{Type} {lexeme=yytext(); return Var_Type;}
(public) {lexeme=yytext(); return Public;}
(private) {lexeme=yytext(); return Private;}
(struct) {lexeme=yytext(); return Struct;}
(function) {lexeme=yytext(); return Function;}
{Mod} {lexeme=yytext(); return Modifier;}
(returns) {lexeme=yytext(); return Returns;}
(return) {lexeme=yytext(); return Return;}
(true) {lexeme=yytext(); return True;}
(false) {lexeme=yytext(); return False;}
(this) {lexeme=yytext(); return This;}
(while) {lexeme=yytext(); return While;}
(do) {lexeme=yytext(); return Do;}
(for) {lexeme=yytext(); return For;}
(if) {lexeme=yytext(); return If;}
(else) {lexeme=yytext(); return Else;}
(break) {lexeme=yytext(); return Break;}
(continue) {lexeme=yytext(); return Continue;}
("^") {lexeme=yytext(); return Caret;}
("{") {lexeme=yytext(); return O_Braces;}
("}") {lexeme=yytext(); return C_Braces;}
("[") {lexeme=yytext(); return O_Brackets;}
("]") {lexeme=yytext(); return C_Brackets;}
("(") {lexeme=yytext(); return O_Parentheses;}
(")") {lexeme=yytext(); return C_Parentheses;}
("=") {lexeme=yytext(); return Equal;}
(",") {lexeme=yytext(); return Comma;}
(";") {lexeme=yytext(); return Semicolon;}
(".") {lexeme=yytext(); return Period;}
("?") {lexeme=yytext(); return QuestionMark;}
(":") {lexeme=yytext(); return Colon;}
("&&") {lexeme=yytext(); return And;}
("||") {lexeme=yytext(); return Or;}
("!") {lexeme=yytext(); return ExclamationMark;}
{Most_Important_Op} {lexeme=yytext(); return Most_Important_Op;}
{Least_Important_Op} {lexeme=yytext(); return Least_Important_Op;}
{Greater_Lesser_Op} {lexeme=yytext(); return Greater_Lesser_Op;}
{Most_Important_Op} {lexeme=yytext(); return Same_Different_Op;}
{Equals} {lexeme=yytext(); return Equals;}
{Reserved} {lexeme=yytext(); return Reserved;}
{Transac} {lexeme=yytext(); return Transac;}
{Units} {lexeme=yytext(); return Units;}
{Op} {lexeme=yytext(); return Op;}
{Ident} {lexeme=yytext(); return Identifier;}
[\r\n" "\t] {}
. {lexeme=yytext(); return ERROR;}