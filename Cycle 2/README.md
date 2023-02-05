# CYCLE 2

## 8. Implementation of Calculator using LEX and YACC

> To run the file the commands are :
>> \$ `lex calc.l` <br>
>> \$ `yacc calc.y -d` <br>
>> \$` gcc lex.yy.c y.tab.c -lfl -o calc` <br>
>> \$`./calc` 

> Output :
>> ![out8]() 


## 9. Write a LEX Program to convert the substring abc to ABC from the given input string

> To run the file the commands are :
>> \$ `lex calc.l` <br>
>> \$` gcc lex.yy.c -lfl -o upper` <br>
>> \$`./upper` 

> Output :
>> ![out9]() 


## 10. Implementation of DFA

> **Transition diagarm : :**
![Transition Diagram](https://media.geeksforgeeks.org/wp-content/uploads/20210711085632/improve-300x231.jpg)

> To run the file the commands are :
>> \$ `lex dfa.l` <br>
>> \$` gcc lex.yy.c -lfl -o dfa` <br>
>> \$`./dfa` 

> Output :
>> ![out10]() 


## 11. Implementation of Top down Parser (Recursive descent parser)

> To run the file the commands are :
>> \$` gcc top-down-parser.c -o tdp` <br>
>> \$`./tdp` 

> Output :
>> ![out11]() 

## 12. Simulation of code optimization techniques

> To run the file the commands are :
>> \$` gcc -c -S -O2 file.c -o file` <br>
>> \$`./file` 

> Input : 
>> ``` #include<stdio.h>
>> void main()
>> {
>>     int a, b, c;
>>     a =10;
>>     b = a*4;
>>     c = b+10;
>>     printf("The value of c is %d",c);
>> }
>> 
>> ```

> Output :
>> ![out11]() 

## 13. Implement intermediate code generation for simple expressions

> To run the file the commands are :
>> \$ `lex lex.l` <br>
>> \$ `yacc yacc.y -d` <br>
>> \$` gcc lex.yy.c y.tab.c -lfl -o icg` <br>
>> \$`./icg` 

> Output :
>> ![out13]() 

## 14. Implement backend of the compiler

> To run the file the commands are :
>> \$` gcc -c -S -O2 file.c -o backend` <br>
>> \$`./backend` 

> Output :
>> ![out14]() 