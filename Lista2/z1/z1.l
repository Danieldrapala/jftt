%{
#include <stdio.h>

int yylex();
int yywrap();
int lines = 0;
int words = 0;

%}

%%
^[ \t]*\n*  ;
[ \t]+$     ;
[ \t]+ {printf(" "); words++;}
\n  {printf("\n"); lines++; words++;}
%%

int yywrap() {
	printf( "# of lines = %d, # of chars = %d\n",lines, words);
    return 1;
}

int main() {
	 
        FILE *fp; 
	char filename[50]; 
	scanf("%s",filename); 
	fp = fopen(filename,"r"); 
	yyin = fp; 
	yylex();
 	
  return 0;
}
