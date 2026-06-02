/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_23_a05_05

  @Level:         1

  @Assertion: 4.23(5)
              Assignment operators are divided into ordinary and compound assignment operators, and the syntax of an
              assignment expression is defined as follows.

              assignmentExpression
                  : leftValueExpressionWithoutWildCard assignmentOperator flowExpression
                  | leftValueExpression '=' flowExpression
                  | tupleLeftValueExpression `=` flowExpression
                  | flowExpression
                  ;

              tupleLeftValueExpression
                  : `(` (leftValueExpression | tupleLeftValueExpression)
                        (`,` (leftValueExpression | tupleLeftValueExpression))+ `,`?
                     `)`
                  ;

              leftValueExpression
                  : leftValueExpressionWithoutWildCard
                  | '_'
                  ;

              leftValueExpressionWithoutWildCard
                  : identifier
                  | leftAuxExpression '?'? assignableSuffix
                  ;

              leftAuxExpression
                  : identifier typeArguments?
                  | type
                  | thisSuperExpression
                  | leftAuxExpression ('?')? '.' identifier typeArguments?
                  | leftAuxExpression ('?')? callSuffix
                  | leftAuxExpression ('?')? indexAccess
                  ;

              assignableSuffix
                  : fieldAccess
                  | indexAccess
                  ;

              fieldAccess
                  : '.' identifier
                  ;

              assignmentOperator
                  : '='
                  | '+='
                  | '-='
                  | '**='
                  | '*='
                  | '/='
                  | '%='
                  | '&&='
                  | '||='
                  | '&='
                  | '|='
                  | '^='
                  | '<<='
                  | '>>='
                  ;

  @Description: Check that tupleLeftValueExpression without ')' causes a compilation error.

  @Mode: compileonly

  @Negative: yes
*/

main() {
    var x = 0
    var y = 0
    (x, y = (3, 4)
    return
}

