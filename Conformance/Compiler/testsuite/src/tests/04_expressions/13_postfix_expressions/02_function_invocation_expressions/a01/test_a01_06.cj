/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_02_a01_06

  @Level:         1

  @Assertion: 4.13.2(1) The syntax of a function invocation expression is defined as the rule 4
              of the syntax of the postfix
              expression above, where the syntax of callSuffix and valueArgument is defined as.

              callSuffix
                  : '(' (valueArgument (',' valueArgument)*)? ')'
                  ;

              valueArgument
                  : identifier ':' expression
                  | expression
                  | refTransferExpression
                  ;

              refTransferExpression
                  : 'inout' (expression '.')? identifier
                  ;

  @Description: Check that usage of "identifier ':' expression" rule without identifier causes a compilation error.

  @Mode: compileonly

  @Negative: yes
*/

// NOTE: Rule 4: "postfixExpression callSuffix"

func sayMyName(name!: String) {}

main() {
    sayMyName(: "Catherine")
}

