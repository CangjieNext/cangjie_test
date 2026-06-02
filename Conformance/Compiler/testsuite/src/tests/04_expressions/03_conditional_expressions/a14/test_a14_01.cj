/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:      04_03_a14_01

  @Level:         1

  @Assertion: 4.3(14) For if expressions containing else branches: When if 
              expression is not read or returned, then the type of the if 
              expression is Unit, and the two branches’ types are not required
              to have common supertype; 
  @Description: Checks that if `if` expression without `else` branch is not read
                or returned, two branches’ types are not required to have common 
                supertype.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore
  @Comment: Seems like we cannot clearly check the result expression type and 
            value if the assert supposes that if-expression should not be read
            or returned. So here some if-expressions with different branch 
            types are called.

*/

import utils.assert.Assert

var x = 0

main() {
    if (Assert.getRuntimeZero() == 0) {
        1
    } else if (x == 3) {
        Assert.fail(reason: "Should not reach here")
    } 

    if (Assert.getRuntimeZero() != 0) {
        println("1")
    } else if (2 != 5) {
        2 
    } 

    if (x == 0) {
        (0, 1)
    } else if (x == 1) {
    } 

    if (x == 0) {
        x
    } else if (x == 1) {
        3.1428
    } 

    if (x == 0) {
        "1"
    } else if (x == 1) {
        "2"
    } else if (x == 2) {
        "3"
    } else if (x == 3) {
        ()
    }

    if (x == 0) {
        0
    } else if (x == 1) {
        Int32(1)
    } else if (x == 2) {
        3.1428
    } else if (x == 3) {
        "X == 3"
    } else if (x == 4) {
        ()
    } else if (x == 5) {
        println("Hello")
    } else if (x == 6) {
        x == 6 || x == 7
    } else if (x == 7) {
        (1, 2, 3)
    } else if (x == 8) {
        [1, 2, 3]
    } else if (x == 9) {
        Assert.getRuntimeZero()
    } else if (x == 10) {
        'a'
    }
}
