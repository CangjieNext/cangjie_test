
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_18_a03_09

  @Level:         1

  @Assertion:   4.18(3) The operand is regarded as a bit vector and the bitwise operator is applied bit-by-bit
                (for logic operations, regarding 0 as false and 1 as true).
  @Description: Checks that changing an operand's bits in several positions only affects result in these very positions
                for &, ^, | for Int32.
  @Mode: run
  @Negative: no
  @Structure: complex-main
  @Dependencies: aux_a03.cj
  @CompileWarning: no

*/

import std.random.Random

main() {
    let rnd = Random(123)

    let lhs = rnd.nextInt32()
    let rhs = rnd.nextInt32()
    let and = lhs & rhs
    let xor = lhs ^ rhs
    let or = lhs | rhs
    let inv = !lhs

    for (i in 0..1024) {
        let newLhs = rnd.nextInt32()
        let newRhs = rnd.nextInt32()
        let newAndLhs = newLhs & rhs
        let newAndRhs = lhs & newRhs
        let newXorLhs = newLhs ^ rhs
        let newXorRhs = lhs ^ newRhs
        let newOrLhs = newLhs | rhs
        let newOrRhs = lhs | newRhs
        let newInv = !newLhs
        for (j in 0u8..32u8) {
            let andBit = getBit(and, j)
            let xorBit = getBit(xor, j)
            let orBit = getBit(or, j)

            if (getBit(lhs, j) == getBit(newLhs, j)) {
                Assert.equals(andBit, getBit(newAndLhs, j))
                Assert.equals(xorBit, getBit(newXorLhs, j))
                Assert.equals(orBit, getBit(newOrLhs, j))
                Assert.equals(getBit(inv, j), getBit(newInv, j))
            }

            if (getBit(rhs, j) == getBit(newRhs, j)) {
                Assert.equals(andBit, getBit(newAndRhs, j))
                Assert.equals(xorBit, getBit(newXorRhs, j))
                Assert.equals(orBit, getBit(newOrRhs, j))
            }
        }
    }
}

