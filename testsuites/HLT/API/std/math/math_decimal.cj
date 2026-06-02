/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output --test
// RUN-EXEC: %run %run_opt %output %run_args
import std.math.numeric.*
import std.convert.*

@Test
class DecimalTest {
    @TestCase
    func testDecimal_divAndModInt8(): Unit {
        let dec1 = Decimal(-128)
        let dec2 = Decimal(127)
        @Expect(dec1.divAndMod(dec2)[0].toString(), "-1")
        @Expect(dec1.divAndMod(dec2)[1].toString(), "-1")
    }

    @TestCase
    func testDecimal_divAndModInt16(): Unit {
        let dec1 = Decimal(15)
        let dec2 = Decimal(5)
        @Expect(dec1.divAndMod(dec2)[0].toString(), "3")
        @Expect(dec1.divAndMod(dec2)[1].toString(), "0")
    }

    @TestCase
    func testDecimal_divAndModInt32(): Unit {
        let dec1 = Decimal(-2147483648)
        let dec2 = Decimal(2147483647)
        let dec3 = Decimal(0)
        @Expect(dec1.divAndMod(dec2)[0].toString(), "-1")
        @Expect(dec1.divAndMod(dec2)[1].toString(), "-1")
        try {
            dec1.divAndMod(dec3)
        } catch (e: ArithmeticException) {
            @Expect(e.message.contains("Divided by zero"))
        }
    }

    @TestCase
    func testDecimal_divAndModInt64(): Unit {
        let dec1 = Decimal(-9223372036854775808)
        let dec2 = Decimal(9223372036854775807)
        @Expect(dec1.divAndMod(dec2)[0].toString(), "-1")
        @Expect(dec1.divAndMod(dec2)[1].toString(), "-1")
    }

    @TestCase
    func testDecimal_divAndModIntNative(): Unit {
        let dec1 = Decimal(IntNative(-9223372036854775808))
        let dec2 = Decimal(IntNative(9223372036854775807))
        @Expect(dec1.divAndMod(dec2)[0].toString(), "-1")
        @Expect(dec1.divAndMod(dec2)[1].toString(), "-1")
    }

    @TestCase
    func testDecimal_divAndModFloat(): Unit {
        let float161 = Decimal(-32768.123f16)
        let float162 = Decimal(32767.01f16)
        @Expect(float161.divAndMod(float162)[0].toString(), "-1")
        @Expect(float161.divAndMod(float162)[1].toString(), "0")
        @Expect(float162.divAndMod(float161)[0].toString(), "-1")
        @Expect(float162.divAndMod(float161)[1].toString(), "0")
        let float321 = Decimal(-32768.123f32)
        let float322 = Decimal(32767.01f32)
        @Expect(float321.divAndMod(float322)[0].toString(), "-1")
        @Expect(float321.divAndMod(float322)[1].toString(), "-1.111328125")
        @Expect(float322.divAndMod(float321)[0].toString(), "0")
        @Expect(float322.divAndMod(float321)[1].toString(), "32767.009765625")
        let float641 = Decimal(-32768.123f64)
        let float642 = Decimal(32767.01f64)
        @Expect(float641.divAndMod(float642)[0].toString(), "-1")
        @Expect(float641.divAndMod(float642)[1].toString(), "-1.11300000000119325704872608184814453125")
        @Expect(float642.divAndMod(float641)[0].toString(), "0")
        @Expect(float642.divAndMod(float641)[1].toString(), "32767.00999999999839928932487964630126953125")
    }

    @TestCase
    func testDecimal_divAndModInt(): Unit {
        let u8 = Decimal(255u8)
        let u16 = Decimal(65535u16)
        let u32 = Decimal(4294967295u32)
        let u64 = Decimal(18446744073709551615u64)
        @Expect(u16.divAndMod(u8)[0].toString(), "257")
        @Expect(u16.divAndMod(u8)[1].toString(), "0")
        @Expect(u32.divAndMod(u64)[0].toString(), "0")
        @Expect(u32.divAndMod(u64)[1].toString(), "4294967295")
    }

    @TestCase
    func testDecimal_divAndMod(): Unit {
        let float641 = Decimal(-32768.123f64)
        let int = Decimal(32767i64)
        let u16 = Decimal(65535u16)
        @Expect(float641.divAndMod(int)[0].toString(), "-1")
        @Expect(float641.divAndMod(int)[1].toString(), "-1.1229999999995925463736057281494140625")
        @Expect(int.divAndMod(float641)[0].toString(), "0")
        @Expect(int.divAndMod(float641)[1].toString(), "32767")
        @Expect(u16.divAndMod(int)[0].toString(), "2")
        @Expect(u16.divAndMod(int)[1].toString(), "1")
        @Expect(u16.divAndMod(float641)[0].toString(), "-1")
        @Expect(u16.divAndMod(float641)[1].toString(), "32766.8770000000004074536263942718505859375")
    }

    @TestCase
    func testDecimal_format(): Unit {
        let float = Decimal(1234.1)
        let int = Decimal(-20i32)
        @Expect(float.format("+20"),"        +1234.100000")
        @Expect(float.format("20.20"),"1234.09999999999990905053")
        @Expect(float.format("20.2e"),"            1.23e+03")
        @Expect(int.format("10.8"),"-20.00000000")
        @Expect(int.format("015"),"-0000020.000000")
        try {
            int.format("你好仓颉")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Wrong format string"))
        }
        try {
            int.format("")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Wrong format string"))
        }
    }

    @TestCase
    func testDecimal_format1(): Unit {
        var c: Int32 = 20
        let int = Decimal(c)
        @Expect(int.format("20.2e"),"            2.00e+01")
        try {
            int.format("b")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Wrong format string"))
        }
        try {
            int.format("o")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Wrong format string"))
        }
        try {
            int.format("x")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Wrong format string"))
        }
        try {
            int.format("X")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Wrong format string"))
        }
        try {
            int.format("#X")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Wrong format string"))
        }
    }

    @TestCase
    func testDecimal_parse(): Unit {
        let int = Decimal.parse("+20")
        let int1 = Decimal(10)
        let flo = Decimal(10.0f16)
        @Expect(int.divAndMod((int1))[0].toString(), "2")
        @Expect(int.divAndMod((int1))[1].toString(), "0")
        @Expect(int.divAndMod(flo)[0].toString(), "2")
        @Expect(int.divAndMod(flo)[1].toString(), "0")
    }

    @TestCase
    func testDecimal_parse1(): Unit {
        let int = Decimal.parse("20e-2")
        let int1 = Decimal(10)
        let flo = Decimal(10.0f16)
        @Expect(int.divAndMod(int1)[0].toString(), "0")
        @Expect(int.divAndMod(int1)[1].toString(), "0.20")
        @Expect(int.divAndMod(flo)[0].toString(), "0")
        @Expect(int.divAndMod(flo)[1].toString(), "0.20")
        try {
            Decimal.parse("-9.9e9nihao")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("[digit, sign]"))
        }
        try {
            Decimal.parse("")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("String value cannot be empty"))
        }
    }

    @TestCase
    func testDecimal_parse2(): Unit {
        try {
            let int = Decimal.parse("nihaocangjie")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("[digit, '.', e, sign]"))
        }
    }

    @TestCase
    func testDecimal_tryParse(): Unit {
        let int = Decimal.tryParse("+20").getOrThrow()
        let int1 = Decimal(10)
        let flo = Decimal(10.0f16)
        @Expect(int.divAndMod(int1)[0].toString(), "2")
        @Expect(int.divAndMod(int1)[1].toString(), "0")
        @Expect(int.divAndMod(flo)[0].toString(), "2")
        @Expect(int.divAndMod(flo)[1].toString(), "0")
    }

    @TestCase
    func testDecimal_tryParse1(): Unit {
        var a = 0
        let int = Decimal.tryParse("20e-2").getOrThrow()
        let int1 = Decimal(10)
        let flo = Decimal(10.0f16)
        @Expect(int.divAndMod(int1)[0].toString(), "0")
        @Expect(int.divAndMod(int1)[1].toString(), "0.20")
        @Expect(int.divAndMod(flo)[0].toString(), "0")
        @Expect(int.divAndMod(flo)[1].toString(), "0.20")
        @Expect(Decimal.tryParse("-9.9e9nihao").isSome(),false)
        @Expect(Decimal.tryParse("").isSome(),false)
    }
}
