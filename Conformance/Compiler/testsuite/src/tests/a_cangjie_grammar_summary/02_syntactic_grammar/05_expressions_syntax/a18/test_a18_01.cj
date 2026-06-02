/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_05_a18_01

  @Level:         1
  @Assertion:   A.2.5(18)
                parenthesizedExpression
                    : LPAREN NL* expression NL* RPAREN
                    ;

  @Description: Check some parenthesized expressions.
                Reference to other tests in additional_tests.txt.
  @Mode:        compileOnly
  @Negative:    no
  @Structure:   single
*/

main() {
    let unused = (2 + 2)

    ("asd" + "dsa")

    (2 + 2) * 2

    (if ({=> true}()) {
        {=> 100}()
    } else {
        {=> -100}()
    })

    var arr = [1,2,3,4,5]
    var res = 0
    (

        for (x in arr) {
            res += x
        }

    )

    return 0
}
