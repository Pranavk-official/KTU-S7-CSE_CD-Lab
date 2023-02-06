# Algorithm

## [CYCLE 1](./Cycle%201/README.md)

### 1. To Implement a lexical analyzer in C.



### 2. To write a program for implementing a Lexical analyser using LEX tool

- Start the program and include the necessary header file <stdio.h>.
- Define the regular expressions to match the different token types, such as keywords, preprocessor directives, identifiers, numbers, comments, and unknown tokens.
- Use the yyin variable to open the input file "input.c" for reading.
- Call the yylex() function to start the lexical analysis.
- The yylex() function will match the input text against the defined regular expressions and print the token type and its corresponding text for each match.
- The yywrap() function will return 1 when the end of the input file is reached.
- The main() function will return 0 to indicate successful execution.

### 3. LEX Program to count the number of lines and number of characters in an input.

- The code starts with the declaration of 4 integer variables lc, sc, tc, and ch to keep track of the number of lines, spaces, tabs, and characters in the file respectively.
- The code then opens the file "input.c" in read mode and assigns it to the variable fp.
- The contents of the file are then passed to the lexical analyzer through the yyin variable.
- The lexical analyzer uses the rules specified in the %% section to count the number of lines, spaces, tabs, and characters in the file.

- The rules specify that each time a newline character (\n) is encountered, the variable lc is incremented by 1.
- Similarly, for each sequence of spaces (([ ])+), the variable sc is incremented by 1.

- For each tab character (\t), the variable tc is incremented by 1.

- For each other character (.), the variable ch is incremented by 1.

- After the lexical analysis is complete, the final values of the variables lc, sc, tc, and ch are printed, which represent the number of lines, spaces, tabs, and characters in the file respectively.

- The program then returns 0, indicating successful execution.

### 4. LEX Program to remove space, tab or newline

- Include the standard input/output library stdio.h
- Initialize four integer variables, lc, sc, tc, and ch, to 0.
- Open the file input.c in read mode and assign its pointer to fp.
- Assign the fp to yyin.
- Call the yylex function.
- In the yylex function:
  - a. If the current character is a newline (\n) or a tab (\t), do not print it.
  - b. If the current character is any other character, print it.
- Return 0 from the main function.

### 5. Generate a YACC specification to recognize a valid identifier which starts with a letter followed by any number of letters or digits.

- The lexer code uses regular expressions to recognize tokens in the input. It matches sequences of characters against the defined regular expressions, and returns the corresponding token for each match.
- The lexer code recognizes the following tokens:
    - Identifiers, which are sequences of alphabets or underscores followed by alphabets, underscores, or numbers.
    - Numbers, which are sequences of digits.
    - Any other character.
- The YACC code defines a grammar that specifies how sequences of tokens can be combined to form valid sentences.
- The YACC code defines two non-terminal symbols: start and s.
- The start symbol is defined to match an identifier followed by s.
- The s symbol is defined to match either an identifier followed by s, a number followed by s, or nothing.
- If the input to the YACC code is a valid sentence according to the defined grammar, the yyparse function returns successfully.
- If the input is not a valid sentence, the yyerror function is called and sets the valid flag to 0.
- In the main function, the yyparse function is called to parse the input, and the result of the parse is checked using the valid flag. If valid is 1, the input is a valid identifier, and a message is printed to indicate this. If valid is 0, the input is not a valid identifier, and a different message is printed to indicate this.

### 6. LEX Program to count the number of vowels and consonants



### 7. Generate a YACC specification to recognize a valid arithmetic expression that uses operators +, – , *,/ and parenthesis.

- The LEX code scans the input string, character by character, and matches each character against the defined regular expressions.
  
- For each matched regular expression, the LEX code returns a token to the parser defined in the YACC code.
  
- The YACC code builds a parse tree by matching the input tokens against the set of grammar rules.
  
- The parse tree is evaluated by recursively evaluating the sub-trees and combining the results to evaluate the expression represented by the parse tree.
  
- The result of the evaluation is printed by the main function in the YACC code.
  
- If the input expression is invalid, the YACC code prints an error message indicating that the expression is invalid.
 

## [CYCLE 2](./Cycle%202/README.md)
### 8. Implementation of Calculator using LEX and YACC

- The LEX code scans the input string, character by character, and matches each character against the defined regular expressions.
- For each matched regular expression, the LEX code returns a token to the parser defined in the YACC code.
- The YACC code builds a parse tree by matching the input tokens against the set of grammar rules.
- The parse tree is evaluated by recursively evaluating the sub-trees and combining the results to evaluate the expression represented by the parse tree.
- The result of the evaluation is printed by the main function in the YACC code.
- If the input expression is invalid, the YACC code prints an error message indicating that the expression is invalid.
  
### 9. Write a LEX Program to convert the substring abc to ABC from the given input string

- The code starts with the declaration of two file pointers, fp and fp1.
- The yytext variable is used in the lexical rules to refer to the matched text.
- The lexical rules are defined in the second section of the code, between the two %% lines. The first rule matches any lowercase alphabet and outputs the corresponding uppercase character to the fp1 file. The second rule matches any other character and outputs that character to the fp1 file.
- The main function starts by opening the fp1 file for writing. If the file cannot be opened, an error message is printed and the program returns 0.
- The fp file is then opened for reading. If the file cannot be opened, an error message is printed and the program returns 0.
- The fp file is then assigned to the yyin variable, which is used by the yylex function to read input.
- The yylex function is called to process the input and generate the output. The function applies the lexical rules to each character in the input file, and outputs the result to the fp1 file.
- The program returns 0 after the yylex function has completed.

### 10. Implementation of DFA

- Define the lexer rules for different states (INITIAL, A, B, C, and DEAD)
- Initialize the state to INITIAL
- Read in the input string character by character
- Based on the current state and the character, transition to the next state using the rules defined in the lexer
- If the next state is INITIAL, print "Not Accepted"
- If the next state is DEAD, print "Invalid"
- If the next state is B, print "Accepted"
- Repeat steps 4-7 for each character in the input string
- Return 0 at the end of the main function.

### 11. Implementation of Top down Parser (Recursive descent parser)
### 12. Simulation of code optimization techniques
### 13. Implement intermediate code generation for simple expressions
### 14. Implement backend of the compiler

- Declare an array "icode" to store intermediate code, a string "str" to store a single intermediate code, and an array "opr" to store the corresponding target code.
- Read the set of intermediate code and store it in the "icode" array. Continue reading and storing intermediate code until the user inputs "exit".
- Generate the target code using a do-while loop.
- Within the loop, use the strcpy function to copy the current intermediate code from "icode" to "str".
- Use a switch statement to determine the operation in the intermediate code (addition, subtraction, multiplication, or division) based on the value of str[3].
- Store the corresponding target code operation in the "opr" array.
- Print the target code by using printf statements.
- Continue generating target code for each intermediate code in "icode" until the "exit" string is encountered.
- End the program.
