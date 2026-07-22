/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.math.*

@Test
public class ToStringFullTest {
    @TestCase
    func test_bool_toString(): Unit {
        @Expect(true.toString(), "true")
        @Expect(false.toString(), "false")
    }

    @TestCase
    func test_unit_toString(): Unit {
        @Expect(().toString(), "()")
    }

    @TestCase
    func test_rune_toString(): Unit {
        @Expect(r'a'.toString(), "a")
        @Expect(r'Z'.toString(), "Z")
        @Expect(r'0'.toString(), "0")
    }

    @TestCase
    func test_float64_toString(): Unit {
        @Expect(0.0f64.toString(), "0.000000")
        @Expect(1.0f64.toString(), "1.000000")
        @Expect((-1.5f64).toString(), "-1.500000")
    }

    @TestCase
    func test_float64_nan_toString(): Unit {
        let s = Float64.NaN.toString()
        @Expect(s.size > 0)
    }

    @TestCase
    func test_float64_inf_toString(): Unit {
        let s = Float64.Inf.toString()
        @Expect(s.size > 0)
    }

    @TestCase
    func test_float32_toString(): Unit {
        @Expect(0.0f32.toString(), "0.000000")
        @Expect(1.0f32.toString(), "1.000000")
    }

    @TestCase
    func test_float16_toString(): Unit {
        @Expect(0.0f16.toString(), "0.000000")
        @Expect(1.0f16.toString(), "1.000000")
    }

    @TestCase
    func test_int8_toString(): Unit {
        @Expect(Int8(0).toString(), "0")
        @Expect(Int8(127).toString(), "127")
        @Expect(Int8(-128).toString(), "-128")
    }

    @TestCase
    func test_int16_toString(): Unit {
        @Expect(Int16(0).toString(), "0")
        @Expect(Int16(32767).toString(), "32767")
        @Expect(Int16(-32768).toString(), "-32768")
    }

    @TestCase
    func test_int32_toString(): Unit {
        @Expect(Int32(0).toString(), "0")
        @Expect(Int32(2147483647).toString(), "2147483647")
        @Expect(Int32(-2147483648).toString(), "-2147483648")
    }

    @TestCase
    func test_uint8_toString(): Unit {
        @Expect(UInt8(0).toString(), "0")
        @Expect(UInt8(255).toString(), "255")
    }

    @TestCase
    func test_uint16_toString(): Unit {
        @Expect(UInt16(0).toString(), "0")
        @Expect(UInt16(65535).toString(), "65535")
    }

    @TestCase
    func test_uint32_toString(): Unit {
        @Expect(UInt32(0).toString(), "0")
        @Expect(UInt32(4294967295).toString(), "4294967295")
    }
}
