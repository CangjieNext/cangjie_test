/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_03_a07_01

  @Level:         1

  @Assertion: 4.3(7) The value of the if expression is equal to the value of 
              the expression in the branch that be executed.
  @Description: Checks that the value of the if-expression is equal to the
                value of the expression in the branch that was executed.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: Ignore
  @Issue: 0006375

*/

import utils.assert.Assert

func returnBool(b: Bool) {
    b
}

main() {
    var x1 = 
        if (returnBool(false)) {
            1
        } else {
            2
        }
    Assert.equals(2, x1)

    var x2 =
        if (returnBool(true)) {
            1
        } else {
            2
        }
    Assert.equals(1, x2)

    var x3 = 
        if (returnBool(true)) {
            1
        } else if (returnBool(false)) {
            2
        } else {
            3
        }
    Assert.equals(1, x3)

    var x4 = 
        if (returnBool(false)) {
            1
        } else if (returnBool(true)) {
            2
        } else {
            3
        }
    Assert.equals(2, x4)

    var x5 =
        if (returnBool(false)) {
            1
        } else if (returnBool(false)) {
            2
        } else {
            3
        }
    Assert.equals(3, x5)

    var x6 =
        if (returnBool(true)) {
            1
        } else if (returnBool(false)) {
            2
        } else if (returnBool(true)) {
            3
        } else {
            4
        }
    Assert.equals(1, x6)

    var x7 = 
        if (returnBool(false)) {
            1
        } else if (returnBool(true)) {
            2
        } else if (returnBool(true)) {
            3
        } else {
            4
        }
    Assert.equals(2, x7)

    var x8 = 
        if (returnBool(false)) {
            1
        } else if (returnBool(false)) {
            2
        } else if (returnBool(true)) {
            3
        } else {
            4
        }
    Assert.equals(3, x8)

    var x9 =
        if (returnBool(false)) {
            1
        } else if (returnBool(false)) {
            2
        } else if (returnBool(false)) {
            3
        } else {
            4
        }
    Assert.equals(4, x9)
}
