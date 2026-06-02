
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_18_a10_20

  @Level:         1

  @Assertion:   4.18(10) If the operand to the left of the operator is an unsigned integer or a positive integer, the
                bits are shifted to the left or right accordingly and zeros are used to fill the trailing positions
                after the shift (on the left if it is the right shift operator, or on the right if it is the left shift
                operator)
  @Description: Checks the semantics of operators << and >> for types Int16 and UInt16 when the left operand is not
                negative. 
  @Mode: run
  @Negative: no
  @Structure: complex-main
  @Dependencies: aux_a10.cj
  @CompileWarning: no

*/

import std.random.Random

main() {
    let rnd = Random(123)

    for (_ in 0..2**8) {
        let lhs = rnd.nextInt16(Int16.Max)
        for (i in 0u8..16u8) {
            let rhs = UInt16(i)
            let shl = lhs << rhs
            let shr = lhs >> rhs
            for (j in 0u8..(16u8-i)) {
                Assert.equals(getBit(shr, j), getBit(lhs, j + i))
                Assert.equals(getBit(lhs, j), getBit(shl, j + i))
            }
            for (j in 0u8..i) {
                Assert.equals(0, getBit(shl, j))
                Assert.equals(0, getBit(shr, 16-j-1))
            }
        }
    }
}
