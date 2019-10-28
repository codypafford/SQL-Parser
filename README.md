# SQL-Parser
SImple SQL parser created using Lex/Bison.
Open a prompt, cd to the directory where your ".l" and ".y" are, and compile them with:
1. flex scanner.l
2. bison -dy best.y
3. gcc lex.yy.c y.tab.c -o my.exe
4. ./my.out input outputFile
