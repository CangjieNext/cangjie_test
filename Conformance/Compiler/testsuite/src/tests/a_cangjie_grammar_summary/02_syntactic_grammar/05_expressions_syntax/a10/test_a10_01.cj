/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_05_a10_01

  @Level:         1
  @Assertion:   A.2.5(10)
    loopExpression
        : forInExpression
        | whileExpression
        | doWhileExpression
        ;
    forInExpression
        : FOR NL* LPAREN NL* patternsMaybeIrrefutable NL* IN NL* expression NL* patternGuard? NL* RPAREN NL* block
        ;
    patternsMaybeIrrefutable
        : wildcardPattern
        | varBindingPattern
        | tuplePattern
        | enumPattern
        ;

    whileExpression
        : WHILE NL* LPAREN NL* (LET NL* deconstructPattern NL* BACKARROW NL*)? expression NL* RPAREN NL* block
        ;

    doWhileExpression
        : DO NL* block NL* WHILE NL* LPAREN NL* expression NL* RPAREN
        ;

  @Description: Check trivial loop expressions.
                Reference to other tests in additional_tests.txt.
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

main() {
    var arr = [1, 2, 3, 4]
    var mul = 1
    for (x in arr) {
        mul *= x
    }

    var x = 5
    while (x <= 7) {
        mul *= x
        x++
    }

    do {
        mul *= x
        x++
    } while (mul <= 10000)

    return 0
}
