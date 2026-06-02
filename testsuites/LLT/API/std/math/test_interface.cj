/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args 

import std.math.*
import std.math.numeric.*

/*
 * Test description: Test the interface for math
 * Test class:
 *   public interface MaxMinValue<T>
 *   public interface Number<T>
 *   public interface Integer<T>
 *   public interface FloatingPoint<T>
 */
@Test
class InterfaceTest {
    let i8: Int8 = 0
    let i16: Int16 = 0
    let i32: Int32 = 0
    let i64: Int64 = 0
    let iN: IntNative = 0
    let u8: UInt8 = 0
    let u16: UInt16 = 0
    let u32: UInt32 = 0
    let u64: UInt64 = 0
    let uN: UIntNative = 0
    let f16: Float16 = 0.0
    let f32: Float32 = 0.0
    let f64: Float64 = 0.0
    let bigint: BigInt = BigInt(0)
    let decimal: Decimal = Decimal(0.0)

    @TestCase
    func testMaxMinValue(): Unit {
        @Expect(i8 is MaxMinValue<Int8>, true)
        @Expect(i16 is MaxMinValue<Int16>, true)
        @Expect(i32 is MaxMinValue<Int32>, true)
        @Expect(i64 is MaxMinValue<Int64>, true)
        @Expect(iN is MaxMinValue<IntNative>, true)
        @Expect(u8 is MaxMinValue<UInt8>, true)
        @Expect(u16 is MaxMinValue<UInt16>, true)
        @Expect(u32 is MaxMinValue<UInt32>, true)
        @Expect(u64 is MaxMinValue<UInt64>, true)
        @Expect(uN is MaxMinValue<UIntNative>, true)

        @Expect(f16 is MaxMinValue<Float16>, true)
        @Expect(f32 is MaxMinValue<Float32>, true)
        @Expect(f64 is MaxMinValue<Float64>, true)

        @Expect(bigint is MaxMinValue<BigInt>, false)
        @Expect(decimal is MaxMinValue<Decimal>, false)
    }

    @TestCase
    func testNumber(): Unit {
        @Expect(i8 is Number<Int8>, true)
        @Expect(i16 is Number<Int16>, true)
        @Expect(i32 is Number<Int32>, true)
        @Expect(i64 is Number<Int64>, true)
        @Expect(iN is Number<IntNative>, true)
        @Expect(u8 is Number<UInt8>, true)
        @Expect(u16 is Number<UInt16>, true)
        @Expect(u32 is Number<UInt32>, true)
        @Expect(u64 is Number<UInt64>, true)
        @Expect(uN is Number<UIntNative>, true)

        @Expect(f16 is Number<Float16>, true)
        @Expect(f32 is Number<Float32>, true)
        @Expect(f64 is Number<Float64>, true)

        @Expect(bigint is Number<BigInt>, true)
        @Expect(decimal is Number<Decimal>, true)
    }

    @TestCase
    func Integer(): Unit {
        @Expect(i8 is Integer<Int8>, true)
        @Expect(i16 is Integer<Int16>, true)
        @Expect(i32 is Integer<Int32>, true)
        @Expect(i64 is Integer<Int64>, true)
        @Expect(iN is Integer<IntNative>, true)
        @Expect(u8 is Integer<UInt8>, true)
        @Expect(u16 is Integer<UInt16>, true)
        @Expect(u32 is Integer<UInt32>, true)
        @Expect(u64 is Integer<UInt64>, true)
        @Expect(uN is Integer<UIntNative>, true)

        @Expect(f16 is Integer<Float16>, false)
        @Expect(f32 is Integer<Float32>, false)
        @Expect(f64 is Integer<Float64>, false)

        @Expect(bigint is Integer<BigInt>, true)
        @Expect(decimal is Integer<Decimal>, false)
    }

    @TestCase
    func Integer_isSigned(): Unit {
        @Expect(Int8.isSigned())
        @Expect(Int16.isSigned())
        @Expect(Int32.isSigned())
        @Expect(Int64.isSigned())
        @Expect(IntNative. isSigned())

        @Expect(!UInt8.isSigned())
        @Expect(!UInt16.isSigned())
        @Expect(!UInt32.isSigned())
        @Expect(!UInt64.isSigned())
        @Expect(!UIntNative.isSigned())

        @Expect(BigInt.isSigned())
    }

    @TestCase
    func testFloatingPoint(): Unit {
        @Expect(i8 is FloatingPoint<Int8>, false)
        @Expect(i16 is FloatingPoint<Int16>, false)
        @Expect(i32 is FloatingPoint<Int32>, false)
        @Expect(i64 is FloatingPoint<Int64>, false)
        @Expect(iN is FloatingPoint<IntNative>, false)
        @Expect(u8 is FloatingPoint<UInt8>, false)
        @Expect(u16 is FloatingPoint<UInt16>, false)
        @Expect(u32 is FloatingPoint<UInt32>, false)
        @Expect(u64 is FloatingPoint<UInt64>, false)
        @Expect(uN is FloatingPoint<UIntNative>, false)

        @Expect(f16 is FloatingPoint<Float16>, true)
        @Expect(f32 is FloatingPoint<Float32>, true)
        @Expect(f64 is FloatingPoint<Float64>, true)

        @Expect(bigint is FloatingPoint<BigInt>, false)
        @Expect(decimal is FloatingPoint<Decimal>, false)
    }
}
