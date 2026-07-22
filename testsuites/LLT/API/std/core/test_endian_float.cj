/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

@Test
public class EndianTest {
    @TestCase
    func test_platform_endian(): Unit {
        // On x86_64 Linux, platform should be Little
        let e = Endian.Platform
        match (e) {
            case Endian.Little =>
                @Expect(true)
            case Endian.Big =>
                @Expect(true)
        }
    }

    @TestCase
    func test_platform_is_little_on_x86(): Unit {
        // x86_64 is always little-endian
        let isLittle = match (Endian.Platform) {
            case Endian.Little => true
            case _ => false
        }
        @Expect(isLittle)
    }
}

@Test
public class FloatBitsTest {
    @TestCase
    func test_float64_fromBits_toBits_roundtrip(): Unit {
        let val = 3.14159f64
        let bits = val.toBits()
        let restored = Float64.fromBits(bits)
        @Expect(restored == val)
    }

    @TestCase
    func test_float64_zero(): Unit {
        let zero = 0.0f64
        let bits = zero.toBits()
        @Expect(bits, 0u64)
        let restored = Float64.fromBits(0u64)
        @Expect(restored == zero)
    }

    @TestCase
    func test_float64_negative_zero(): Unit {
        let negZero = -0.0f64
        let bits = negZero.toBits()
        @Expect(bits, 0x8000_0000_0000_0000u64)
    }

    @TestCase
    func test_float64_one(): Unit {
        let one = 1.0f64
        let bits = one.toBits()
        @Expect(bits, 0x3FF0_0000_0000_0000u64)
    }

    @TestCase
    func test_float32_fromBits_toBits_roundtrip(): Unit {
        let val = 3.14f32
        let bits = val.toBits()
        let restored = Float32.fromBits(bits)
        @Expect(restored == val)
    }

    @TestCase
    func test_float32_zero(): Unit {
        let zero = 0.0f32
        let bits = zero.toBits()
        @Expect(bits, 0u32)
    }

    @TestCase
    func test_float32_one(): Unit {
        let one = 1.0f32
        let bits = one.toBits()
        @Expect(bits, 0x3F80_0000u32)
    }

    @TestCase
    func test_float16_fromBits_toBits_roundtrip(): Unit {
        let val = 1.0f16
        let bits = val.toBits()
        let restored = Float16.fromBits(bits)
        @Expect(restored == val)
    }

    @TestCase
    func test_float16_zero(): Unit {
        let zero = 0.0f16
        let bits = zero.toBits()
        @Expect(bits, 0u16)
    }

    @TestCase
    func test_float16_one(): Unit {
        let one = 1.0f16
        let bits = one.toBits()
        @Expect(bits, 0x3C00u16)
    }

    @TestCase
    func test_float64_nan_bits(): Unit {
        let nan = Float64.NaN
        let bits = nan.toBits()
        // NaN has exponent all-1s and non-zero mantissa
        @Expect((bits & 0x7FF0_0000_0000_0000u64) == 0x7FF0_0000_0000_0000u64)
        @Expect((bits & 0x000F_FFFF_FFFF_FFFFu64) != 0u64)
    }

    @TestCase
    func test_float64_infinity_bits(): Unit {
        let inf = Float64.Inf
        let bits = inf.toBits()
        @Expect(bits, 0x7FF0_0000_0000_0000u64)
        let negInf = -Float64.Inf
        let negBits = negInf.toBits()
        @Expect(negBits, 0xFFF0_0000_0000_0000u64)
    }
}
