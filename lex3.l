%{
#include <stdio.h>
/* Analisador lexico adicional para Nota Maxima - lex3.l */
%}

%option noyywrap

/* definicoes regulares */
delim       [ \t\n]
ws          {delim}+

ipv4        [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}
url         (http|https):\/\/[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}(\/[a-zA-Z0-9&%_.-]*)*
variavel    [a-zA-Z_][a-zA-Z0-9_]*
string_aspas \"([^\\\"]|\\.)*\"
tag_html    <[^>]+>

%%

{ws}                { /* nenhuma acao */ }

{ipv4}              { printf("Foi encontrado um IPv4. LEXEMA: %s\n", yytext); }
{url}               { printf("Foi encontrada uma URL. LEXEMA: %s\n", yytext); }
{tag_html}          { printf("Foi encontrada uma Tag HTML. LEXEMA: %s\n", yytext); }
{string_aspas}      { printf("Foi encontrada uma String. LEXEMA: %s\n", yytext); }
{variavel}          { printf("Foi encontrada uma Variavel. LEXEMA: %s\n", yytext); }

.                   { /* ignora eventuais caracteres invalidos */ }

%%

int main(void)
{
    yylex();
    return 0;
}
