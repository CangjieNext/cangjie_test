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
import std.collection.*
import std.math.*

@Test
class RandomNextIntBoolTest {
    @TestCase
    func intBoolBasicSuccess(): Unit {
        var rand: Random = Random()
        @Expect(rand.nextBool() is Bool)
        @Expect(rand.nextInt8() is Int8)
        @Expect(rand.nextInt16() is Int16)
        @Expect(rand.nextInt32() is Int32)
        @Expect(rand.nextInt64() is Int64)
    }

    @TestCase
    func boolDistributionIsEven(): Unit {
        var rand: Random = Random()
        var trueCount: UInt32 = 0
        let minTrueCount: UInt32 = 1000 * 1000 - 100 * 1000
        let maxTrueCount: UInt32 = 1000 * 1000 + 100 * 1000
        let testCount: UInt32 = 2000 * 1000
        for (_ in 0..testCount) {
            if (rand.nextBool()) {
                trueCount++
            }
        }

        @Assert(trueCount > minTrueCount)
        @Assert(trueCount < maxTrueCount)
    }

    @TestCase
    func int8DefaultInit(): Unit {
        var count: UInt64 = 0
        var testCount: UInt64 = 200
        var rand = Random(9)
        var bound: Int8 = 10
        for (_ in 0..testCount) {
            var res = rand.nextInt8(bound)
            if (res is Int8 && res >= -128 && res <= bound) {
                count += 1
            }
        }
        @Expect(count, testCount)
    }

    @TestCase
    func int8ParameterizedInit(): Unit {
        var count: UInt64 = 0
        var testCount: UInt64 = 200
        var rand = Random(UInt64(9))
        var bound: Int8 = 10
        for (_ in 0..testCount) {
            var res = rand.nextInt8(bound)
            if (res is Int8 && res >= -128 && res <= bound) {
                count += 1
            }
        }
        @Expect(count, testCount)
    }

    @TestCase
    func int8SameSeedReturnSameRandomList(): Unit {
        var testCount: UInt64 = 200
        var rand1 = Random(8)
        var rand2 = Random(8)
        for (_ in 0..testCount) {
            @Assert(rand1.nextInt8(), rand2.nextInt8())
        }
    }

    @TestCase
    func int8Exception(): Unit {
        var rand = Random()
        let bound: Int8 = 0
        try {
            var _ = rand.nextInt8(bound)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Upper must be positive, got: 0.")
        }
    }

    @TestCase
    func int16DefaultInit(): Unit {
        var count: UInt64 = 0
        var testCount: UInt64 = 200
        var rand = Random(9)
        var bound: Int16 = 10
        for (_ in 0..testCount) {
            var res = rand.nextInt16(bound)
            if (res is Int16 && res >= -32768 && res <= bound) {
                count += 1
            }
        }
        @Expect(count, testCount)
    }

    @TestCase
    func int16ParameterizedInit(): Unit {
        var count: UInt64 = 0
        var testCount: UInt64 = 200
        var rand = Random(UInt64(9))

        var bound: Int16 = 10
        for (_ in 0..testCount) {
            var res = rand.nextInt16(bound)
            if (res is Int16 && res >= -32768 && res <= bound) {
                count += 1
            }
        }
        @Expect(count, testCount)
    }

    @TestCase
    func int16SameSeedReturnSameRandomList(): Unit {
        var testCount: UInt64 = 200
        var rand1 = Random(8)
        var rand2 = Random(8)
        for (_ in 0..testCount) {
            @Assert(rand1.nextInt16(), rand2.nextInt16())
        }
    }

    @TestCase
    func int16Exception(): Unit {
        var rand = Random()
        let bound: Int16 = 0
        try {
            var _ = rand.nextInt16(bound)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Upper must be positive, got: 0.")
        }
    }

    @TestCase
    func int32DefaultInit(): Unit {
        var count: UInt64 = 0
        var testCount: UInt64 = 200
        var rand = Random(9)
        var bound: Int32 = 10
        for (_ in 0..testCount) {
            var res = rand.nextInt32(bound)
            if (res is Int32 && res >= -2147483648 && res <= bound) {
                count += 1
            }
        }
        @Expect(count, testCount)
    }

    @TestCase
    func int32ParameterizedInit(): Unit {
        var count: UInt64 = 0
        var testCount: UInt64 = 200
        var rand = Random(UInt64(9))

        var bound: Int32 = 10
        for (_ in 0..testCount) {
            var res = rand.nextInt32(bound)
            if (res is Int32 && res >= -2147483648 && res <= bound) {
                count += 1
            }
        }
        @Expect(count, testCount)
    }

    @TestCase
    func int32SameSeedReturnSameRandomList(): Unit {
        var testCount: UInt64 = 200
        var rand1 = Random(8)
        var rand2 = Random(8)
        for (_ in 0..testCount) {
            @Assert(rand1.nextInt32(), rand2.nextInt32())
        }
    }

    @TestCase
    func int32Exception(): Unit {
        var rand = Random()
        let bound: Int32 = 0
        try {
            var _ = rand.nextInt32(bound)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Upper must be positive, got: 0.")
        }
    }

    @TestCase
    func int64DefaultInit(): Unit {
        var count: UInt64 = 0
        var testCount: UInt64 = 200
        var rand = Random(9)
        var bound: Int64 = 255
        for (_ in 0..testCount) {
            var res = rand.nextInt64(bound)
            if (res is Int64 && res >= -9223372036854775808 && res <= bound) {
                count += 1
            }
        }
        @Expect(count, testCount)
    }

    @TestCase
    func int64ParameterizedInit(): Unit {
        var count: UInt64 = 0
        var testCount: UInt64 = 200
        var rand = Random(UInt64(9))

        var bound: Int64 = 75
        for (_ in 0..testCount) {
            var res = rand.nextInt64(bound)
            if (res is Int64 && res >= -9223372036854775808 && res <= bound) {
                count += 1
            }
        }
        @Expect(count, testCount)
    }

    @TestCase
    func int64SameSeedReturnSameRandomList(): Unit {
        var testCount: UInt64 = 200
        var rand1 = Random(8)
        var rand2 = Random(8)
        for (_ in 0..testCount) {
            @Assert(rand1.nextInt64(), rand2.nextInt64())
        }
    }

    @TestCase
    func int64RepetionRate(): Unit {
        var set: HashSet<Int64> = HashSet<Int64>()
        let random: Random = Random()
        var testCount: Int64 = 5000
        for (_ in 0..testCount) {
            var index = random.nextInt64()
            set.add(index)
        }
        @Expect(set.size == testCount)
    }

    @TestCase
    func int64NoOverflow(): Unit {
        var rand = Random()
        let base: Float64 = 10.0
        let maxPower: Int64 = 18
        let testCount: Int64 = 10000 * 100
        for (_ in 0..maxPower) {
            var bound: Int64 = Int64(pow(base, Float64(maxPower)))
            try {
                for (_ in 0..testCount) {
                    @Assert(rand.nextInt64(bound) is Int64)
                }
            } catch (e: OverflowException) {
                @Assert("random.nextInt64(bound) Overflow Exception", "")
            }
        }
    }

    @TestCase
    func int64Exception(): Unit {
        var rand = Random()
        let bound: Int64 = 0
        try {
            var _ = rand.nextInt64(bound)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Upper must be positive, got: 0.")
        }
    }
}
