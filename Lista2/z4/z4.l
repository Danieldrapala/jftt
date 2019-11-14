%{
  
#include <stdio.h>
#include <math.h>
#include "stack.h"

int yywrap();
int yylex();
void update();
void error_forbidden_char(char c);
void calculate(char* operand);
void cleaning_up();

List* list;
int isZero=1;
int numbers = 0;
int operands = 0;
char forbidden;
%}

NUMBER  "-"?[0-9]+
OP      [\+\-\*\/\^\%]
ERROR    [^0-9\+\-\*\/\^\%\"\t" ]

%x ERROR
%%
\n                   { update();cleaning_up();}
{ERROR}              {BEGIN(ERROR);  forbidden = *yytext;}
<ERROR>.*\n          { error_forbidden_char(forbidden);cleaning_up(); BEGIN(INITIAL); }
{NUMBER}             {++numbers; push(list, atoi(yytext));}
{OP}                 {++operands; calculate(yytext);}
%%

int yywrap() {
  return 1;
}

void cleaning_up(){
	if(!empty(list)){
	clean(list);
	
	list=create();	
	}
	operands = 0;
  	numbers = 0;
	isZero=1;
}
void update(){
  if(numbers==0 && operands ==0){
	printf("ERROR: No Arguments\n");
	return;
  }
  else if(numbers - operands > 1){
    	printf("ERROR: TOO MANY NUMBERS\n");		
	return;
  }
  else if(numbers - operands < 1){
   	printf("ERROR: TOO MANY OPERANDS\n");	
    	return;
  }
  if(list->count == 1&&isZero==1){
      printf("\nresult: %d\n", topelement(list));
    }
}

void error_forbidden_char(char c){
  	printf("ERROR: FORBIDDEN CHARACTER \"%s\"\n", &c);
}

void calculate(char* op){
  if(list->count < 2){
    printf("ERROR Op needs 2 arguments\n");
    return;
  }
  
  int a = pop(list);
  int b = pop(list);
  switch(*op){
    case '+': push(list, a+b); break;
    case '-': push(list, b-a); break;
    case '*': push(list, a*b); break;
    case '/':
      if(a == 0){
        printf("ERROR DIVIDING BY 0\n");
	isZero=0;
        return;
      }
      push(list, b/a);
      break;
    case '^': push(list, (int) pow((double)b,(double)a)); break;
    case '%': 
	if(a == 0){
        printf("ERROR Modulo BY 0\n");
	isZero=0;
        return;
	      }
	push(list, b%a);
	break;
    default: ;
  }


}

int main() {
  list = create();

  yylex();


  return 0;
}
