
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_04_a03_01

  @Level:         1

  @Assertion:   4.7.4(3) In the following example, an ArithmeticException is thrown when the divisor is 0.
                func div(a: Int32, b: Int32): Int32 { 
                    if (b != 0) {
                        return a / b
                    } else {
                        throw ArithmeticException()
                    }
                }
  @Description: Checks the given example. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

func div(a: Int32, b: Int32): Int32 { 
    if (b != 0) {
        return a / b
    } else {
        throw ArithmeticException()
    }
}

main() {
    var caught = false
    var res = 12345i32

    try {
        res = div(1, 0)
    } catch (e : ArithmeticException) {
        caught = true
    }

    Assert.equals(12345, res)
    Assert.isTrue(caught)
}
