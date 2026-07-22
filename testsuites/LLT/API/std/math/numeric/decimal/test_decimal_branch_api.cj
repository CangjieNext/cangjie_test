/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt


import std.math.numeric.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class DecimalBranchTest {

    // ==================== Constructors ====================

    @TestCase
    func test_init_int8(): Unit {
        let d = Decimal(42i8)
        @Expect(d.toString(), "42")
    }

    @TestCase
    func test_init_int16(): Unit {
        let d = Decimal(1000i16)
        @Expect(d.toString(), "1000")
    }

    @TestCase
    func test_init_int32(): Unit {
        let d = Decimal(100000i32)
        @Expect(d.toString(), "100000")
    }

    @TestCase
    func test_init_int64(): Unit {
        let d = Decimal(123456789)
        @Expect(d.toString(), "123456789")
    }

    @TestCase
    func test_init_int64_negative(): Unit {
        let d = Decimal(-123456789)
        @Expect(d.toString(), "-123456789")
    }

    @TestCase
    func test_init_int64_zero(): Unit {
        let d = Decimal(0)
        @Expect(d.toString(), "0")
    }

    @TestCase
    func test_init_uint8(): Unit {
        let d = Decimal(255u8)
        @Expect(d.toString(), "255")
    }

    @TestCase
    func test_init_uint16(): Unit {
        let d = Decimal(65535u16)
        @Expect(d.toString(), "65535")
    }

    @TestCase
    func test_init_uint32(): Unit {
        let d = Decimal(4294967295u32)
        @Expect(d.toString(), "4294967295")
    }

    @TestCase
    func test_init_uint64(): Unit {
        let d = Decimal(18446744073709551615u64)
        @Expect(d.toString(), "18446744073709551615")
    }

    @TestCase
    func test_init_float64(): Unit {
        let d = Decimal(Float64(3.14))
        @Assert(d.toString().startsWith("3.14"))
    }

    @TestCase
    func test_init_float64_negative(): Unit {
        let d = Decimal(Float64(-3.14))
        @Assert(d.toString().startsWith("-3.14"))
    }

    @TestCase
    func test_init_float64_zero(): Unit {
        let d = Decimal(Float64(0.0))
        @Expect(d.toString(), "0")
    }

    @TestCase
    func test_init_float32(): Unit {
        let d = Decimal(Float32(1.5))
        @Expect(d.toString(), "1.5")
    }

    @TestCase
    func test_init_float16(): Unit {
        let d = Decimal(Float16(2.5))
        @Expect(d.toString(), "2.5")
    }

    @TestCase
    func test_init_bigint(): Unit {
        let b = BigInt(12345)
        let d = Decimal(b)
        @Expect(d.toString(), "12345")
    }

    @TestCase
    func test_init_bigint_scale(): Unit {
        let b = BigInt(12345)
        let d = Decimal(b, 2i32)
        @Assert(d.toString().contains("123.45"))
    }

    @TestCase
    func test_init_string(): Unit {
        let d = Decimal.parse("123.456")
        @Expect(d.toString(), "123.456")
    }

    @TestCase
    func test_init_string_negative(): Unit {
        let d = Decimal.parse("-123.456")
        @Expect(d.toString(), "-123.456")
    }

    @TestCase
    func test_init_string_zero(): Unit {
        let d = Decimal.parse("0")
        @Expect(d.toString(), "0")
    }

    // ==================== Properties ====================

    @TestCase
    func test_sign_positive(): Unit {
        let d = Decimal(42)
        @Expect(d.sign, 1)
    }

    @TestCase
    func test_sign_negative(): Unit {
        let d = Decimal(-42)
        @Expect(d.sign, -1)
    }

    @TestCase
    func test_sign_zero(): Unit {
        let d = Decimal(0)
        @Expect(d.sign, 0)
    }

    @TestCase
    func test_scale(): Unit {
        let d = Decimal.parse("1.23")
        @Expect(d.scale, 2i32)
    }

    @TestCase
    func test_precision(): Unit {
        let d = Decimal(42)
        @Assert(d.precision >= 2)
    }

    @TestCase
    func test_value(): Unit {
        let d = Decimal(42)
        @Expect(d.value.toString(), "42")
    }

    // ==================== Arithmetic ====================

    @TestCase
    func test_add(): Unit {
        let a = Decimal(10)
        let b = Decimal(20)
        @Expect((a + b).toString(), "30")
    }

    @TestCase
    func test_add_decimal(): Unit {
        let a = Decimal.parse("1.5")
        let b = Decimal.parse("2.5")
        @Expect((a + b).toString(), "4.0")
    }

    @TestCase
    func test_sub(): Unit {
        let a = Decimal(30)
        let b = Decimal(10)
        @Expect((a - b).toString(), "20")
    }

    @TestCase
    func test_mul(): Unit {
        let a = Decimal(6)
        let b = Decimal(7)
        @Expect((a * b).toString(), "42")
    }

    @TestCase
    func test_mul_decimal(): Unit {
        let a = Decimal.parse("1.5")
        let b = Decimal.parse("2.0")
        @Expect((a * b).toString(), "3.00")
    }

    @TestCase
    func test_div(): Unit {
        let a = Decimal(10)
        let b = Decimal(3)
        let result = (a / b).toString()
        @Assert(result.startsWith("3.33"))
    }

    @TestCase
    func test_div_int(): Unit {
        let a = Decimal(10)
        let b = Decimal(2)
        @Expect((a / b).toString(), "5")
    }

    @TestCase
    func test_neg(): Unit {
        let a = Decimal(42)
        @Expect((-a).toString(), "-42")
    }

    @TestCase
    func test_neg_negative(): Unit {
        let a = Decimal(-42)
        @Expect((-a).toString(), "42")
    }

    @TestCase
    func test_neg_zero(): Unit {
        let a = Decimal(0)
        @Expect((-a).toString(), "0")
    }

    @TestCase
    func test_pow(): Unit {
        let a = Decimal(2)
        let result = a ** 10
        @Expect(result.toString(), "1024")
    }

    @TestCase
    func test_pow_zero_exponent(): Unit {
        let a = Decimal(42)
        @Expect((a ** 0).toString(), "1")
    }

    @TestCase
    func test_pow_one(): Unit {
        let a = Decimal(1)
        @Expect((a ** 100).toString(), "1")
    }

    @TestCase
    func test_div_with_precision(): Unit {
        let a = Decimal(1)
        let b = Decimal(3)
        let result = a.divWithPrecision(b, 5)
        @Expect(result.toString(), "0.33333")
    }

    @TestCase
    func test_div_and_mod(): Unit {
        let a = Decimal(10)
        let b = Decimal(3)
        let (q, r) = a.divAndMod(b)
        @Expect(q.toString(), "3")
        @Assert(r.toString().startsWith("1"))
    }

    // ==================== Comparison ====================

    @TestCase
    func test_compare(): Unit {
        let a = Decimal(10)
        let b = Decimal(20)
        @Expect(a.compare(b), Ordering.LT)
        @Expect(b.compare(a), Ordering.GT)
        @Expect(a.compare(Decimal(10)), Ordering.EQ)
    }

    @TestCase
    func test_operators(): Unit {
        let a = Decimal(10)
        let b = Decimal(20)
        @Assert(a < b)
        @Assert(b > a)
        @Assert(a <= a)
        @Assert(a <= b)
        @Assert(b >= a)
        @Assert(b >= b)
        @Assert(a == Decimal(10))
        @Assert(a != b)
    }

    // ==================== Conversions ====================

    @TestCase
    func test_to_int8(): Unit {
        let d = Decimal(42)
        @Expect(d.toInt8(), 42i8)
    }

    @TestCase
    func test_to_int16(): Unit {
        let d = Decimal(1000)
        @Expect(d.toInt16(), 1000i16)
    }

    @TestCase
    func test_to_int32(): Unit {
        let d = Decimal(100000)
        @Expect(d.toInt32(), 100000i32)
    }

    @TestCase
    func test_to_int64(): Unit {
        let d = Decimal(123456789)
        @Expect(d.toInt64(), 123456789)
    }

    @TestCase
    func test_to_int64_overflow_throws(): Unit {
        let d = Decimal.parse("99999999999999999999")
        try {
            let _ = d.toInt64()
            @Assert(false)
        } catch (e: OverflowException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_to_uint8(): Unit {
        let d = Decimal(200)
        @Expect(d.toUInt8(), 200u8)
    }

    @TestCase
    func test_to_uint16(): Unit {
        let d = Decimal(60000)
        @Expect(d.toUInt16(), 60000u16)
    }

    @TestCase
    func test_to_uint32(): Unit {
        let d = Decimal(4000000000u64)
        @Expect(d.toUInt32(), 4000000000u32)
    }

    @TestCase
    func test_to_uint64(): Unit {
        let d = Decimal(18446744073709551615u64)
        @Expect(d.toUInt64(), 18446744073709551615u64)
    }

    @TestCase
    func test_to_uint64_negative_throws(): Unit {
        let d = Decimal(-1)
        try {
            let _ = d.toUInt64()
            @Assert(false)
        } catch (e: OverflowException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_to_bigint(): Unit {
        let d = Decimal(42)
        @Expect(d.toBigInt().toString(), "42")
    }

    @TestCase
    func test_to_bigint_fractional(): Unit {
        let d = Decimal.parse("3.14")
        @Expect(d.toBigInt().toString(), "3")
    }

    @TestCase
    func test_to_float64(): Unit {
        let d = Decimal(42)
        @Expect(d.toFloat64(), Float64(42.0))
    }

    @TestCase
    func test_to_float32(): Unit {
        let d = Decimal(42)
        @Expect(d.toFloat32(), Float32(42.0))
    }

    @TestCase
    func test_to_float16(): Unit {
        let d = Decimal(42)
        @Assert(d.toFloat16() > Float16(41.0))
    }

    @TestCase
    func test_is_integer(): Unit {
        let d = Decimal(42)
        @Assert(d.isInteger())
        let d2 = Decimal.parse("3.14")
        @Assert(!d2.isInteger())
    }

    // ==================== Formatting ====================

    @TestCase
    func test_to_string(): Unit {
        let d = Decimal(42)
        @Expect(d.toString(), "42")
    }

    @TestCase
    func test_to_string_decimal(): Unit {
        let d = Decimal.parse("3.1400")
        @Assert(d.toString().contains("3.14"))
    }

    @TestCase
    func test_hashcode(): Unit {
        let a = Decimal(42)
        let b = Decimal(42)
        @Expect(a.hashCode(), b.hashCode())
    }

    // ==================== scale operations ====================

    @TestCase
    func test_shift_point(): Unit {
        let d = Decimal.parse("1.23")
        let shifted = d.shiftPoint(2i32)
        @Assert(shifted.toString().contains("123"))
    }


    @TestCase
    func test_remove_trailing_zeros(): Unit {
        let d = Decimal.parse("1.23000")
        let cleaned = d.removeTrailingZeros()
        @Expect(cleaned.toString(), "1.23")
    }

    @TestCase
    func test_scale_unit(): Unit {
        let d = Decimal.parse("1.23")
        let unit = d.scaleUnit()
        @Expect(unit.toString(), "0.01")
    }

    // ==================== Rounding ====================

    @TestCase
    func test_round_with_precision(): Unit {
        let d = Decimal.parse("1.23456789")
        let rounded = d.roundWithPrecision(4)
        @Assert(!rounded.toString().isEmpty())
    }

    @TestCase
    func test_sqrt_global(): Unit {
        let d = Decimal(4)
        let s = sqrt(d)
        @Expect(s.toString(), "2")
    }

    @TestCase
    func test_round_global(): Unit {
        let d = Decimal.parse("3.7")
        let r = round(d)
        @Expect(r.toString(), "4")
    }

    @TestCase
    func test_abs_global(): Unit {
        let d = Decimal(-42)
        let a = abs(d)
        @Expect(a.toString(), "42")
    }
}
