/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_05_a08_01

  @Level:         1
  @Assertion:   A.2.5(8)
    ifExpression
        : IF NL* LPAREN NL* (LET NL* deconstructPattern NL* BACKARROW NL*)? expression NL* RPAREN NL* block
        (NL* ELSE (NL* ifExpression | NL* block))?
        ;
    deconstructPattern
        : constantPattern
        | wildcardPattern
        | varBindingPattern
        | tuplePattern
        | enumPattern
        ;

  @Description: Check trivial if expressions.
                Reference to other tests in additional_tests.txt.
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

main() {
    if ({=> 1}() == 1) {
        {=> 0}()
    } else {
        {=> 1}()
    }

    if (1 + 1 != 1) {
        {=> 0}()
    }

    if ({=> 4}() != 2 * 2) {
        {=> 0}()
    } else if ({=> 3}() == 1) {
            {=> 0}()
        } else if ({=> 1}() == 1) {
                {=> 0}()
            } else {
                {=> 1}()
            }

    return 0
}
