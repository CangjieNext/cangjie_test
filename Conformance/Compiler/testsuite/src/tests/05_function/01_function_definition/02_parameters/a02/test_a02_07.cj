/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_a02_07

  @Level:         1

  @Assertion:     5.1.2(2) The syntax of the parameter list is as follows: 
    functionParameters 
         : ('(' (unnamedParameterList (',' namedParameterList)? )? ')') 
           | ('(' (namedParameterList)? ')') 
         ; 
    nondefaultParameterList 
         : unnamedParameter (',' unnamedParameter)* (',' namedParameter)* 
         | namedParameter (',' namedParameter)* 
         ; 
    namedParameterList 
         : (namedParameter | defaultParameter) (',' (namedParameter | defaultParameter))* 
         ; 
    namedParameter 
        : identifier '!' ':' type 
        ; 
    defaultParameter 
        : identifier '!' ':' type '=' expression 
        ; 
    unnamedParameterList 
        : unnamedParameter (',' unnamedParameter)* 
        ; 
    unnamedParameter 
        : (identifier | '_') ':' type
        ;

  @Description:   Check that function definition with wrong parameter syntax will produce an error:
                  named wildcard parameter.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

func myFuncWithNamedWildCardParameter(_!: String) {
  "AAA"
}

main() {
}
