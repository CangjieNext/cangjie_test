/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_18_a09_036

  @Level:         1

  @Assertion:   4.18(9) Furthermore, the operand right of the operator must not be a negative number. Otherwise, a
                compilation error will be reported if it is detected at compile time, or an ArithmeticException is
                thrown at run-time.
  @Description: Checks that ArithmeticException is thrown when the right operand of >> is a negative number for types
                UInt8 and Int16.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6338

*/

import utils.assert.Assert
import std.random.Random

main() {
    let rnd = Random(123)

    for (_ in 0..2**10) {
        let x = rnd.nextUInt8()
        let y = rnd.nextInt16(Int16.Max) + Int16.Min
        Assert.isTrue(y < 0)
        var caught = false
        try {
            x >> y
        } catch (e : ArithmeticException) {
            caught = true
        }
        Assert.isTrue(caught)
    }
}
