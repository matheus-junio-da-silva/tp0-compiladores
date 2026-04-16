%{
#include <stdio.h>
/*codigo colocado aqui aparece no arquivo gerado pelo flex*/
%}

/* This tells flex to read only one input file */
%option noyywrap

/* definicoes regulares */
delim       [ \t\n]
ws          {delim}+

placa       [A-Z]{3}-[0-9]{4}
telefone    [0-9]{4}-[0-9]{4}
nome        [a-zA-Z]+([ ][a-zA-Z]+){2,3}
decimal     [-+]?[0-9]+\.[0-9]+
inteiro_neg -[0-9]+
inteiro_pos \+?[0-9]+
palavra     [a-zA-Z]+

%%

{ws}            { /* nenhuma acao e nenhum retorno */ }

{nome}          { printf("Foi encontrado um nome proprio. LEXEMA: %s\n", yytext); }
{placa}         { printf("Foi encontrado uma placa. LEXEMA: %s\n", yytext); }
{telefone}      { printf("Foi encontrado um telefone. LEXEMA: %s\n", yytext); }
{decimal}       { printf("Foi encontrado um numero com parte decimal. LEXEMA: %s\n", yytext); }
{inteiro_neg}   { printf("Foi encontrado um numero inteiro negativo. LEXEMA: %s\n", yytext); }
{inteiro_pos}   { printf("Foi encontrado um numero inteiro positivo. LEXEMA: %s\n", yytext); }
{palavra}       { printf("Foi encontrado uma palavra. LEXEMA: %s\n", yytext); }

.               { /* ignora eventuais caracteres que nao casem com os padroes */ }

%%

/*codigo em C. Foi criado o main, mas podem ser criadas outras funcoes aqui.*/

int main(void)
{
    /* Call the lexer, then quit. */
    yylex();
    return 0;
}
