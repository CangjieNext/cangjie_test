/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 

import std.math.numeric.*
import std.convert.*
import std.math.*

@Test
class BigIntExtensionTest {
    @TestCase
    func testRadixConvertible_tryParse(): Unit {
        for (i in 2..=36) {
            @Expect(BigInt.tryParse("0", radix: i).toString(), "Some(0)")
            @Expect(BigInt.tryParse("1", radix: i).toString(), "Some(1)")
            @Expect(BigInt.tryParse("10", radix: i).toString(), "Some(${i})")
            @Expect(BigInt.tryParse("100", radix: i).toString(), "Some(${i*i})")
        }

        @Expect(BigInt.tryParse("100", radix: 1).toString(), "None")
        @Expect(BigInt.tryParse("100", radix: 37).toString(), "None")
        @Expect(BigInt.tryParse("1?00", radix: 36).toString(), "None")
        @Expect(BigInt.tryParse("abc", radix: 10).toString(), "None")
    }

    @TestCase
    func testParsable_parse(): Unit {
        @Expect(BigInt.parse("100").toString(), "100")
        @Expect(BigInt.parse("0b100").toString(), "4")
        @Expect(BigInt.parse("0B100").toString(), "4")
        @Expect(BigInt.parse("0o100").toString(), "64")
        @Expect(BigInt.parse("0O100").toString(), "64")
        @Expect(BigInt.parse("0x100").toString(), "256")
        @Expect(BigInt.parse("0X100").toString(), "256")
        @Expect(BigInt.parse("+100").toString(), "100")
        @Expect(BigInt.parse("+0b100").toString(), "4")
        @Expect(BigInt.parse("+0B100").toString(), "4")
        @Expect(BigInt.parse("+0o100").toString(), "64")
        @Expect(BigInt.parse("+0O100").toString(), "64")
        @Expect(BigInt.parse("+0x100").toString(), "256")
        @Expect(BigInt.parse("+0X100").toString(), "256")
        @Expect(BigInt.parse("-100").toString(), "-100")
        @Expect(BigInt.parse("-0b100").toString(), "-4")
        @Expect(BigInt.parse("-0B100").toString(), "-4")
        @Expect(BigInt.parse("-0o100").toString(), "-64")
        @Expect(BigInt.parse("-0O100").toString(), "-64")
        @Expect(BigInt.parse("-0x100").toString(), "-256")
        @Expect(BigInt.parse("-0X100").toString(), "-256")

        @ExpectThrows[IllegalArgumentException](BigInt.parse(""))
        @ExpectThrows[IllegalArgumentException](BigInt.parse("-"))
        @ExpectThrows[IllegalArgumentException](BigInt.parse("abcd"))
        @ExpectThrows[IllegalArgumentException](BigInt.parse("+-100"))
        @ExpectThrows[IllegalArgumentException](BigInt.parse("-+100"))
        @ExpectThrows[IllegalArgumentException](BigInt.parse("0x-100"))
        @ExpectThrows[IllegalArgumentException](BigInt.parse("0x+100"))
    }

    @TestCase
    func testParsable_tryParse(): Unit {
        @Expect(BigInt.tryParse("100").toString(), "Some(100)")
        @Expect(BigInt.tryParse("0b100").toString(), "Some(4)")
        @Expect(BigInt.tryParse("0B100").toString(), "Some(4)")
        @Expect(BigInt.tryParse("0o100").toString(), "Some(64)")
        @Expect(BigInt.tryParse("0O100").toString(), "Some(64)")
        @Expect(BigInt.tryParse("0x100").toString(), "Some(256)")
        @Expect(BigInt.tryParse("0X100").toString(), "Some(256)")
        @Expect(BigInt.tryParse("+100").toString(), "Some(100)")
        @Expect(BigInt.tryParse("+0b100").toString(), "Some(4)")
        @Expect(BigInt.tryParse("+0B100").toString(), "Some(4)")
        @Expect(BigInt.tryParse("+0o100").toString(), "Some(64)")
        @Expect(BigInt.tryParse("+0O100").toString(), "Some(64)")
        @Expect(BigInt.tryParse("+0x100").toString(), "Some(256)")
        @Expect(BigInt.tryParse("+0X100").toString(), "Some(256)")
        @Expect(BigInt.tryParse("-100").toString(), "Some(-100)")
        @Expect(BigInt.tryParse("-0b100").toString(), "Some(-4)")
        @Expect(BigInt.tryParse("-0B100").toString(), "Some(-4)")
        @Expect(BigInt.tryParse("-0o100").toString(), "Some(-64)")
        @Expect(BigInt.tryParse("-0O100").toString(), "Some(-64)")
        @Expect(BigInt.tryParse("-0x100").toString(), "Some(-256)")
        @Expect(BigInt.tryParse("-0X100").toString(), "Some(-256)")

        @Expect(BigInt.tryParse("").toString(), "None")
        @Expect(BigInt.tryParse("-").toString(), "None")
        @Expect(BigInt.tryParse("abcd").toString(), "None")
        @Expect(BigInt.tryParse("+-100").toString(), "None")
        @Expect(BigInt.tryParse("-+100").toString(), "None")
        @Expect(BigInt.tryParse("0x-100").toString(), "None")
        @Expect(BigInt.tryParse("0x+100").toString(), "None")
    }

    @TestCase
    func testFormatable_format(): Unit {
        let v = BigInt(0x10)
        let u = BigInt(0xabc)
        let z = BigInt(0)

        @Expect(v.format("-3.3b"), "10000")
        @Expect(v.format("-3.3B"), "10000")
        @Expect(v.format("+o"), "+20")
        @Expect(v.format("+O"), "+20")
        @Expect(v.format("#3.3x"), "0x010")
        @Expect(v.format("#3.3X"), "0X010")
        @Expect(v.format("03x"), "010")
        @Expect(v.format("03X"), "010")
        @Expect(v.format(".3x"), "010")
        @Expect(v.format(".3X"), "010")

        @Expect(v.format(""), "16")
        @Expect(v.format("+"), "+16")
        @Expect(v.format("-10b"), "10000     ")
        @Expect(v.format("-10B"), "10000     ")
        @Expect(v.format("-10o"), "20        ")
        @Expect(v.format("-10O"), "20        ")
        @Expect(v.format("-10x"), "10        ")
        @Expect(v.format("-10X"), "10        ")

        @Expect(u.format("-10x"), "abc       ")
        @Expect(u.format("-10X"), "ABC       ")
        @Expect(u.format("-10.5X"), "00ABC     ")
        @Expect(u.format("-.5x"), "00abc")
        @Expect(u.format("+.5X"), "+00ABC")
        @Expect(u.format("04.5x"), "00abc")
        @Expect(u.format("010x"), "0000000abc")
        @Expect(u.format("010.5X"), "0000000ABC")

        @Expect(u.format("#10.5x"), "   0x00abc")
        @Expect(u.format("#10.5X"), "   0X00ABC")
        @Expect((-u).format("#10.5x"), "  -0x00abc")
        @Expect((-u).format("#10.5X"), "  -0X00ABC")
        @Expect(v.format("#10.5o"), "   0o00020")
        @Expect(v.format("#10.5O"), "   0O00020")
        @Expect(v.format("#10.5b"), "   0b10000")
        @Expect(v.format("#10.5B"), "   0B10000")
        @Expect(v.format("#10.6b"), "  0b010000")
        @Expect(v.format("#10.6B"), "  0B010000")

        @Expect(z.format("#10.6B"), "  0B000000")
        @Expect(z.format("#10B"), "       0B0")
        @Expect(z.format("#10x"), "       0x0")
        @Expect((-z).format("#10x"), "       0x0")
        @Expect((-z).format("010x"), "0000000000")
        @Expect((-z).format(".10x"), "0000000000")
        @Expect((-z).format("#.10x"), "0x0000000000")
        @Expect((-z).format("-10.5x"), "00000     ")

        @ExpectThrows[IllegalArgumentException](v.format("g"))
        @ExpectThrows[IllegalArgumentException](v.format("G"))
        @ExpectThrows[IllegalArgumentException](v.format("e"))
        @ExpectThrows[IllegalArgumentException](v.format("E"))
        @ExpectThrows[IllegalArgumentException](v.format("a"))
    }
}
