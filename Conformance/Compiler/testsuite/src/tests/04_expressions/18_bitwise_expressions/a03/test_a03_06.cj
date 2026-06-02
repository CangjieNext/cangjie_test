
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_18_a03_06

  @Level:         1

  @Assertion:   4.18(3) The operand is regarded as a bit vector and the bitwise operator is applied bit-by-bit
                (for logic operations, regarding 0 as false and 1 as true).
  @Description: Checks match between bit vectors of left operand of shift and result for Int16.
  @Mode: run
  @Negative: no
  @Structure: complex-main
  @Dependencies: aux_a03.cj
  @CompileWarning: no

*/

import std.random.Random

main() {
    let rnd = Random(123)

    for (i in 0..512) {
        let lhs = rnd.nextUInt64()
        for (j in 0u8..16u8) {
            let shl = lhs << j
            let shr = lhs >> j
            for (k in 0u8..(16-j)) {
                Assert.equals(getBit(shr, k), getBit(lhs, k + j))
                Assert.equals(getBit(lhs, k), getBit(shl, k + j))
            }
        }
    }
}

