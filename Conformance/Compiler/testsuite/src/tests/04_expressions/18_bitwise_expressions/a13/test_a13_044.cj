
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_18_a13_044

  @Level:         1

  @Assertion:   4.18(13) If the value of the right operand of the bitwise left/right shift operator is equal to or
                greater than the length of the left operand, overshift occurs and a compilation error is reported if it
                is detected at compile time or a run-time exception is thrown.
  @Description: Checks that having right operand equal to bitsize of type of the left operand for bitwise shift
                operators for types UInt32 and UInt16 results in a run-time exception.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert
import std.random.Random

func f(lhs : UInt32, rhs : UInt16) {
    var caught = false
    try {
        lhs << rhs
    } catch (_) {
        Assert.isTrue(rhs >= 32)
        caught = true
    }
    Assert.isTrue(caught)
    caught = false
    try {
        lhs >> rhs
    } catch (_) {
        Assert.isTrue(rhs >= 32)
        caught = true
    }
    Assert.isTrue(caught)
}

main() {
    let rnd = Random(123)

    for (_ in 0..2**10) {
        let lhs = rnd.nextUInt32()
        f(lhs, 32)
        let rhs = rnd.nextUInt16(UInt16.Max - 32) + 32
        f(lhs, rhs)
        f(0, rhs)
    }
}
