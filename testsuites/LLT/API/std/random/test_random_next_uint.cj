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

@Test
class RandomNextUIntTest {
    @TestCase
    func uIntBasicSuccess(): Unit {
        var rand: Random = Random()
        @Expect(rand.nextUInt8() is UInt8)
        @Expect(rand.nextUInt16() is UInt16)
        @Expect(rand.nextUInt32() is UInt32)
        @Expect(rand.nextUInt64() is UInt64)
    }

    @TestCase
    func uIntDistributionIsEven(): Unit {
        var rand: Random = Random()
        var frequency = Array<UInt32>(8, repeat: 0)
        let testCount: UInt32 = 20000000
        let maxCountPerRange: UInt32 = 2508000
        let bound: UInt64 = 64
        for (_ in 0..testCount) {
            let num: UInt64 = rand.next(bound)
            match {
                case num < 0x1fff_ffff_ffff_ffff => frequency[0] += 1
                case num < 0x3fff_ffff_ffff_ffff => frequency[1] += 1
                case num < 0x5fff_ffff_ffff_ffff => frequency[2] += 1
                case num < 0x7fff_ffff_ffff_ffff => frequency[3] += 1
                case num < 0x9fff_ffff_ffff_ffff => frequency[4] += 1
                case num < 0xbfff_ffff_ffff_ffff => frequency[5] += 1
                case num < 0xdfff_ffff_ffff_ffff => frequency[6] += 1
                case num <= 0xffff_ffff_ffff_ffff => frequency[7] += 1
                case _ => @Assert(false)
            }
        }

        @Assert(frequency[0] < maxCountPerRange)
        @Assert(frequency[1] < maxCountPerRange)
        @Assert(frequency[2] < maxCountPerRange)
        @Assert(frequency[3] < maxCountPerRange)
        @Assert(frequency[4] < maxCountPerRange)
        @Assert(frequency[5] < maxCountPerRange)
        @Assert(frequency[6] < maxCountPerRange)
        @Assert(frequency[7] < maxCountPerRange)
    }

    @TestCase
    func uInt8DefaultInit(): Unit {
        var count: UInt64 = 0
        var testCount: UInt64 = 200
        var rand = Random(9)
        var bound: UInt8 = 255
        for (_ in 0..testCount) {
            var res = rand.nextUInt8(bound)
            if (res is UInt8 && res >= 0 && res <= bound) {
                count += 1
            }
        }
        @Expect(count, testCount)
    }

    @TestCase
    func uInt8ParameterizedInit(): Unit {
        var count: UInt64 = 0
        var testCount: UInt64 = 200
        var rand = Random(UInt64(9))
        for (_ in 0..testCount) {
            if (rand.nextUInt8() is UInt8) {
                count += 1
            }
        }
        @Expect(count, testCount)
    }

    @TestCase
    func uInt8SameSeedReturnSameRandomList(): Unit {
        var testCount: UInt64 = 200
        var rand1 = Random(8)
        var rand2 = Random(8)
        for (_ in 0..testCount) {
            @Assert(rand1.nextUInt8(), rand2.nextUInt8())
        }
    }

    @TestCase
    func uInt8Exception(): Unit {
        var rand = Random()
        let bound: UInt8 = 0
        try {
            var _ = rand.nextUInt8(bound)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Upper must be positive, got: 0.")
        }
    }

    @TestCase
    func uInt16DefaultInit(): Unit {
        var count: UInt64 = 0
        var testCount: UInt64 = 200
        var rand = Random(9)
        var bound: UInt16 = 255
        for (_ in 0..testCount) {
            var res = rand.nextUInt16(bound)
            if (res is UInt16 && res >= 0 && res <= bound) {
                count += 1
            }
        }
        @Expect(count, testCount)
    }

    @TestCase
    func uInt16ParameterizedInit(): Unit {
        var count: UInt64 = 0
        var testCount: UInt64 = 200
        var rand = Random(UInt64(9))

        var bound: UInt16 = 75
        for (_ in 0..testCount) {
            var res = rand.nextUInt16(bound)
            if (res is UInt16 && res >= 0 && res <= bound) {
                count += 1
            }
        }
        @Expect(count, testCount)
    }

    @TestCase
    func uInt16SameSeedReturnSameRandomList(): Unit {
        var testCount: UInt64 = 200
        var rand1 = Random(8)
        var rand2 = Random(8)
        for (_ in 0..testCount) {
            @Assert(rand1.nextUInt16(), rand2.nextUInt16())
        }
    }

    @TestCase
    func uInt16Exception(): Unit {
        var rand = Random()
        let bound: UInt16 = 0
        try {
            var _ = rand.nextUInt16(bound)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Upper must be positive, got: 0.")
        }
    }

    @TestCase
    func uInt32DefaultInit(): Unit {
        var count: UInt64 = 0
        var testCount: UInt64 = 200
        var rand = Random(9)
        var bound: UInt32 = 255
        for (_ in 0..testCount) {
            var res = rand.nextUInt32(bound)
            if (res is UInt32 && res >= 0 && res <= bound) {
                count += 1
            }
        }
        @Expect(count, testCount)
    }

    @TestCase
    func uInt32ParameterizedInit(): Unit {
        var count: UInt64 = 0
        var testCount: UInt64 = 200
        var rand = Random(UInt64(9))

        var bound: UInt32 = 75
        for (_ in 0..testCount) {
            var res = rand.nextUInt32(bound)
            if (res is UInt32 && res >= 0 && res <= bound) {
                count += 1
            }
        }
        @Expect(count, testCount)
    }

    @TestCase
    func uInt32SameSeedReturnSameRandomList(): Unit {
        var testCount: UInt64 = 200
        var rand1 = Random(8)
        var rand2 = Random(8)
        for (_ in 0..testCount) {
            @Assert(rand1.nextUInt32(), rand2.nextUInt32())
        }
    }

    @TestCase
    func uInt32Exception(): Unit {
        var rand = Random()
        let bound: UInt32 = 0
        try {
            var _ = rand.nextUInt32(bound)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Upper must be positive, got: 0.")
        }
    }

    @TestCase
    func uInt64DefaultInit(): Unit {
        var count: UInt64 = 0
        var testCount: UInt64 = 200
        var rand = Random(9)
        var bound: UInt64 = 255
        for (_ in 0..testCount) {
            var res = rand.nextUInt64(bound)
            if (res is UInt64 && res >= 0 && res <= bound) {
                count += 1
            }
        }
        @Expect(count, testCount)
    }

    @TestCase
    func uInt64ParameterizedInit(): Unit {
        var count: UInt64 = 0
        var testCount: UInt64 = 200
        var rand = Random(UInt64(9))

        var bound: UInt64 = 75
        for (_ in 0..testCount) {
            var res = rand.nextUInt64(bound)
            if (res is UInt64 && res >= 0 && res <= bound) {
                count += 1
            }
        }
        @Expect(count, testCount)
    }

    @TestCase
    func uInt64SameSeedReturnSameRandomList(): Unit {
        var testCount: UInt64 = 200
        var rand1 = Random(8)
        var rand2 = Random(8)
        for (_ in 0..testCount) {
            @Assert(rand1.nextUInt64(), rand2.nextUInt64())
        }
    }

    @TestCase
    func uInt64RepetionRate(): Unit {
        var set: HashSet<UInt64> = HashSet<UInt64>()
        let random: Random = Random()
        var testCount: Int64 = 5000
        for (_ in 0..testCount) {
            var index = random.nextUInt64()
            set.add(index)
        }
        @Expect(set.size, testCount)
    }

    @TestCase
    func uInt64Exception(): Unit {
        var rand = Random()
        let bound: UInt64 = 0
        try {
            var _ = rand.nextUInt64(bound)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Upper must be positive, got: 0.")
        }
    }

    @TestCase
    func uInt8sDefaultInit(): Unit {
        var rand = Random()
        var array: Array<UInt8> = [1, 2, 3, 4]
        var array2 = rand.nextUInt8s(array)
        @Expect(array2.size, array.size)
    }

    @TestCase
    func nextBitsDefaultInit(): Unit {
        let rand = Random()
        let bits: Array<UInt64> = [1, 8, 10, 16, 64]
        const N = 32
        for (bit in bits) {
            var maxLen: UInt64 = 0
            for (_ in 0..N) {
                var randNum = rand.nextBits(bit)
                var bitLen: UInt64 = 0
                while (randNum != 0) {
                    randNum >>= 1
                    bitLen++
                }
                maxLen = max(maxLen, bitLen)
            }
            @Expect(maxLen, bit)
        }
    }

    @TestCase
    func nextBitsSameSeed(): Unit {
        let r1 = Random(10)
        let r2 = Random(10)
        let bits: Array<UInt64> = [1, 8, 10, 16, 64]
        for (bit in bits) {
            let num1 = r1.nextBits(bit)
            let num2 = r2.nextBits(bit)
            @Expect(num1, num2)
        }
    }

    @TestCase
    func nextBytesInputArray(): Unit {
        let r1 = Random(99)
        let r2 = Random(99)
        var arr1: Array<Byte> = [1, 2, 3, 4, 5, 6, 7, 8]
        r1.nextBytes(arr1)
        let arr2 = r2.nextBytes(8)
        @Expect(arr1, arr2)
    }

    @TestCase
    func nextBytesGenerateArray(): Unit {
        let rand = Random()
        let arr = rand.nextBytes(5)
        @Expect(arr.size, 5)
    }

    @TestCase
    func nextBytesSameSeed(): Unit {
        let r1 = Random(100)
        let r2 = Random(100)
        let arr1 = r1.nextBytes(10)
        let arr2 = r2.nextBytes(10)
        @Expect(arr1, arr2)
        r1.nextBytes(arr1)
        r2.nextBytes(arr2)
        @Expect(arr1, arr2)
    }

    @TestCase
    func nextBitsException() {
        let r = Random()
        @ExpectThrows[IllegalArgumentException](r.nextBits(0))
        @ExpectThrows[IllegalArgumentException](r.nextBits(65))
        @ExpectThrows[IllegalArgumentException](r.nextBits(128))
    }

    @TestCase
    func nextBytesException() {
        let r = Random()
        @ExpectThrows[IllegalArgumentException](r.nextBytes(-1))
        @ExpectThrows[IllegalArgumentException](r.nextBytes(0))
    }
}
