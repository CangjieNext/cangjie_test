/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl  %f -o %output --test
// RUN-EXEC: %run_stdx %output %run_args

import stdx.crypto.crypto.*
import std.math.*

@Test
class Test_random_nextbits_01 {
    @TestCase
    func test_random_nextbits_01(): Unit {
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
    func test_random_nextbits_02(): Unit {
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
        let e = @AssertThrows[IllegalArgumentException](r.nextBits(0))
        @Expect(e.message, "Bits cannot be 0.")
        @ExpectThrows[IllegalArgumentException](r.nextBits(65))
        @ExpectThrows[IllegalArgumentException](r.nextBits(128))
    }
}
