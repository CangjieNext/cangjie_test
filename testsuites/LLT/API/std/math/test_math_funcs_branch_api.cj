/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt


import std.math.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class MathFuncsBranchTest {

    // ==================== leadingZeros ====================

    @TestCase
    func test_leadingzeros_uint64_max(): Unit {
        @Expect(leadingZeros(UInt64.Max), 0)
    }

    @TestCase
    func test_leadingzeros_uint64_zero(): Unit {
        @Expect(leadingZeros(0u64), 64)
    }

    @TestCase
    func test_leadingzeros_uint64_one(): Unit {
        @Expect(leadingZeros(1u64), 63)
    }

    @TestCase
    func test_leadingzeros_uint32(): Unit {
        @Expect(leadingZeros(0u32), 32)
        @Expect(leadingZeros(1u32), 31)
    }

    @TestCase
    func test_leadingzeros_uint16(): Unit {
        @Expect(leadingZeros(0u16), 16)
        @Expect(leadingZeros(1u16), 15)
    }

    @TestCase
    func test_leadingzeros_uint8(): Unit {
        @Expect(leadingZeros(0u8), 8)
        @Expect(leadingZeros(1u8), 7)
    }

    @TestCase
    func test_leadingzeros_int64(): Unit {
        @Expect(leadingZeros(0), 64)
        @Expect(leadingZeros(1), 63)
        @Expect(leadingZeros(-1), 0)
    }

    @TestCase
    func test_leadingzeros_int32(): Unit {
        @Expect(leadingZeros(0i32), 32)
        @Expect(leadingZeros(1i32), 31)
        @Expect(leadingZeros(-1i32), 0)
    }

    @TestCase
    func test_leadingzeros_int16(): Unit {
        @Expect(leadingZeros(0i16), 16)
        @Expect(leadingZeros(1i16), 15)
        @Expect(leadingZeros(-1i16), 0)
    }

    @TestCase
    func test_leadingzeros_int8(): Unit {
        @Expect(leadingZeros(0i8), 8)
        @Expect(leadingZeros(1i8), 7)
        @Expect(leadingZeros(-1i8), 0)
    }

    // ==================== trailingZeros ====================

    @TestCase
    func test_trailingzeros_uint64(): Unit {
        @Expect(trailingZeros(0u64), 64)
        @Expect(trailingZeros(1u64), 0)
        @Expect(trailingZeros(8u64), 3)
    }

    @TestCase
    func test_trailingzeros_uint32(): Unit {
        @Expect(trailingZeros(0u32), 32)
        @Expect(trailingZeros(4u32), 2)
    }

    @TestCase
    func test_trailingzeros_uint16(): Unit {
        @Expect(trailingZeros(0u16), 16)
        @Expect(trailingZeros(2u16), 1)
    }

    @TestCase
    func test_trailingzeros_uint8(): Unit {
        @Expect(trailingZeros(0u8), 8)
        @Expect(trailingZeros(16u8), 4)
    }

    @TestCase
    func test_trailingzeros_int64(): Unit {
        @Expect(trailingZeros(0), 64)
        @Expect(trailingZeros(1), 0)
        @Expect(trailingZeros(8), 3)
    }

    @TestCase
    func test_trailingzeros_int32(): Unit {
        @Expect(trailingZeros(0i32), 32)
        @Expect(trailingZeros(4i32), 2)
    }

    @TestCase
    func test_trailingzeros_int16(): Unit {
        @Expect(trailingZeros(0i16), 16)
    }

    @TestCase
    func test_trailingzeros_int8(): Unit {
        @Expect(trailingZeros(0i8), 8)
    }

    // ==================== countOnes ====================

    @TestCase
    func test_countones_uint64(): Unit {
        @Expect(countOnes(0u64), 0)
        @Expect(countOnes(UInt64.Max), 64)
        @Expect(countOnes(7u64), 3)
    }

    @TestCase
    func test_countones_uint32(): Unit {
        @Expect(countOnes(0u32), 0)
        @Expect(countOnes(255u32), 8)
    }

    @TestCase
    func test_countones_uint16(): Unit {
        @Expect(countOnes(0u16), 0)
    }

    @TestCase
    func test_countones_uint8(): Unit {
        @Expect(countOnes(0u8), 0)
        @Expect(countOnes(255u8), 8)
    }

    @TestCase
    func test_countones_int64(): Unit {
        @Expect(countOnes(0), 0)
        @Expect(countOnes(7), 3)
        @Assert(countOnes(-1) >= 0)
    }

    @TestCase
    func test_countones_int32(): Unit {
        @Expect(countOnes(0i32), 0)
    }

    @TestCase
    func test_countones_int16(): Unit {
        @Expect(countOnes(0i16), 0)
    }

    @TestCase
    func test_countones_int8(): Unit {
        @Expect(countOnes(0i8), 0)
    }

    // ==================== reverse ====================

    @TestCase
    func test_reverse_uint64(): Unit {
        @Expect(reverse(0u64), 0u64)
        @Expect(reverse(1u64), 0x8000000000000000u64)
    }

    @TestCase
    func test_reverse_uint32(): Unit {
        @Expect(reverse(0u32), 0u32)
    }

    @TestCase
    func test_reverse_uint16(): Unit {
        @Expect(reverse(0u16), 0u16)
    }

    @TestCase
    func test_reverse_uint8(): Unit {
        @Expect(reverse(0u8), 0u8)
    }

    // ==================== checkedAbs ====================

    @TestCase
    func test_checkedabs_int64_positive(): Unit {
        match (checkedAbs(42)) {
            case Some(v) => @Expect(v, 42)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_checkedabs_int64_negative(): Unit {
        match (checkedAbs(-42)) {
            case Some(v) => @Expect(v, 42)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_checkedabs_int64_min(): Unit {
        match (checkedAbs(Int64.Min)) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_checkedabs_int32_min(): Unit {
        match (checkedAbs(Int32.Min)) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_checkedabs_int16_min(): Unit {
        match (checkedAbs(Int16.Min)) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_checkedabs_int8_min(): Unit {
        match (checkedAbs(Int8.Min)) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    // ==================== rotate ====================

    @TestCase
    func test_rotate_uint8(): Unit {
        @Expect(rotate(0x01u8, 1i8), 0x02u8)
        @Expect(rotate(0x80u8, 1i8), 0x01u8)
    }

    @TestCase
    func test_rotate_uint16(): Unit {
        @Expect(rotate(1u16, 1i8), 2u16)
    }

    @TestCase
    func test_rotate_uint32(): Unit {
        @Expect(rotate(1u32, 1i8), 2u32)
    }

    @TestCase
    func test_rotate_uint64(): Unit {
        @Expect(rotate(1u64, 1i8), 2u64)
    }

    @TestCase
    func test_rotate_int64(): Unit {
        @Expect(rotate(1, 1i8), 2)
    }

    @TestCase
    func test_rotate_int32(): Unit {
        @Expect(rotate(1i32, 1i8), 2i32)
    }

    // ==================== gcd ====================

    @TestCase
    func test_gcd_int64(): Unit {
        @Expect(gcd(48, 18), 6)
        @Expect(gcd(17, 13), 1)
        @Expect(gcd(0, 5), 5)
        @Expect(gcd(5, 0), 5)
        @Expect(gcd(0, 0), 0)
    }

    @TestCase
    func test_gcd_int32(): Unit {
        @Expect(gcd(12i32, 8i32), 4i32)
    }

    @TestCase
    func test_gcd_int16(): Unit {
        @Expect(gcd(12i16, 8i16), 4i16)
    }

    @TestCase
    func test_gcd_int8(): Unit {
        @Expect(gcd(12i8, 8i8), 4i8)
    }

    @TestCase
    func test_gcd_uint64(): Unit {
        @Expect(gcd(48u64, 18u64), 6u64)
        @Expect(gcd(17u64, 13u64), 1u64)
    }

    @TestCase
    func test_gcd_uint32(): Unit {
        @Expect(gcd(12u32, 8u32), 4u32)
    }

    @TestCase
    func test_gcd_uint16(): Unit {
        @Expect(gcd(12u16, 8u16), 4u16)
    }

    @TestCase
    func test_gcd_uint8(): Unit {
        @Expect(gcd(12u8, 8u8), 4u8)
    }

    @TestCase
    func test_gcd_negative(): Unit {
        @Expect(gcd(-48, 18), 6)
        @Expect(gcd(48, -18), 6)
        @Expect(gcd(-48, -18), 6)
    }

    // ==================== lcm ====================

    @TestCase
    func test_lcm_int64(): Unit {
        @Expect(lcm(12, 18), 36)
        @Expect(lcm(17, 13), 221)
        @Expect(lcm(0, 5), 0)
        @Expect(lcm(5, 0), 0)
    }

    @TestCase
    func test_lcm_int32(): Unit {
        @Expect(lcm(6i32, 8i32), 24i32)
    }

    @TestCase
    func test_lcm_int16(): Unit {
        @Expect(lcm(6i16, 8i16), 24i16)
    }

    @TestCase
    func test_lcm_int8(): Unit {
        @Expect(lcm(6i8, 8i8), 24i8)
    }

    @TestCase
    func test_lcm_uint64(): Unit {
        @Expect(lcm(12u64, 18u64), 36u64)
    }

    @TestCase
    func test_lcm_uint32(): Unit {
        @Expect(lcm(6u32, 8u32), 24u32)
    }

    @TestCase
    func test_lcm_uint16(): Unit {
        @Expect(lcm(6u16, 8u16), 24u16)
    }

    @TestCase
    func test_lcm_uint8(): Unit {
        @Expect(lcm(6u8, 8u8), 24u8)
    }

    // ==================== Trig functions (Float64) ====================

    @TestCase
    func test_tan_float64(): Unit {
        let v = tan(Float64(0.0))
        @Assert(v == Float64(0.0))
    }

    @TestCase
    func test_asin_float64(): Unit {
        let v = asin(Float64(0.0))
        @Assert(v == Float64(0.0))
    }

    @TestCase
    func test_acos_float64(): Unit {
        let v = acos(Float64(1.0))
        @Assert(v == Float64(0.0) || abs(v - Float64(0.0)) < Float64(1e-10))
    }

    @TestCase
    func test_atan_float64(): Unit {
        let v = atan(Float64(0.0))
        @Assert(v == Float64(0.0))
    }

    @TestCase
    func test_sinh_float64(): Unit {
        let v = sinh(Float64(0.0))
        @Assert(v == Float64(0.0))
    }

    @TestCase
    func test_cosh_float64(): Unit {
        let v = cosh(Float64(0.0))
        @Assert(abs(v - Float64(1.0)) < Float64(1e-10))
    }

    @TestCase
    func test_tanh_float64(): Unit {
        let v = tanh(Float64(0.0))
        @Assert(v == Float64(0.0))
    }

    @TestCase
    func test_asinh_float64(): Unit {
        let v = asinh(Float64(0.0))
        @Assert(v == Float64(0.0))
    }

    @TestCase
    func test_acosh_float64(): Unit {
        let v = acosh(Float64(1.0))
        @Assert(v == Float64(0.0) || abs(v - Float64(0.0)) < Float64(1e-10))
    }

    @TestCase
    func test_atanh_float64(): Unit {
        let v = atanh(Float64(0.0))
        @Assert(v == Float64(0.0))
    }

    @TestCase
    func test_atan2_float64(): Unit {
        let v = atan2(Float64(1.0), Float64(0.0))
        @Assert(v > Float64(0.0))
    }

    @TestCase
    func test_cbrt_float64(): Unit {
        let v = cbrt(Float64(8.0))
        @Assert(abs(v - Float64(2.0)) < Float64(0.001))
    }

    @TestCase
    func test_logbase_float64(): Unit {
        let v = logBase(Float64(8.0), Float64(2.0))
        @Assert(abs(v - Float64(3.0)) < Float64(0.001))
    }

    @TestCase
    func test_gamma_float64(): Unit {
        let v = gamma(Float64(1.0))
        @Assert(abs(v - Float64(1.0)) < Float64(0.001))
    }

    @TestCase
    func test_erf_float64(): Unit {
        let v = erf(Float64(0.0))
        @Assert(v == Float64(0.0))
    }

    @TestCase
    func test_fmod_float64(): Unit {
        let v = fmod(Float64(5.0), Float64(2.0))
        @Assert(abs(v - Float64(1.0)) < Float64(0.001))
    }

    // ==================== clamp ====================

    @TestCase
    func test_clamp_float64_in_range(): Unit {
        let v = clamp(Float64(5.0), Float64(0.0), Float64(10.0))
        @Assert(v == Float64(5.0))
    }

    @TestCase
    func test_clamp_float64_below(): Unit {
        let v = clamp(Float64(-1.0), Float64(0.0), Float64(10.0))
        @Assert(v == Float64(0.0))
    }

    @TestCase
    func test_clamp_float64_above(): Unit {
        let v = clamp(Float64(11.0), Float64(0.0), Float64(10.0))
        @Assert(v == Float64(10.0))
    }

    @TestCase
    func test_clamp_float32(): Unit {
        let v = clamp(Float32(5.0), Float32(0.0), Float32(10.0))
        @Assert(v == Float32(5.0))
    }

    @TestCase
    func test_clamp_float16(): Unit {
        let v = clamp(Float16(5.0), Float16(0.0), Float16(10.0))
        @Assert(v == Float16(5.0))
    }

    // ==================== round ====================

    @TestCase
    func test_round_float64(): Unit {
        @Assert(round(Float64(3.3)) == Float64(3.0))
        @Assert(round(Float64(3.7)) == Float64(4.0))
        @Assert(round(Float64(-3.3)) == Float64(-3.0))
        @Assert(round(Float64(0.0)) == Float64(0.0))
    }

    @TestCase
    func test_round_float32(): Unit {
        @Assert(round(Float32(3.3)) == Float32(3.0))
        @Assert(round(Float32(3.7)) == Float32(4.0))
    }

    @TestCase
    func test_round_float16(): Unit {
        @Assert(round(Float16(3.3)) == Float16(3.0))
        @Assert(round(Float16(3.7)) == Float16(4.0))
    }
}
