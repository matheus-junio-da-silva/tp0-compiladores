%{
#include <stdio.h>
/* Analisador lexico secundario - lex2.l */
%}

%option noyywrap

/* definicoes regulares */
delim       [ \t\n]
ws          {delim}+

cpf         [0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}
email       [a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}
horario     [0-2][0-9]:[0-5][0-9]
data        (0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[0-2])\/[0-9]{4}
dinheiro    [R][\$][ ]?[0-9]+(,[0-9]{2})?

%%

{ws}        { /* nenhuma acao */ }

{cpf}       { printf("Foi encontrado um CPF. LEXEMA: %s\n", yytext); }
{email}     { printf("Foi encontrado um email. LEXEMA: %s\n", yytext); }
{data}      { printf("Foi encontrada uma data. LEXEMA: %s\n", yytext); }
{horario}   { printf("Foi encontrado um horario. LEXEMA: %s\n", yytext); }
{dinheiro}  { printf("Foi encontrado um valor em Reais. LEXEMA: %s\n", yytext); }

.           { /* ignora eventuais caracteres que nao casem */ }

%%

int main(void)
{
    yylex();
    return 0;
}
