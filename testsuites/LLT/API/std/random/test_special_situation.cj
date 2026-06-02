/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.random.*

@Test
class SpecialSituationTest {
    @TestCase
    func sameSeedReturnSameValue(): Unit {
        var testCount: UInt64 = 200
        var rand1 = Random(8)
        var rand2 = Random(8)
        for (_ in 0..testCount) {
            @Assert(rand1.nextInt8(), rand2.nextInt8())
        }
    }

    @TestCase
    func emptyArrayNoException(): Unit {
        var rand = Random()
        var emptyArray1 = Array<UInt8>()
        var emptyArray2 = rand.nextUInt8s(emptyArray1)
        @Expect(emptyArray1.size, emptyArray2.size)
    }

    @TestCase
    func repeatCallNoException(): Unit {
        var rand = Random()
        var testCount = 623
        for (_ in 0..testCount) {
            @Expect(rand.nextInt64() is Int64)
        }
    }

    @TestCase
    func uInt64NotAlwaysZero(): Unit {
        var seeds: Array<UInt64> = [10, 234]
        var maxbound: UInt64 = 20
        var zeroCount: UInt64 = 0
        let testCount: UInt64 = 100
        for (_ in 0..testCount) {
            for (i in seeds) {
                var rand = Random(i)
                for (j in 1..=maxbound) {
                    if (rand.nextUInt64(j) == 0) {
                        zeroCount++
                    }
                }
                @Expect(zeroCount != maxbound)
            }
        }
    }

    @TestCase
    func nextBitsTooBigException(): Unit {
        var rand = Random()
        let maxBits: UInt64 = 64
        try {
            rand.next(maxBits + 1)
            @Expect("", "65 bits need exception")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Bits must be less than or equal to 64.")
        }
    }

    @TestCase
    func nextBitsZeroException(): Unit {
        let rand = Random()
        try {
            rand.next(0)
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Bits cannot be 0.")
        }
    }
}
