grammar ramm;

parse
  :  (t=. 
          {System.out.printf("text: %-7s  type: %s \n", 
           $t.text, tokenNames[$t.type]);}
     )* 
     EOF
  ;

block
 : (statement | functionDecl)* expression?
 ;

 statement
 : assignment 
 | functionCall 
 | ifStatement
 | forStatement
 | whileStatement
 ;

assignment
 : Identifier indexes? '=' expression
 ;

functionCall
 : Identifier '(' exprList? ')' #identifierFunctionCall
 | Println '(' expression? ')'  #printlnFunctionCall
 | Print '(' expression ')'     #printFunctionCall
 | Assert '(' expression ')'    #assertFunctionCall
 | Size '(' expression ')'      #sizeFunctionCall
 ;

 expression
 : '-' expression                           #unaryMinusExpression
 | '!' expression                           #notExpression
 | expression '^' expression                #powerExpression
 | expression '*' expression                #multiplyExpression
 | expression '/' expression                #divideExpression
 | expression '%' expression                #modulusExpression
 | expression '+' expression                #addExpression
 | 'return' expression			            #returnExpression
 | expression '-' expression                #subtractExpression
 | expression '>=' expression               #gtEqExpression
 | expression '<=' expression               #ltEqExpression
 | expression '>' expression                #gtExpression
 | expression '<' expression                #ltExpression
 | expression '==' expression               #eqExpression
 | expression '!=' expression               #notEqExpression
 | expression '&&' expression               #andExpression
 | expression '||' expression               #orExpression
 | expression '?' expression ':' expression #ternaryExpression
 | expression In expression                 #inExpression
 | Number                                   #numberExpression
 | Bool                                     #boolExpression
 | Null                                     #nullExpression
 | functionCall indexes?                    #functionCallExpression
 | list indexes?                            #listExpression
 | Identifier indexes?                      #identifierExpression
 | String indexes?                          #stringExpression
 | '(' expression ')' indexes?              #expressionExpression
 | Input '(' String? ')'                    #inputExpression
 ;



Println  : 'println';
Print    : 'print';
Input    : 'input';
Assert   : 'assert';
Size     : 'size';
Def      : 'def';
If       : 'if';
Else     : 'else';
Return   : 'return';
For      : 'for';
While    : 'while';
To       : 'to';
Do       : 'do';
End      : 'end';
In       : 'in';
Null     : 'null';
Or       : '||';
And      : '&&';
Equals   : '==';
NEquals  : '!=';
GTEquals : '>=';
LTEquals : '<=';
Pow      : '^';
Excl     : '!';
GT       : '>';
LT       : '<';
Add      : '+';
Subtract : '-';
Multiply : '*';
Divide   : '/';
Modulus  : '%';
OBrace   : '{';
CBrace   : '}';
OBracket : '[';
CBracket : ']';
OParen   : '(';
CParen   : ')';
SColon   : ';';
Assign   : '=';
Comma    : ',';
QMark    : '?';
Colon    : ':';


Bool
 : 'true' 
 | 'false'
 ;

assignment
 : Identifier indexes? '=' expression
 ;

Number
 : Int ('.' Digit*)?
 ;

Identifier
 : [a-zA-Z_] [a-zA-Z_0-9]*
 ;

String
 : ["] (~["\r\n] | '\\\\' | '\\"')* ["]
 | ['] (~['\r\n] | '\\\\' | '\\\'')* [']
 ;
Comment
 : ('//' ~[\r\n]* | '/*' .*? '*/') -> skip
 ;
Space
 : [ \t\r\n\u000C] -> skip
 ;
fragment Int
 : [1-9] Digit*
 | '0'
 ;
  
fragment Digit 
 : [0-9]
 ;