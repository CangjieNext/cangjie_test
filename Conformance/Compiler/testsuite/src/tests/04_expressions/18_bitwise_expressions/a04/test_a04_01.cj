
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_18_a04_01

  @Level:         1

  @Assertion:   4.18(4) For &, ^ and |, the value of the operation is a bit vector such that each bit is the value of
                applying the respective logical operations (i.e., logic AND and logic OR) on the bits of the
                corresponding operands. See the Logical Expressions for the semantics of each logic operation. Refer to
                the last section for the precedence and associativity of bitwise operators.
  @Description: Checks for random Int8 numbers a, b that corresponding bits of a, b and a & b, a ^ b, a | b satisfy
                the semantic requirements for these operations. Check for these numbers that operations are preserved
                in the {0, 1, &, |} -> {false, true, &&, ||} homomorphism.
  @Mode: run
  @Negative: no
  @Structure: complex-main
  @Dependencies: aux_a04.cj
  @CompileWarning: no

*/

import std.random.Random

main() {
    let rnd = Random(123)

    for (_ in 0..1024) {
        let lhs = rnd.nextInt8()
        let rhs = rnd.nextInt8()
        let and = lhs & rhs
        let xor = lhs ^ rhs
        let or = lhs | rhs

        for (i in 0u8..8u8) {
            let lhsBit = getBit(lhs, i)
            let rhsBit = getBit(rhs, i)
            let andBit = getBit(and, i)
            let xorBit = getBit(xor, i)
            let orBit = getBit(or, i)

            var andBitCheck : Int8
            if (lhsBit != 0 && rhsBit != 0) {
                andBitCheck = 1
            } else {
                andBitCheck = 0
            }
            Assert.equals(andBitCheck, andBit)

            var xorBitCheck : Int8
            if (lhsBit != rhsBit) {
                xorBitCheck = 1
            } else {
                xorBitCheck = 0
            }
            Assert.equals(xorBitCheck, xorBit)

            var orBitCheck : Int8
            if (lhsBit != 0 || rhsBit != 0) {
                orBitCheck = 1
            } else {
                orBitCheck = 0
            }
            Assert.equals(orBitCheck, orBit)

            var lhsBitBool = lhsBit != 0
            var rhsBitBool = rhsBit != 0
            var andBitBool = andBit != 0
            var orBitBool = orBit != 0
            Assert.equals(andBitBool, lhsBitBool && rhsBitBool)
            Assert.equals(orBitBool, lhsBitBool || rhsBitBool)
        }
    }
}
