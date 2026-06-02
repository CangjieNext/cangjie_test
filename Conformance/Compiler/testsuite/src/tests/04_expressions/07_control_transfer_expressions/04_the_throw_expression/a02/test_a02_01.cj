
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_04_a02_01

  @Level:         1

  @Assertion:   4.7.4(2) When a throw expression is evaluated, the corresponding exception is thrown, which is caught
                and processed by the exception handling mechanism. In this way, the control flow of the program can
                be changed.
  @Description: Checks that E in throw E can be handled. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

func f() {
    throw ArithmeticException("ArithmeticException")
}

main() {
    var caught = 0

    try {
        throw ArithmeticException("ArithmeticException")
    } catch (e : OverflowException) {
        Assert.equals("OverflowException", e.message)
    } catch (e : ArithmeticException) {
        Assert.equals("ArithmeticException", e.message)
        caught++
    }
    
    try {
        f()
    } catch (e : OverflowException) {
        Assert.equals("OverflowException", e.message)
    } catch (e : ArithmeticException) {
        Assert.equals("ArithmeticException", e.message)
        caught++
    }

    Assert.equals(2, caught)
}
