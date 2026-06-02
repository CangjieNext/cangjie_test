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
class Test_radixconvertiable_int_01 {
    @TestCase
    func test_radixconvertiable_int8_01(): Unit {
        @Expect(Int8.parse("11010", radix:2), 26)
        @Expect(Int8.tryParse("011010", radix:2), Option<Int8>.Some(26))
        @Expect(Int8.parse("123", radix:8), 83)
        @Expect(Int8.tryParse("123", radix:8), Option<Int8>.Some(83))
        @Expect(Int8.parse("7a", radix:16), 122)
        @Expect(Int8.tryParse("7a", radix:16), Option<Int8>.Some(122))
        @Expect(Int8.parse("-7a", radix:16), -122)
        @Expect(Int8.tryParse("-7a", radix:16), Option<Int8>.Some(-122))
        @Expect(Int8.parse("-10", radix:33), -33)
        @Expect(Int8.tryParse("-10", radix:33), Option<Int8>.Some(-33))
        @Expect(Int8.parse("+0", radix:33), 0)
        @Expect(Int8.tryParse("+0", radix:33), Option<Int8>.Some(0))
        @Expect(Int8.parse("-0", radix:32), 0)
        @Expect(Int8.tryParse("-0", radix:32), Option<Int8>.Some(0))
        @Expect(Int8.tryParse("-01111", radix:32), Option<Int8>.None)
    }

    @TestCase
    func test_radixconvertiable_int16_02(): Unit {
        @Expect(Int16.parse("011010", radix:2), 26)
        @Expect(Int16.parse("123", radix:8), 83)
        @Expect(Int16.parse("7a", radix:16), 122)
        @Expect(Int16.parse("-7a", radix:16), -122)
        @Expect(Int16.parse("-10", radix:33), -33)
        @Expect(Int16.parse("+0", radix:33), 0)
        @Expect(Int16.parse("-0", radix:32), 0)
        @Expect(Int16.parse("11242", radix:8), 4770)
        @Expect(Int16.parse("-11242", radix:13), -31150)
        @Expect(Int16.tryParse("-11242", radix:13), Option<Int16>.Some(-31150))
        @Expect(Int16.tryParse("-011163265", radix:32), Option<Int16>.None)
    }

    @TestCase
    func test_radixconvertiable_int32_03(): Unit {
        @Expect(Int32.parse("011010", radix:2), 26)
        @Expect(Int32.parse("123", radix:8), 83)
        @Expect(Int32.parse("7a", radix:16), 122)
        @Expect(Int32.parse("-7a", radix:16), -122)
        @Expect(Int32.parse("-10", radix:33), -33)
        @Expect(Int32.parse("+0", radix:33), 0)
        @Expect(Int32.parse("-0", radix:32), 0)
        @Expect(Int32.parse("11242", radix:8), 4770)
        @Expect(Int32.parse("-11242", radix:13), -31150)
        @Expect(Int32.parse("867352", radix:9), 517151)
        @Expect(Int32.parse("-dg23", radix:30), -365463)
        @Expect(Int32.tryParse("-dg23", radix:30), Option<Int32>.Some(-365463))
        @Expect(Int32.tryParse("2184738469385", radix:32), Option<Int32>.None)
    }

    @TestCase
    func test_radixconvertiable_int64_04(): Unit {
        @Expect(Int64.parse("011010", radix:2), 26)
        @Expect(Int64.parse("123", radix:8), 83)
        @Expect(Int64.parse("7a", radix:16), 122)
        @Expect(Int64.parse("-7a", radix:16), -122)
        @Expect(Int64.parse("-10", radix:33), -33)
        @Expect(Int64.parse("+0", radix:33), 0)
        @Expect(Int64.parse("-0", radix:32), 0)
        @Expect(Int64.parse("11242", radix:8), 4770)
        @Expect(Int64.parse("-11242", radix:13), -31150)
        @Expect(Int64.parse("867352", radix:9), 517151)
        @Expect(Int64.parse("-dg231", radix:30), -10963891)
        @Expect(Int64.parse("c422632d", radix:15), 2097515968)
        @Expect(Int64.parse("-afd123b", radix:25), -2592985711)
        @Expect(Int64.tryParse("c422632d", radix:15), Option<Int64>.Some(2097515968))
        @Expect(Int64.tryParse("21673dyt2yd32gdyut39178643798f42587f", radix:36), Option<Int64>.None)
    }

    @TestCase
    func test_radixconvertiable_tostring_05(): Unit {
        @Expect(26i8.toString(radix:2), "11010")
        @Expect(0i8.toString(radix:32), "0")
        @Expect((-122i16).toString(radix:16), "-7a")
        @Expect(517151i32.toString(radix:9), "867352")
        @Expect((-10963891i64).toString(radix:30), "-dg231")
    }

    @TestCase
    func test_radixconvertiable_exception_06(): Unit {
        let e = @AssertThrows[IllegalArgumentException](Int8.parse("a", radix:2))
        @Expect(e.message.contains("The part of value convert failed"))
        let e1 = @AssertThrows[IllegalArgumentException](Int8.parse("", radix:20))
        @Expect(e1.message.contains("The string is empty"))
        let e2 = @AssertThrows[IllegalArgumentException](Int8.parse("1", radix:-1))
        @Expect(e2.message.contains("The radix out of range"))
        let e3 = @AssertThrows[IllegalArgumentException](8i8.toString(radix:-1))
        @Expect(e3.message.contains("The radix out of range"))
    }
}
