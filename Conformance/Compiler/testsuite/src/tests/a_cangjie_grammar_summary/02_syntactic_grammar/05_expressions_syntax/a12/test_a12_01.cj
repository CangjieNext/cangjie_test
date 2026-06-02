/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_05_a12_01

  @Level:         1
  @Assertion:   A.2.5(12)
                jumpExpression
                    : THROW NL* expression
                    | RETURN (NL* expression)?
                    | CONTINUE
                    | BREAK
                    ;

  @Description: Check trivial jump expressions.
                Reference to other tests in additional_tests.txt.
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

func foo1() {
    if ({=> true}()) {return 1}
    1 + 2
}

func foo2() {
    if ({=> true}()) {throw Exception("Ooops")}
    3 + 4
}

main() {
    foo1()

    try {
        foo2()
    } catch(e: Exception) { }

    var arr = [1, 2, 3, 4]
    var mul = 1
    for (x in arr) {
        mul *= x
        if (mul > 10) {
            break
        }
    }

    for (x in arr) {
        if (x < 2) {
            continue
        }
        mul *= x
    }

    return 0
}
