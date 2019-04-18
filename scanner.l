%{
#include <stdio.h>
#include "y.tab.h"
%}
Delimiter    [ \t]
WhiteSpace   {Delimiter}+
Letter       [A-Za-z]
Digit        [0-9]
%option noyywrap

%%
{WhiteSpace}                  ;
[ \t\r\n]      ;
"+"                           return(PLUS);
"-"                           return(SUB);
"*"                           return(MUL);
"/"                           return(DIV);
";"                           return(SEMIC);
"("                           return(LP);
"["			      return(LB);
"]"			      return(RB);
")"                           return(RP);
","			      return(COMMA);

"<"			      return(COMP);
">"			      return(COMP);
"<="                          return(COMP);
">="			      return(COMP);
"="			      return(COMP);
"<>"			      return(COMP);
[0-9][0-9]*	return (NUM);
CNO			      return(ATT);
CITY			      return(ATT);
CNAME			      return(ATT);
SNO			      return(ATT);
PNO			      return(ATT);
TQTY			      return(ATT);
SNAME			      return(ATT);
QUOTA			      return(ATT);
PNAME			      return(ATT);
COST			      return(ATT);
AVQTY			      return(ATT);
"S"[0-9]+		      return(ATT);
STATUS			      return(ATT);
"P"[0-9]+		      return(ATT);
COLOR			      return(ATT);
WEIGHT			      return(ATT);
QTY			      return(ATT);

S			      return(REL);
P			      return(REL);
SP			      return(REL);
PRDCT			      return(REL);
CUST			      return(REL);
ORDERS			      return(REL);

UNION			      return(BiOp);
INTERSECT		      return(BiOp);
MINUS			      return(BiOp);
TIMES			      return(BiOp);
JOIN			      return(BiOp);
DIVIDEBY		      return(BiOp);

WHERE			      return(WHERE);
RENAME			      return(RENAME);
AS			      return(AS);
 
.	{ printf("REJECT\n"); exit(0);};


%% 

