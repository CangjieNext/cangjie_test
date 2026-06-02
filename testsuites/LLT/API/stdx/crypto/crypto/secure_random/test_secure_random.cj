/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %set_stdx_path %run %run_opt %output %run_utest_opt
import stdx.crypto.crypto.*

@Test
class SecureRandomTest {
    // nextBytes test case
    @TestCase
    func inputValidNextBytes(): Unit {
        var caseItem = SecureRandom()
        @Expect(caseItem.nextBytes(5).size, 5)
    }

    @TestCase
    func inputInValidNextBytes(): Unit {
        var caseItem = SecureRandom()
        var countError = 0
        try {
            caseItem.nextBytes(0)
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            caseItem.nextBytes(-1)
        } catch (e: IllegalArgumentException) {
            countError++
        }
        @Expect(countError, 2)
    }

    // nextBool test case
    @TestCase
    func inputValidNextBool(): Unit {
        var caseItem = SecureRandom()
        @Expect(caseItem.nextBool() is Bool, true)
    }

    // nextUInt8 test case
    @TestCase
    func inputValidNextUInt8(): Unit {
        var caseItem = SecureRandom()
        var max: UInt8 = 10
        var cycleNums = 100
        @Expect(caseItem.nextUInt8() is UInt8, true)
        for (_ in 0..cycleNums) {
            var value = caseItem.nextUInt8(max)
            @Expect(value is UInt8 && value >= 0 && value < max, true)
        }
    }

    @TestCase
    func inputInValidNextUInt8(): Unit {
        var caseItem = SecureRandom()
        var countError = 0
        try {
            caseItem.nextUInt8(0)
        } catch (e: IllegalArgumentException) {
            countError++
        }
        @Expect(countError, 1)
    }

    // nextUInt16 test case
    @TestCase
    func inputValidNextUIn16(): Unit {
        var caseItem = SecureRandom()
        var max: UInt16 = 10
        var cycleNums = 100
        @Expect(caseItem.nextUInt16() is UInt16, true)
        for (_ in 0..cycleNums) {
            var value = caseItem.nextUInt16(max)
            @Expect(value is UInt16 && value >= 0 && value < max, true)
        }
    }

    @TestCase
    func inputInValidNextUInt16(): Unit {
        var caseItem = SecureRandom()
        var countError = 0
        try {
            caseItem.nextUInt16(0)
        } catch (e: IllegalArgumentException) {
            countError++
        }
        @Expect(countError,1)
    }

    // nextUInt32 test case
    @TestCase
    func inputValidNextUIn32(): Unit {
        var caseItem = SecureRandom()
        var max: UInt32 = 10
        var cycleNums = 100
        @Expect(caseItem.nextUInt32() is UInt32, true)
        for (_ in 0..cycleNums) {
            var value = caseItem.nextUInt32(max)
            @Expect(value is UInt32 && value >= 0 && value < max, true)
        }
    }

    @TestCase
    func inputInValidNextUInt32(): Unit {
        var caseItem = SecureRandom()
        var countError = 0
        try {
            caseItem.nextUInt32(0)
        } catch (e: IllegalArgumentException) {
            countError++
        }
        @Expect(countError,1)
    }

    // nextUInt64 test case
    @TestCase
    func inputValidNextUIn64(): Unit {
        var caseItem = SecureRandom()
        var max: UInt64 = 10
        var cycleNums = 100
        @Expect(caseItem.nextUInt64() is UInt64, true)
        for (_ in 0..cycleNums) {
            var value = caseItem.nextUInt64(max)
            @Expect(value is UInt64 && value >= 0 && value < max, true)
        }
    }

    @TestCase
    func inputInValidNextUInt64(): Unit {
        var caseItem = SecureRandom()
        var countError = 0
        try {
            caseItem.nextUInt64(0)
        } catch (e: IllegalArgumentException) {
            countError++
        }
        @Expect(countError,1)
    }

    // nextInt8 test case
    @TestCase
    func inputValidNextInt8(): Unit {
        var caseItem = SecureRandom()
        var max: Int8 = 10
        var cycleNums = 100
        @Expect(caseItem.nextInt8() is Int8, true)
        for (_ in 0..cycleNums) {
            var value = caseItem.nextInt8(max)
            @Expect(value is Int8 && value >= 0 && value < max, true)
        }
    }

    @TestCase
    func inputInValidNextInt8(): Unit {
        var caseItem = SecureRandom()
        var countError = 0
        try {
            caseItem.nextInt8(0)
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            caseItem.nextInt8(-1)
        } catch (e: IllegalArgumentException) {
            countError++
        }
        @Expect(countError,2)
    }

    // nextInt16 test case
    @TestCase
    func inputValidNextInt16(): Unit {
        var caseItem = SecureRandom()
        var max: Int16 = 10
        var cycleNums = 100
        @Expect(caseItem.nextInt16() is Int16, true)
        for (_ in 0..cycleNums) {
            var value = caseItem.nextInt16(max)
            @Expect(value is Int16 && value >= 0 && value < max, true)
        }
    }

    @TestCase
    func inputInValidNextInt16(): Unit {
        var caseItem = SecureRandom()
        var countError = 0
        try {
            caseItem.nextInt16(0)
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            caseItem.nextInt16(-1)
        } catch (e: IllegalArgumentException) {
            countError++
        }
        @Expect(countError,2)
    }

    // nextInt32 test case
    @TestCase
    func inputValidNextInt32(): Unit {
        var caseItem = SecureRandom()
        var max: Int32 = 10
        var cycleNums = 100
        @Expect(caseItem.nextInt32() is Int32, true)
        for (_ in 0..cycleNums) {
            var value = caseItem.nextInt32(max)
            @Expect(value is Int32 && value >= 0 && value < max, true)
        }
    }

    @TestCase
    func inputInValidNextInt32(): Unit {
        var caseItem = SecureRandom()
        var countError = 0
        try {
            caseItem.nextInt32(0)
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            caseItem.nextInt32(-1)
        } catch (e: IllegalArgumentException) {
            countError++
        }
        @Expect(countError,2)
    }

    // nextInt64 test case
    @TestCase
    func inputValidNextInt64(): Unit {
        var caseItem = SecureRandom()
        var max: Int64 = 10
        var cycleNums = 100
        @Expect(caseItem.nextInt64() is Int64, true)
        for (_ in 0..cycleNums) {
            var value = caseItem.nextInt64(max)
            @Expect(value is Int64 && value >= 0 && value < max, true)
        }
    }

    @TestCase
    func inputInValidNextInt64(): Unit {
        var caseItem = SecureRandom()
        var countError = 0
        try {
            caseItem.nextInt64(0)
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            caseItem.nextInt64(-1)
        } catch (e: IllegalArgumentException) {
            countError++
        }
        @Expect(countError,2)
    }

    // nextFloat16 test case
    @TestCase
    func inputValidNextFloat16(): Unit {
        var caseItem = SecureRandom()
        var cycleNums = 100
        for (_ in 0..cycleNums) {
            var value = caseItem.nextFloat16()
            @Expect(value is Float16 && value >= 0.0 && value <= 1.0, true)
        }
    }

    // nextFloat32 test case
    @TestCase
    func inputValidNextFloat32(): Unit {
        var caseItem = SecureRandom()
        var cycleNums = 100
        for (_ in 0..cycleNums) {
            var value = caseItem.nextFloat32()
            @Expect(value is Float32 && value >= 0.0 && value < 1.0, true)
        }
    }

    // nextFloat64 test case
    @TestCase
    func inputValidNextFloat64(): Unit {
        var caseItem = SecureRandom()
        var cycleNums = 100
        for (_ in 0..cycleNums) {
            var value = caseItem.nextFloat64()
            @Expect(value is Float64 && value >= 0.0 && value < 1.0, true)
        }
    }

    // nextGaussianFloat16 test case
    @TestCase
    func inputValidNextGaussianFloat16(): Unit {
        var caseItem = SecureRandom()
        var count: Float16 = 0.0
        for (_ in 0..100000) {
            count += caseItem.nextGaussianFloat16(mean: 5.0, sigma: 2.0)
        }
        @Expect((count / 100000.0) <= 5.1 && (count / 100000.0) >= -5.1, true)
    }

    // nextGaussianFloat32 test case
    @TestCase
    func inputValidNextGaussianFloat32(): Unit {
        var caseItem = SecureRandom()
        var count: Float32 = 0.0
        for (_ in 0..100000) {
            count += caseItem.nextGaussianFloat32(mean: 5.0, sigma: 2.0)
        }
        @Expect((count / 100000.0) <= 5.1 && (count / 100000.0) >= -5.1, true)
    }

    // nextGaussianFloat64 test case
    @TestCase
    func inputValidNextGaussianFloat64(): Unit {
        var caseItem = SecureRandom()
        var count: Float64 = 0.0
        for (_ in 0..100000) {
            count += caseItem.nextGaussianFloat64(mean: 5.0, sigma: 2.0)
        }
        @Expect((count / 100000.0) <= 5.1 && (count / 100000.0) >= -5.1, true)
    }

    // SecureRandomException test case
    @TestCase
    func secureRandomException(): Unit {
        var countError = 0
        try {
            throw SecureRandomException()
        } catch (e: SecureRandomException) {
            @Expect(e.toString(),"SecureRandomException")
            countError++
        }
        try {
            throw SecureRandomException("this is test")
        } catch (e: SecureRandomException) {
            @Expect(e.message,"this is test")
            countError++
        }
        @Expect(countError,2)
    }

    @TestCase
    func secureRandomNextBits(): Unit {
        let rand = SecureRandom()
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
    func secureRandomNextBytesInputArray(): Unit {
        let r1 = SecureRandom()
        let r2 = SecureRandom()
        var arr1 = Array<Byte>(32, {i => UInt8(i)})
        var arr2 = Array<Byte>(32, {i => UInt8(i)})
        r1.nextBytes(arr1)
        r2.nextBytes(arr2)
        @Expect(arr1 != arr2)
    }

    @TestCase
    func secureRandomNextBitsException(): Unit {
        let r = SecureRandom()
        @ExpectThrows[IllegalArgumentException](r.nextBits(0))
        @ExpectThrows[IllegalArgumentException](r.nextBits(65))
        @ExpectThrows[IllegalArgumentException](r.nextBits(128))
    }
}
