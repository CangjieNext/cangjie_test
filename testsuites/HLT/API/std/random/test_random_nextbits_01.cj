/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output --test
// RUN-EXEC: %run %run_opt %output %run_args

import std.random.*
import std.math.*

@Test
class Test_random_nextbits_01 {
    @TestCase
    func test_random_nextbits_01(): Unit {
        let r1 = Random(1)
        let r2 = Random(1)
        let bits: Array<UInt64> = [1, 8, 10, 16, 64]
        for (bit in bits) {
            let num1 = r1.nextBits(bit)
            let num2 = r2.nextBits(bit)
            @Expect(num1, num2)
        }
    }

    @TestCase
    func test_random_nextbits_02(): Unit {
        let r1 = Random(1000)
        let r2 = Random(1000)
        var arr1: Array<Byte> = [1, 2, 3, 4, 5, 6, 7, 8]
        r1.nextBytes(arr1)
        let arr2 = r2.nextBytes(8)
        @Expect(arr1, arr2)
    }

    @TestCase
    func test_random_nextbits_03(): Unit {
        let r1 = Random(10)
        let r2 = Random(9)
        let bits: Array<UInt64> = [1, 8, 10, 16, 64]
        for (bit in bits) {
            @Expect(r1.nextBits(bit) >= 0)
            @Expect(r2.nextBits(bit) >= 0)
        }
    }

    @TestCase
    func test_random_nextbits_04() {
        let r = Random()
        let e = @AssertThrows[IllegalArgumentException](r.nextBits(0))
        @Expect(e.message, "Bits cannot be 0.")
        @ExpectThrows[IllegalArgumentException](r.nextBits(65))
        @ExpectThrows[IllegalArgumentException](r.nextBits(UInt64.Max))
    }
}
