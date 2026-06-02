/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_05_a15_01

  @Level:         1
  @Assertion:   A.2.5(15)
                lambdaExpression
                    : LCURL NL* lambdaParameters? NL* DOUBLE_ARROW NL* expressionOrDeclarations? RCURL
                    ;

                trailingLambdaExpression
                    : LCURL NL* (lambdaParameters? NL* DOUBLE_ARROW NL*)? expressionOrDeclarations? RCURL
                    ;

                lambdaParameters
                    : lambdaParameter (NL* COMMA NL* lambdaParameter)*
                    ;
                lambdaParameter
                    : (identifier | WILDCARD) (NL* COLON NL* type)?
                    ;

  @Description: Check trivial lambda expressions.
                Reference to other tests in additional_tests.txt.
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

main() {
    let l0: (Int8, Int8) -> Int8 = {a: Int8, b: Int8 => a + b }
    var l1: () -> Float32 = {
        => 4.6
    }
    let l2 = {a: Rune, b: Rune => String(a) + String(b)}
    return 0
}
