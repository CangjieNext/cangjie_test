/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

import std.convert.*

@Test
class Test_radixconvertiable_uint_02 {
    @TestCase
    func test_radixconvertiable_uint8_01(): Unit {
        @Expect(UInt8.parse("011010", radix:2), 26)
        @Expect(UInt8.parse("123", radix:8), 83)
        @Expect(UInt8.parse("7a", radix:16), 122)
        @Expect(UInt8.parse("+0", radix:33), 0)
        @Expect(UInt8.tryParse("+0", radix:33), Option<UInt8>.Some(0))
        @Expect(UInt8.tryParse("1101111", radix:32), Option<UInt8>.None)
    }

    @TestCase
    func test_radixconvertiable_uint16_02(): Unit {
        @Expect(UInt16.parse("011010", radix:2), 26)
        @Expect(UInt16.parse("123", radix:8), 83)
        @Expect(UInt16.parse("7a", radix:16), 122)
        @Expect(UInt16.parse("+0", radix:33), 0)
        @Expect(UInt16.parse("11242", radix:8), 4770)
        @Expect(UInt16.tryParse("11242", radix:8), Option<UInt16>.Some(4770))
        @Expect(UInt16.tryParse("1101111sac", radix:32), Option<UInt16>.None)
    }

    @TestCase
    func test_radixconvertiable_uint32_03(): Unit {
        @Expect(UInt32.parse("011010", radix:2), 26)
        @Expect(UInt32.parse("123", radix:8), 83)
        @Expect(UInt32.parse("7a", radix:16), 122)
        @Expect(UInt32.parse("+0", radix:33), 0)
        @Expect(UInt32.parse("11242", radix:8), 4770)
        @Expect(UInt32.parse("867352", radix:9), 517151)
        @Expect(UInt32.tryParse("867352", radix:9), Option<UInt32>.Some(517151))
        @Expect(UInt32.tryParse("1101111sacsss", radix:32), Option<UInt32>.None)
    }

    @TestCase
    func test_radixconvertiable_uint64_04(): Unit {
        @Expect(UInt64.parse("011010", radix:2), 26)
        @Expect(UInt64.parse("123", radix:8), 83)
        @Expect(UInt64.parse("7a", radix:16), 122)
        @Expect(UInt64.parse("+0", radix:33), 0)
        @Expect(UInt64.parse("11242", radix:8), 4770)
        @Expect(UInt64.parse("867352", radix:9), 517151)
        @Expect(UInt64.parse("c422632d", radix:15), 2097515968)
        @Expect(UInt64.tryParse("c422632d", radix:15), Option<UInt64>.Some(2097515968))
        @Expect(UInt64.tryParse("1101111sacssszzzz", radix:36), Option<UInt64>.None)
    }

    @TestCase
    func test_radixconvertiable_tostring_05(): Unit {
        @Expect(26u8.toString(radix:2), "11010")
        @Expect(0u8.toString(radix:32), "0")
        @Expect(517151u32.toString(radix:9), "867352")
    }

    @TestCase
    func test_radixconvertiable_exception_06(): Unit {
        let e = @AssertThrows[IllegalArgumentException](UInt8.parse("a", radix:2))
        @Expect(e.message.contains("The part of value convert failed"))
        let e1 = @AssertThrows[IllegalArgumentException](UInt8.parse("", radix:20))
        @Expect(e1.message.contains("The string is empty"))
        let e2 = @AssertThrows[IllegalArgumentException](UInt8.parse("1", radix:-1))
        @Expect(e2.message.contains("The radix out of range"))
        let e3 = @AssertThrows[IllegalArgumentException](8u8.toString(radix:-1))
        @Expect(e3.message.contains("The radix out of range"))

        let e4 = @AssertThrows[IllegalArgumentException](UInt8.parse("-1", radix:20))
        @Expect(e4.message.contains("is illegal in UInt8"))
    }
}
