
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_18_a11_02

  @Level:         1

  @Assertion:   4.18(11) Otherwise (i.e., the operand to the left of the operator is a signed negative integer), 1 is
                used to fill the trailing positions after the shift (on the left it is the right shift operator or on
                the right if it is the left shift operator).
  @Description: Checks the bits on trailing positions after the left and right shifts for types Int8 and UInt8 when
                the left operand is negative.
  @Mode: run
  @Negative: no
  @Structure: complex-main
  @Dependencies: aux_a11.cj
  @CompileWarning: no

*/

import std.random.Random

main() {
    let rnd = Random(123)

    for (_ in 0..2**10) {
        let lhs = rnd.nextInt8(Int8.Max) + Int8.Min
        for (i in 0u8..8u8) {
            let rhs = UInt8(i)
            let shl = lhs << rhs
            let shr = lhs >> rhs
            for (j in 0u8..i) {
                Assert.equals(0, getBit(shl, j))
                Assert.equals(1, getBit(shr, 8-j-1))
            }
        }
    }
}
