/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_23_a05_02

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

  @Description: Check examples which should be supported, but they are not due to compiler bug.

  @Mode: run

  @Negative: no

  @CompileWarning: Ignore

  @Issue: 0006488
*/

class C {}

main() {
    var x = 0
    var y = 0
    var b = true
    var c = C()

    // Rule: tupleLeftValueExpression =
    //           `(` (leftValueExpression | tupleLeftValueExpression)
    //               (`,` (leftValueExpression | tupleLeftValueExpression))+ `,`?
    //           `)`
    // Case: tupleLeftValueExpression = `(` leftValueExpression `,` leftValueExpression `,` `)`
    (x, b,) = (3, true,)

    // Rule: tupleLeftValueExpression =
    //           `(` (leftValueExpression | tupleLeftValueExpression)
    //               (`,` (leftValueExpression | tupleLeftValueExpression))+ `,`?
    //           `)`
    // Case: tupleLeftValueExpression = `(` leftValueExpression `,` tupleLeftValueExpression `,` `)`
    (x, (b, c),) = (3, (true, C()),)

    // Rule: tupleLeftValueExpression =
    //           `(` (leftValueExpression | tupleLeftValueExpression)
    //               (`,` (leftValueExpression | tupleLeftValueExpression))+ `,`?
    //           `)`
    // Case: tupleLeftValueExpression = `(` tupleLeftValueExpression `,` leftValueExpression `,` `)`
    ((x, c), b,) = ((3, C()), true,)

    // Rule: tupleLeftValueExpression =
    //           `(` (leftValueExpression | tupleLeftValueExpression)
    //               (`,` (leftValueExpression | tupleLeftValueExpression))+ `,`?
    //           `)`
    // Case: tupleLeftValueExpression = `(` tupleLeftValueExpression `,` tupleLeftValueExpression `,` `)`
    ((x, c), (y, b),) = ((3, C()), (4, true),)
}
