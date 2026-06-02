
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a03_01

  @Level:         1

  @Assertion:   4.15(3)  The syntax of arithmetic expressions are defined as:
                prefixUnaryExpression
                    : prefixUnaryOperator* incAndDecExpression
                    ;
                prefixUnaryOperator
                    : '-'
                    | ...
                    ;
                additiveExpression
                    : multiplicativeExpression (additiveOperator multiplicativeExpression)*
                    ;
                multiplicativeExpression
                    : exponentExpression (multiplicativeOperator exponentExpression)*
                    ;
                exponentExpression
                    : prefixUnaryExpression (exponentOperator prefixUnaryExpression)*
                    ;
                additiveOperator
                    : '+' | '-'
                    ;
                multiplicativeOperator
                    : '*' | '/' | '%'
                    ;
                exponentOperator
                    : '**'
                    ;
  @Description: Validates some examples illustrating the grammar definition above. 
  @Mode: compileonly
  @Negative: no
  @Structure: single
  @CompileWarning: no
*/

main() {
    let expr = 1.0
    // prefixUnaryOperator
    -expr
    // prefixUnaryExpression
    -(-expr)
    // exponentOperator
    expr ** expr
    // multiplicativeOperator
    expr * expr
    expr / expr
    Int64(expr) % Int64(expr)
    // additiveOperator
    expr + expr
    expr - expr
    // exponentExpression
    -(-expr) ** expr
    -(-expr) ** expr ** expr
    // multiplicativeExpression
    expr / expr ** expr
    -(-expr) ** expr * -(-expr)
    -(-expr) ** expr * -(-expr) ** expr ** expr
    Int64(-(-expr) ** expr / -(-expr) ** expr ** expr) % Int64(expr)
    // additiveExpression
    expr - expr ** expr
    -(-expr) ** expr * -(-expr) + -(-expr) ** expr * -(-expr)
    -(-expr) ** expr * -(-expr) - -(-expr) ** expr * -(-expr) ** expr ** expr + -(-expr) ** expr * -(-expr)
    0
}
