/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan constructor 'init' is deprecated. Use member function `public static func parse(value: String, radix!: Int64): BigInt` instead.
// ASSERT: scan function 'lowestOneBit' is deprecated. Use global function `public func trailingZeros(x: BigInt): Int64` instead.
// ASSERT: scan function 'quo' is deprecated. Use member function `public func divAndMod(other: BigInt): (BigInt, BigInt)` instead.
// ASSERT: scan function 'quoAndRem' is deprecated. Use member function `public func divAndMod(other: BigInt): (BigInt, BigInt)` instead.
// ASSERT: scan function 'rem' is deprecated. Use member function `public func divAndMod(other: BigInt): (BigInt, BigInt)` instead.

import std.math.numeric.*

main(): Unit {
    let int: BigInt = BigInt("123456789")
    let bigInt = BigInt(-1)
    let lowestOneBit = bigInt.lowestOneBit()
    let other = BigInt(512)
    let quo = bigInt.quo(other)
    let (q, m) = bigInt.quoAndRem(other)
    let rem = bigInt.rem(other)
}
