
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a67_25

  @Level:         1

  @Assertion:   4.15(67) @OverflowWrapping If overflow occurs, wrapping around at the numeric bounds of the type,
                instead of throwing exception
  @Description: Checks for integer a, b that if a ** b overflows in a function marked by @OverflowWrapping, the
                exception will not be thrown and the operation will be calculated by wrapping around at the numeric
                bounds.
  @Mode: run
  @Negative: no
  @Structure: complex-main
  @Dependencies: aux_a67.cj
  @CompileWarning: no
*/

import utils.assert.Assert
import std.random.Random

func f(a: Int64, b: UInt64) {
    a ** b
}

@OverflowWrapping
func g(a: Int64, b: UInt64) {
    a ** b
}

func exp(a: Int64, b: UInt64) {
    var c = b
    var res = 1
    var d = a
    while (c != 0) {
        if (c % 2 == 1) {
          res = mul(res, d)
        }
        d = mul(d, d)
        c >>= 1
    }
    return res
}

main() {
    let rnd = Random(123)
    var overflowCount : Int32 = 0

    do {
        let a = rnd.nextInt64()
        let b = UInt64(rnd.nextUInt32())
        try {
            f(a, b)
        } catch (e: ArithmeticException) {
            overflowCount++
            let wrapped = g(a, b)
            Assert.equals(wrapped, exp(a, b))
        }
    } while (overflowCount < 1024)
}
