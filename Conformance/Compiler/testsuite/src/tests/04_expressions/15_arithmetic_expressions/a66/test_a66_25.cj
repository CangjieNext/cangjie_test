
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a66_25

  @Level:         1

  @Assertion:   4.15(66)   If overflow occurs, throwing an exception
  @Description: Checks for random integers x, y that x**y overflow causes an ArithmeticException if
                @OverflowThrowing is used.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6258
*/

import utils.assert.Assert
import std.random.Random

@OverflowThrowing
main() {
    for (x in 2..1024) {
        var y = 0u64
        try {
            while (true) {
                x ** y 
                -x ** y 
                y++
            }
        } catch (e : ArithmeticException) {}
    }

    let rnd = Random(123)
    for (_ in 0..1024) {
        var x : Int64
        do {
            x = rnd.nextInt64()
        } while (x > -1024 && x < 1024)
        let y = rnd.nextUInt64(UInt64.Max - 7) + 7
        var caught : Bool = false
        try {
            let a = x ** y
            println("${a}, ${x}, ${y}")
        } catch (e : OverflowException) {
            caught = true
        }
        Assert.isTrue(caught)
    }
}
