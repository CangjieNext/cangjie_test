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
public class BigIntBranchApiTest {

    // ==================== Constructor edge cases ====================

    @TestCase
    func test_init_int8_min(): Unit {
        let n = BigInt(Int8.Min)
        @Expect(n.toString(), "-128")
    }

    @TestCase
    func test_init_int8_max(): Unit {
        let n = BigInt(Int8.Max)
        @Expect(n.toString(), "127")
    }

    @TestCase
    func test_init_int16_min(): Unit {
        let n = BigInt(Int16.Min)
        @Expect(n.toString(), "-32768")
    }

    @TestCase
    func test_init_int16_max(): Unit {
        let n = BigInt(Int16.Max)
        @Expect(n.toString(), "32767")
    }

    @TestCase
    func test_init_int32_min(): Unit {
        let n = BigInt(Int32.Min)
        @Expect(n.toString(), "-2147483648")
    }

    @TestCase
    func test_init_int32_max(): Unit {
        let n = BigInt(Int32.Max)
        @Expect(n.toString(), "2147483647")
    }

    @TestCase
    func test_init_int64_min(): Unit {
        let n = BigInt(Int64.Min)
        @Expect(n.toString(), "-9223372036854775808")
    }

    @TestCase
    func test_init_int64_max(): Unit {
        let n = BigInt(Int64.Max)
        @Expect(n.toString(), "9223372036854775807")
    }

    @TestCase
    func test_init_uint8(): Unit {
        let n = BigInt(255u8)
        @Expect(n.toString(), "255")
        let n2 = BigInt(0u8)
        @Expect(n2.toString(), "0")
    }

    @TestCase
    func test_init_uint16(): Unit {
        let n = BigInt(65535u16)
        @Expect(n.toString(), "65535")
    }

    @TestCase
    func test_init_uint32(): Unit {
        let n = BigInt(4294967295u32)
        @Expect(n.toString(), "4294967295")
    }

    @TestCase
    func test_init_uint64(): Unit {
        let n = BigInt(18446744073709551615u64)
        @Expect(n.toString(), "18446744073709551615")
    }

    @TestCase
    func test_init_uint_native(): Unit {
        let n = BigInt(UIntNative(42))
        @Expect(n.toString(), "42")
    }

    @TestCase
    func test_init_int_native(): Unit {
        let n = BigInt(IntNative(42))
        @Expect(n.toString(), "42")
    }

    @TestCase
    func test_init_float16_positive(): Unit {
        let n = BigInt(Float16(3.5))
        @Expect(n.toString(), "3")
    }

    @TestCase
    func test_init_float16_negative(): Unit {
        let n = BigInt(Float16(-3.5))
        @Expect(n.toString(), "-3")
    }

    @TestCase
    func test_init_float16_zero(): Unit {
        let n = BigInt(Float16(0.0))
        @Expect(n.toString(), "0")
    }

    @TestCase
    func test_init_float32_positive(): Unit {
        let n = BigInt(Float32(3.5))
        @Expect(n.toString(), "3")
    }

    @TestCase
    func test_init_float32_negative(): Unit {
        let n = BigInt(Float32(-3.5))
        @Expect(n.toString(), "-3")
    }

    @TestCase
    func test_init_float32_zero(): Unit {
        let n = BigInt(Float32(0.0))
        @Expect(n.toString(), "0")
    }

    @TestCase
    func test_init_float64_positive(): Unit {
        let n = BigInt(Float64(3.5))
        @Expect(n.toString(), "3")
    }

    @TestCase
    func test_init_float64_negative(): Unit {
        let n = BigInt(Float64(-3.5))
        @Expect(n.toString(), "-3")
    }

    @TestCase
    func test_init_float64_zero(): Unit {
        let n = BigInt(Float64(0.0))
        @Expect(n.toString(), "0")
    }

    @TestCase
    func test_init_float64_large(): Unit {
        let n = BigInt(Float64(1.0e20))
        @Expect(n == BigInt.parse("100000000000000000000", radix: 10))
    }

    @TestCase
    func test_init_sign_bitlen_zero_throws(): Unit {
        try {
            let _ = BigInt(true, 0)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message.contains("bitLen"))
        }
    }

    @TestCase
    func test_init_sign_bitlen_small(): Unit {
        let n = BigInt(true, 8)
        let bl = n.bitLen
        @Assert(bl > 0 && bl <= 8)
    }

    @TestCase
    func test_init_sign_bitlen_large(): Unit {
        let n = BigInt(true, 128)
        let bl = n.bitLen
        @Assert(bl > 0)
    }

    @TestCase
    func test_init_string_parse_decimal(): Unit {
        let n = BigInt.parse("123456789")
        @Expect(n.toString(), "123456789")
    }

    @TestCase
    func test_init_string_parse_binary(): Unit {
        let n = BigInt.parse("1010", radix: 2)
        @Expect(n.toString(), "10")
    }

    @TestCase
    func test_init_string_parse_hex(): Unit {
        let n = BigInt.parse("ABCDEF", radix: 16)
        @Expect(n.toString(radix: 16).toAsciiUpper(), "ABCDEF")
    }

    @TestCase
    func test_init_string_parse_negative(): Unit {
        let n = BigInt.parse("-123456789")
        @Expect(n.toString(), "-123456789")
    }

    @TestCase
    func test_init_string_parse_zero(): Unit {
        let n = BigInt.parse("0")
        @Expect(n.toString(), "0")
    }

    // ==================== Properties ====================

    @TestCase
    func test_sign_positive(): Unit {
        let n = BigInt(42)
        @Expect(n.sign, 1)
    }

    @TestCase
    func test_sign_negative(): Unit {
        let n = BigInt(-42)
        @Expect(n.sign, -1)
    }

    @TestCase
    func test_sign_zero(): Unit {
        let n = BigInt(0)
        @Expect(n.sign, 0)
    }

    @TestCase
    func test_bitlen_zero(): Unit {
        let n = BigInt(0)
        @Assert(n.bitLen >= 0)
    }

    @TestCase
    func test_bitlen_positive(): Unit {
        let n = BigInt(255)
        @Expect(n.bitLen, 8)
    }

    @TestCase
    func test_bitlen_large(): Unit {
        let n = BigInt.parse("10000000000000000", radix: 16)
        @Expect(n.bitLen, 65)
    }

    @TestCase
    func test_bitlen_negative(): Unit {
        let n = BigInt(-1)
        @Assert(n.bitLen > 0)
    }

    @TestCase
    func test_testbit_zero(): Unit {
        let n = BigInt(0)
        @Assert(!n.testBit(0))
    }

    @TestCase
    func test_testbit_set(): Unit {
        let n = BigInt(4)
        @Assert(!n.testBit(0))
        @Assert(!n.testBit(1))
        @Assert(n.testBit(2))
    }

    @TestCase
    func test_testbit_negative(): Unit {
        let n = BigInt(-4)
        @Assert(!n.testBit(0))
    }

    // ==================== Bit operations ====================

    @TestCase
    func test_setbit_zero_to_one(): Unit {
        let n = BigInt(0)
        let result = n.setBit(5)
        @Expect(result.toString(), "32")
    }

    @TestCase
    func test_setbit_already_set(): Unit {
        let n = BigInt(32)
        let result = n.setBit(5)
        @Expect(result.toString(), "32")
    }

    @TestCase
    func test_setbit_negative(): Unit {
        let n = BigInt(-1)
        let result = n.setBit(10)
        @Assert(result.testBit(10))
    }

    @TestCase
    func test_clearbit_set(): Unit {
        let n = BigInt(32)
        let result = n.clearBit(5)
        @Expect(result.toString(), "0")
    }

    @TestCase
    func test_clearbit_already_clear(): Unit {
        let n = BigInt(0)
        let result = n.clearBit(5)
        @Expect(result.toString(), "0")
    }

    @TestCase
    func test_flipbit(): Unit {
        let n = BigInt(0)
        let result = n.flipBit(5)
        @Expect(result.toString(), "32")
    }

    @TestCase
    func test_flipbit_twice(): Unit {
        let n = BigInt(0)
        let result = n.flipBit(5).flipBit(5)
        @Expect(result.toString(), "0")
    }

    @TestCase
    func test_flipbit_negative(): Unit {
        let n = BigInt(-1)
        let result = n.flipBit(5)
        @Assert(!result.testBit(5))
    }

    // ==================== Trailing zeros / Count ones ====================

    @TestCase
    func test_trailing_zeros_power_of_two(): Unit {
        let n = BigInt(64)
        @Expect(trailingZeros(n), 6)
    }

    @TestCase
    func test_trailing_zeros_zero(): Unit {
        let n = BigInt(0)
        @Expect(trailingZeros(n), -1)
    }

    @TestCase
    func test_trailing_zeros_odd(): Unit {
        let n = BigInt(7)
        @Expect(trailingZeros(n), 0)
    }

    @TestCase
    func test_trailing_zeros_large(): Unit {
        let n = BigInt.parse("10000000000000000", radix: 16)
        @Expect(trailingZeros(n), 64)
    }

    @TestCase
    func test_count_ones_positive(): Unit {
        let n = BigInt(7)
        @Expect(countOnes(n), 3)
    }

    @TestCase
    func test_count_ones_zero(): Unit {
        let n = BigInt(0)
        @Expect(countOnes(n), 0)
    }

    @TestCase
    func test_count_ones_power_of_two(): Unit {
        let n = BigInt(32)
        @Expect(countOnes(n), 1)
    }

    @TestCase
    func test_count_ones_negative_small(): Unit {
        let n = BigInt(-1)
        @Expect(countOnes(n) > 0)
    }

    @TestCase
    func test_count_ones_negative_large(): Unit {
        let n = BigInt.parse("-FFFFFFFFFFFFFFFF", radix: 16)
        let c = countOnes(n)
        @Assert(c > 0)
    }

    @TestCase
    func test_count_ones_large(): Unit {
        let n = BigInt.parse("FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF", radix: 16)
        let c = countOnes(n)
        @Expect(c, 128)
    }

    // ==================== toString / hashCode ====================

    @TestCase
    func test_to_string_positive(): Unit {
        let n = BigInt(12345)
        @Expect(n.toString(), "12345")
    }

    @TestCase
    func test_to_string_negative(): Unit {
        let n = BigInt(-12345)
        @Expect(n.toString(), "-12345")
    }

    @TestCase
    func test_to_string_zero(): Unit {
        let n = BigInt(0)
        @Expect(n.toString(), "0")
    }

    @TestCase
    func test_to_string_radix_hex(): Unit {
        let n = BigInt(255)
        @Expect(n.toString(radix: 16).toAsciiLower(), "ff")
    }

    @TestCase
    func test_to_string_radix_binary(): Unit {
        let n = BigInt(5)
        @Expect(n.toString(radix: 2), "101")
    }

    @TestCase
    func test_to_string_radix_octal(): Unit {
        let n = BigInt(64)
        @Expect(n.toString(radix: 8), "100")
    }

    @TestCase
    func test_hashcode_same_value(): Unit {
        let a = BigInt(12345)
        let b = BigInt(12345)
        @Expect(a.hashCode(), b.hashCode())
    }

    @TestCase
    func test_hashcode_different(): Unit {
        let a = BigInt(12345)
        let b = BigInt(12346)
        @Assert(a.hashCode() != b.hashCode())
    }

    // ==================== toInt conversions ====================

    @TestCase
    func test_to_int8_in_range(): Unit {
        let n = BigInt(42)
        @Expect(n.toInt8(), 42i8)
    }

    @TestCase
    func test_to_int8_overflow_throwing(): Unit {
        let n = BigInt(200)
        try {
            let _ = n.toInt8()
            @Assert(false)
        } catch (e: OverflowException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_to_int8_overflow_wrapping(): Unit {
        let n = BigInt(200)
        let result = n.toInt8(overflowHandling: Wrapping)
        @Expect(result, -56i8)
    }

    @TestCase
    func test_to_int16_overflow_throwing(): Unit {
        let n = BigInt(40000)
        try {
            let _ = n.toInt16()
            @Assert(false)
        } catch (e: OverflowException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_to_int16_overflow_saturating(): Unit {
        let n = BigInt(40000)
        let result = n.toInt16(overflowHandling: Saturating)
        @Expect(result, Int16.Max)
    }

    @TestCase
    func test_to_int16_negative_overflow_saturating(): Unit {
        let n = BigInt(-40000)
        let result = n.toInt16(overflowHandling: Saturating)
        @Expect(result, Int16.Min)
    }

    @TestCase
    func test_to_int32_overflow_throwing(): Unit {
        let n = BigInt.parse("3000000000")
        try {
            let _ = n.toInt32()
            @Assert(false)
        } catch (e: OverflowException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_to_int32_overflow_saturating(): Unit {
        let n = BigInt.parse("3000000000")
        let result = n.toInt32(overflowHandling: Saturating)
        @Expect(result, Int32.Max)
    }

    @TestCase
    func test_to_int64_overflow_throwing(): Unit {
        let n = BigInt.parse("10000000000000000000")
        try {
            let _ = n.toInt64()
            @Assert(false)
        } catch (e: OverflowException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_to_int64_overflow_saturating(): Unit {
        let n = BigInt.parse("10000000000000000000")
        let result = n.toInt64(overflowHandling: Saturating)
        @Expect(result, Int64.Max)
    }

    @TestCase
    func test_to_int64_negative_overflow_saturating(): Unit {
        let n = BigInt.parse("-10000000000000000000")
        let result = n.toInt64(overflowHandling: Saturating)
        @Expect(result, Int64.Min)
    }

    @TestCase
    func test_to_int_native_overflow(): Unit {
        let n = BigInt.parse("100000000000000000000")
        let result = n.toIntNative(overflowHandling: Saturating)
        @Assert(result == IntNative(Int64.Max))
    }

    // ==================== toUInt conversions ====================

    @TestCase
    func test_to_uint8_in_range(): Unit {
        let n = BigInt(200)
        @Expect(n.toUInt8(), 200u8)
    }

    @TestCase
    func test_to_uint8_negative_throwing(): Unit {
        let n = BigInt(-1)
        try {
            let _ = n.toUInt8()
            @Assert(false)
        } catch (e: OverflowException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_to_uint8_overflow_throwing(): Unit {
        let n = BigInt(300)
        try {
            let _ = n.toUInt8()
            @Assert(false)
        } catch (e: OverflowException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_to_uint8_overflow_wrapping(): Unit {
        let n = BigInt(300)
        let result = n.toUInt8(overflowHandling: Wrapping)
        @Expect(result, 44u8)
    }

    @TestCase
    func test_to_uint16_overflow_saturating(): Unit {
        let n = BigInt(70000)
        let result = n.toUInt16(overflowHandling: Saturating)
        @Expect(result, UInt16.Max)
    }

    @TestCase
    func test_to_uint32_in_range(): Unit {
        let n = BigInt(4000000000u64)
        @Expect(n.toUInt32(), 4000000000u32)
    }

    @TestCase
    func test_to_uint32_overflow_saturating(): Unit {
        let n = BigInt.parse("5000000000")
        let result = n.toUInt32(overflowHandling: Saturating)
        @Expect(result, UInt32.Max)
    }

    @TestCase
    func test_to_uint64_negative_throwing(): Unit {
        let n = BigInt(-1)
        try {
            let _ = n.toUInt64()
            @Assert(false)
        } catch (e: OverflowException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_to_uint64_overflow_saturating(): Unit {
        let n = BigInt.parse("20000000000000000000")
        let result = n.toUInt64(overflowHandling: Saturating)
        @Expect(result, UInt64.Max)
    }

    @TestCase
    func test_to_uint_native_overflow(): Unit {
        let n = BigInt.parse("200000000000000000000")
        let result = n.toUIntNative(overflowHandling: Saturating)
        @Assert(result == UIntNative(UInt64.Max))
    }

    @TestCase
    func test_to_uint_native_negative_throwing(): Unit {
        let n = BigInt(-1)
        try {
            let _ = n.toUIntNative()
            @Assert(false)
        } catch (e: OverflowException) {
            @Assert(true)
        }
    }

    // ==================== toFloat conversions ====================

    @TestCase
    func test_to_float16(): Unit {
        let n = BigInt(42)
        let f = n.toFloat16()
        @Assert(f > Float16(41.0) && f < Float16(43.0))
    }

    @TestCase
    func test_to_float32(): Unit {
        let n = BigInt(42)
        @Expect(n.toFloat32(), Float32(42.0))
    }

    @TestCase
    func test_to_float64(): Unit {
        let n = BigInt(42)
        @Expect(n.toFloat64(), Float64(42.0))
    }

    @TestCase
    func test_to_float64_negative(): Unit {
        let n = BigInt(-42)
        @Expect(n.toFloat64(), Float64(-42.0))
    }

    @TestCase
    func test_to_float64_zero(): Unit {
        let n = BigInt(0)
        @Expect(n.toFloat64(), Float64(0.0))
    }

    // ==================== isProbablePrime ====================

    @TestCase
    func test_is_probable_prime_certainty_zero(): Unit {
        let n = BigInt(9)
        @Assert(n.isProbablePrime(0))
    }

    @TestCase
    func test_is_probable_prime_negative(): Unit {
        let n = BigInt(-7)
        @Assert(!n.isProbablePrime(1))
    }

    @TestCase
    func test_is_probable_prime_zero(): Unit {
        let n = BigInt(0)
        @Assert(!n.isProbablePrime(1))
    }

    @TestCase
    func test_is_probable_prime_one(): Unit {
        let n = BigInt(1)
        @Assert(!n.isProbablePrime(1))
    }

    @TestCase
    func test_is_probable_prime_two(): Unit {
        let n = BigInt(2)
        @Assert(n.isProbablePrime(1))
    }

    @TestCase
    func test_is_probable_prime_even(): Unit {
        let n = BigInt(100)
        @Assert(!n.isProbablePrime(1))
    }

    @TestCase
    func test_is_probable_prime_small_prime(): Unit {
        let n = BigInt(97)
        @Assert(n.isProbablePrime(5))
    }

    @TestCase
    func test_is_probable_prime_small_composite(): Unit {
        let n = BigInt(99)
        @Assert(!n.isProbablePrime(5))
    }

    @TestCase
    func test_is_probable_prime_large_prime(): Unit {
        let n = BigInt.parse("FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF61", radix: 16)
        @Assert(n.isProbablePrime(10))
    }

    // ==================== isSigned ====================

    @TestCase
    func test_is_signed(): Unit {
        @Assert(BigInt.isSigned())
    }

    // ==================== Unary negation ====================

    @TestCase
    func test_unary_neg_positive(): Unit {
        let n = BigInt(42)
        let neg = -n
        @Expect(neg.toString(), "-42")
    }

    @TestCase
    func test_unary_neg_negative(): Unit {
        let n = BigInt(-42)
        let neg = -n
        @Expect(neg.toString(), "42")
    }

    @TestCase
    func test_unary_neg_zero(): Unit {
        let n = BigInt(0)
        let neg = -n
        @Expect(neg.toString(), "0")
    }

    // ==================== Arithmetic operators ====================

    @TestCase
    func test_add_zero(): Unit {
        let n = BigInt(42)
        @Expect(n + BigInt(0) == n)
        @Expect(BigInt(0) + n == n)
    }

    @TestCase
    func test_sub_zero(): Unit {
        let n = BigInt(42)
        @Expect(n - BigInt(0) == n)
    }

    @TestCase
    func test_sub_from_zero(): Unit {
        let n = BigInt(42)
        let result = BigInt(0) - n
        @Expect(result.toString(), "-42")
    }

    @TestCase
    func test_mul_zero(): Unit {
        let n = BigInt(42)
        @Expect(n * BigInt(0) == BigInt(0))
        @Expect(BigInt(0) * n == BigInt(0))
    }

    @TestCase
    func test_div_zero_throws(): Unit {
        let n = BigInt(42)
        try {
            let _ = n / BigInt(0)
            @Assert(false)
        } catch (e: ArithmeticException) {
            @Assert(e.message.contains("zero"))
        }
    }

    @TestCase
    func test_mod_zero_throws(): Unit {
        let n = BigInt(42)
        try {
            let _ = n % BigInt(0)
            @Assert(false)
        } catch (e: ArithmeticException) {
            @Assert(e.message.contains("zero"))
        }
    }

    @TestCase
    func test_pow_zero_exponent(): Unit {
        let n = BigInt(42)
        @Expect((n ** 0u64).toString(), "1")
    }

    @TestCase
    func test_pow_zero_base(): Unit {
        let n = BigInt(0)
        @Expect((n ** 5u64).toString(), "0")
    }

    @TestCase
    func test_pow_base_one(): Unit {
        let n = BigInt(1)
        @Expect((n ** 100u64).toString(), "1")
    }

    @TestCase
    func test_pow_negative_base_odd(): Unit {
        let n = BigInt(-2)
        @Expect((n ** 3u64).toString(), "-8")
    }

    @TestCase
    func test_pow_negative_base_even(): Unit {
        let n = BigInt(-2)
        @Expect((n ** 4u64).toString(), "16")
    }

    @TestCase
    func test_div_and_mod_positive(): Unit {
        let n = BigInt(10)
        let (q, r) = n.divAndMod(BigInt(3))
        @Expect(q.toString(), "3")
        @Expect(r.toString(), "1")
    }


    @TestCase
    func test_div_and_mod_negative_divisor(): Unit {
        let n = BigInt(10)
        let (q, r) = n.divAndMod(BigInt(-3))
        @Expect(q.toString(), "-3")
        @Expect(r.toString(), "1")
    }


    // ==================== modInverse ====================

    @TestCase
    func test_mod_inverse_other_one(): Unit {
        let n = BigInt(5)
        let inv = n.modInverse(BigInt(1))
        @Expect(inv.toString(), "0")
    }

    @TestCase
    func test_mod_inverse_zero_throws(): Unit {
        let n = BigInt(0)
        try {
            let _ = n.modInverse(BigInt(5))
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message.contains("relatively prime"))
        }
    }

    @TestCase
    func test_mod_inverse_other_zero_throws(): Unit {
        let n = BigInt(5)
        try {
            let _ = n.modInverse(BigInt(0))
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message.contains("relatively prime"))
        }
    }

    @TestCase
    func test_mod_inverse_positive(): Unit {
        let n = BigInt(3)
        let inv = n.modInverse(BigInt(7))
        @Expect(inv.toString(), "5")
    }

    @TestCase
    func test_mod_inverse_negative(): Unit {
        let n = BigInt(-3)
        let inv = n.modInverse(BigInt(7))
        @Assert((inv * n) % BigInt(7) == BigInt(1))
    }

    // ==================== modPow ====================

    @TestCase
    func test_mod_pow_no_modulus(): Unit {
        let n = BigInt(2)
        let result = n.modPow(BigInt(10))
        @Expect(result.toString(), "1024")
    }

    @TestCase
    func test_mod_pow_negative_exponent_throws(): Unit {
        let n = BigInt(2)
        try {
            let _ = n.modPow(BigInt(-1))
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message.contains("exponent"))
        }
    }

    @TestCase
    func test_mod_pow_modulus_zero_throws(): Unit {
        let n = BigInt(2)
        try {
            let _ = n.modPow(BigInt(3), m: BigInt(0))
            @Assert(false)
        } catch (e: ArithmeticException) {
            @Assert(e.message.contains("zero"))
        }
    }

    @TestCase
    func test_mod_pow_with_modulus(): Unit {
        let n = BigInt(2)
        let result = n.modPow(BigInt(10), m: BigInt(1000))
        @Expect(result.toString(), "24")
    }

    @TestCase
    func test_mod_pow_negative_base_with_modulus(): Unit {
        let n = BigInt(-2)
        let result = n.modPow(BigInt(3), m: BigInt(100))
        @Expect(result.toString(), "-8")
    }

    @TestCase
    func test_mod_pow_base_zero(): Unit {
        let n = BigInt(0)
        let result = n.modPow(BigInt(5))
        @Expect(result.toString(), "0")
    }

    @TestCase
    func test_mod_pow_base_zero_with_modulus(): Unit {
        let n = BigInt(0)
        let result = n.modPow(BigInt(5), m: BigInt(7))
        @Expect(result.toString(), "0")
    }

    // ==================== sqrt ====================

    @TestCase
    func test_sqrt_perfect_square(): Unit {
        let n = BigInt(100)
        @Expect(sqrt(n).toString(), "10")
    }

    @TestCase
    func test_sqrt_non_perfect(): Unit {
        let n = BigInt(101)
        @Expect(sqrt(n).toString(), "10")
    }

    @TestCase
    func test_sqrt_zero(): Unit {
        let n = BigInt(0)
        @Expect(sqrt(n).toString(), "0")
    }

    @TestCase
    func test_sqrt_one(): Unit {
        let n = BigInt(1)
        @Expect(sqrt(n).toString(), "1")
    }

    @TestCase
    func test_sqrt_negative_throws(): Unit {
        let n = BigInt(-4)
        try {
            let _ = sqrt(n)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message.contains("square root"))
        }
    }

    @TestCase
    func test_sqrt_large(): Unit {
        let n = BigInt.parse("FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF", radix: 16)
        let s = sqrt(n)
        @Assert(s * s <= n)
        @Assert((s + BigInt(1)) * (s + BigInt(1)) > n)
    }

    // ==================== gcd/lcm ====================

    @TestCase
    func test_gcd_zero_first(): Unit {
        let a = BigInt(0)
        let b = BigInt(42)
        let result = gcd(a, b)
        @Expect(result, BigInt(42))
    }

    @TestCase
    func test_gcd_zero_second(): Unit {
        let a = BigInt(42)
        let b = BigInt(0)
        let result = gcd(a, b)
        @Expect(result, BigInt(42))
    }

    @TestCase
    func test_gcd_both_zero(): Unit {
        let a = BigInt(0)
        let b = BigInt(0)
        let result = gcd(a, b)
        @Expect(result, BigInt(0))
    }

    @TestCase
    func test_gcd_coprime(): Unit {
        let a = BigInt(17)
        let b = BigInt(13)
        let result = gcd(a, b)
        @Expect(result, BigInt(1))
    }

    @TestCase
    func test_gcd_common_factor(): Unit {
        let a = BigInt(48)
        let b = BigInt(18)
        let result = gcd(a, b)
        @Expect(result, BigInt(6))
    }

    @TestCase
    func test_lcm_zero_first(): Unit {
        let a = BigInt(0)
        let b = BigInt(42)
        let result = lcm(a, b)
        @Expect(result, BigInt(0))
    }

    @TestCase
    func test_lcm_zero_second(): Unit {
        let a = BigInt(42)
        let b = BigInt(0)
        let result = lcm(a, b)
        @Expect(result, BigInt(0))
    }

    @TestCase
    func test_lcm_both_zero(): Unit {
        let a = BigInt(0)
        let b = BigInt(0)
        let result = lcm(a, b)
        @Expect(result, BigInt(0))
    }

    @TestCase
    func test_lcm_coprime(): Unit {
        let a = BigInt(17)
        let b = BigInt(13)
        let result = lcm(a, b)
        @Expect(result, BigInt(221))
    }

    @TestCase
    func test_lcm_common_factor(): Unit {
        let a = BigInt(12)
        let b = BigInt(18)
        let result = lcm(a, b)
        @Expect(result, BigInt(36))
    }

    // ==================== abs (global) ====================

    @TestCase
    func test_abs_positive(): Unit {
        let n = BigInt(42)
        @Expect(abs(n), BigInt(42))
    }

    @TestCase
    func test_abs_negative(): Unit {
        let n = BigInt(-42)
        @Expect(abs(n), BigInt(42))
    }

    @TestCase
    func test_abs_zero(): Unit {
        let n = BigInt(0)
        @Expect(abs(n), BigInt(0))
    }

    // ==================== randomProbablePrime ====================

    @TestCase
    func test_random_probable_prime_small(): Unit {
        let p = BigInt.randomProbablePrime(8, 10u64)
        @Assert(p.bitLen <= 8)
        @Assert(p.isProbablePrime(5))
    }

    @TestCase
    func test_random_probable_prime_bitlen_one_throws(): Unit {
        try {
            let _ = BigInt.randomProbablePrime(1, 10u64)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message.contains("bitLen"))
        }
    }

    // ==================== Comparison operators ====================

    @TestCase
    func test_compare_equal(): Unit {
        let a = BigInt(42)
        let b = BigInt(42)
        @Expect(a.compare(b), Ordering.EQ)
    }

    @TestCase
    func test_compare_less(): Unit {
        let a = BigInt(41)
        let b = BigInt(42)
        @Expect(a.compare(b), Ordering.LT)
    }

    @TestCase
    func test_compare_greater(): Unit {
        let a = BigInt(43)
        let b = BigInt(42)
        @Expect(a.compare(b), Ordering.GT)
    }

    @TestCase
    func test_compare_cross_zero(): Unit {
        let a = BigInt(-1)
        let b = BigInt(1)
        @Expect(a.compare(b), Ordering.LT)
    }

    @TestCase
    func test_equals_same(): Unit {
        let a = BigInt(42)
        let b = BigInt(42)
        @Assert(a == b)
        @Assert(a != BigInt(43))
    }

    @TestCase
    func test_less_than(): Unit {
        let a = BigInt(41)
        let b = BigInt(42)
        @Assert(a < b)
        @Assert(a <= a)
        @Assert(a <= b)
    }

    @TestCase
    func test_greater_than(): Unit {
        let a = BigInt(43)
        let b = BigInt(42)
        @Assert(a > b)
        @Assert(a >= a)
        @Assert(a >= b)
    }
}
