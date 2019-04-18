%{
void yyerror (char *s);
#include <stdio.h>
#include <stdlib.h>
int yylex();
extern FILE *yyin;
%}
%start Program

%token ID NUM PLUS SUB MUL DIV EQUAL SEMIC LP RP COMMA COMP ATT REL BiOp WHERE RENAME AS LB RB


%%



Program: expression { if (yychar == YYEOF) {
                   // printf("accept");
                 }
                 else {
                    /* There is definitely an error. Probably do nothing. */
                 }
               } ;

expression	: onerelationexpression
		| tworelationexpression ;

onerelationexpression : renaming
			| restriction
			| projection ;

renaming 	: term RENAME attribute AS attribute ;

term 		: relation
		| LP expression RP ;

restriction	: term WHERE comparison ;

projection 	: term
		| term LB attributecommalist RB ;

attributecommalist 	: attribute
			| attribute COMMA attributecommalist ;

tworelationexpression	: projection binaryoperation expression ;

binaryoperation	: BiOp ;

comparison	: attribute compare number ;

compare		: COMP ;

number		: NUM ;

attribute 	: ATT ;

relation 	: REL ;
%%
int main(int argc, char *argv[])
{

   yyin = fopen(argv[1], "r");
   if (!yyin)
   {
      printf("no file\n");
      exit(0);
   }

   yyparse();
   printf("ACCEPT\n");

}
void yyerror(char *s)
{
   printf("REJECT\n");
//   printf("error from yyerror\n");
   exit(0);
}

