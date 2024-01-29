%{
#include <stdio.h>

int yywrap(void) {
    return 1;
}

void yyerror(const char *s) {
    fprintf(stderr, "%s\n", s);
}
%}

%%
"package"       { printf("Package keyword\n"); }
"import"        { printf("Import keyword\n"); }
"func"          { printf("Function keyword\n"); }
"var"           { printf("Variable keyword\n"); }
"for"           { printf("For loop keyword\n"); }
"if"            { printf("If keyword\n"); }
"else"          { printf("Else keyword\n"); }
"break"         { printf("Break keyword\n"); }
"continue"      { printf("Continue keyword\n"); }
"return"        { printf("Return keyword\n"); }
"true|false"    { printf("Boolean literal\n"); }
"chan"          { printf("Chan keyword\n"); }
"defer"         { printf("Defer keyword\n"); }
"go"            { printf("Go keyword\n"); }
"map"           { printf("Map keyword\n"); }
"struct"        { printf("Struct keyword\n"); }
"case"          { printf("Case keyword\n"); }
"select"        { printf("Select keyword\n"); }
"default"       { printf("Default keyword\n"); }
"interface"     { printf("Interface keyword\n"); }
"goto"          { printf("Goto keyword\n"); }
"const"         { printf("Const keyword\n"); }
"fallthrough"   { printf("Fallthrough keyword\n"); }
"range"         { printf("Range keyword\n"); }
"type"          { printf("Type keyword\n"); }
"switch"        { printf("Switch keyword\n"); }
[0-9]+\.[0-9]+  { printf("Primitive Data Type: %s\n", yytext); }
[0-9]+          { printf("Integer: %s\n", yytext); }
"\+"           { printf("Plus operator\n"); }
"-"             { printf("Minus operator\n"); }
"\*"           { printf("Multiplication operator\n"); }
"/"             { printf("Division operator\n"); }
"=="            { printf("Equal operator\n"); }
"!="            { printf("Not equal operator\n"); }
"%"             { printf("Modulo operator\n"); }
"&&"            { printf("Logical AND operator\n"); }
"\\|\\|"       { printf("Logical OR operator\n"); }
"!"             { printf("Logical NOT operator\n"); }

"&"             { printf("Bitwise AND operator\n"); }
"\+="           { printf("Plus equal operator\n"); }
"&="            { printf("Bitwise AND equal operator\n"); }

\"([^\\\"]|\\.)*\"     { printf("String literal: %s\n", yytext); }

"\("            { printf("Left parenthesis: %s\n",yytext); }
"\)"            { printf("Right parenthesis\n"); }

"\|"            { printf("Bitwise OR operator\n"); }
"-="            { printf("Minus equal operator\n"); }
"\|="           { printf("Bitwise OR equal operator\n"); }

"<"             { printf("Less than operator\n"); }
"<="            { printf("Less than or equal operator\n"); }
"\["            { printf("Left square bracket\n"); }
"\]"            { printf("Right square bracket\n"); }

"\^"            { printf("Bitwise XOR operator\n"); }
"\*="           { printf("Multiplication equal operator\n"); }
"\^="           { printf("Bitwise XOR equal operator\n"); }
"<-"           { printf("Left arrow (channel receive)\n"); }
">"            { printf("Greater than operator\n"); }
">="           { printf("Greater than or equal operator\n"); }
"\{"           { printf("Left curly brace\n"); }
"\}"           { printf("Right curly brace\n"); }

"<<"           { printf("Left shift operator\n"); }
"/="           { printf("Division equal operator\n"); }
"<<="          { printf("Left shift equal operator\n"); }
"\+\+"         { printf("Increment operator\n"); }
"--"            {printf("Decrement operator\n"); }
"="            { printf("Assignment operator\n"); }
":="           { printf("Short declaration operator\n"); }
","            { printf("Comma\n"); }
";"            { printf("Semicolon\n"); }
":"            {printf("colon\n");}
"."             {printf("Full stop\n");} 
"//"            { while (yytext[0] != '\n') { /* Ignore comments */ yytext = yytext + 1; } }
[a-zA-Z_][a-zA-Z0-9_]*   { printf("Identifier: %s\n", yytext); }
[ \t\n]         ;  // Ignore whitespace and newlines
.               { printf("Unrecognized character: %s\n", yytext); }
%%

int main() {
    yylex();
    return 0;
}

