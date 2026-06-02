/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC: %run %run_opt %output %run_utest_opt %run_args --no-color

import std.unittest.prop_test.*
import std.random.*
import std.math.*

class UnfairRandomSource <: RandomSource {
    private let r = Random()

    public func nextUInt8() { UInt8(42) }
    public func nextUInt16() { UInt16(42) }
    public func nextUInt32() { UInt32(42) }
    public func nextUInt64() { UInt64(42) }
    public func nextFloat16() { Float16(42) }
    public func nextFloat32() { Float32(42) }
    public func nextFloat64() { Float64(42) }
    public func nextGaussianFloat64(mean!: Float64, sigma!: Float64) { Float64(42) }
    public func suggestUInt8() { UInt8(42) }
    public func suggestUInt16() { UInt16(42) }
    public func suggestUInt32() { UInt32(42) }
    public func suggestUInt64() { UInt64(42) }
    public func suggestInt8() { Int8(42) }
    public func suggestInt16() { Int16(42) }
    public func suggestInt32() { Int32(42) }
    public func suggestInt64() { Int64(42) }
    public func suggestFloat16() { Float16(42) }
    public func suggestFloat32() { Float32(42) }
    public func suggestFloat64() { Float64(42) }
}

@Test
func random_source_inheritance() {
    let rs = UnfairRandomSource()
    rs.nextBool()
    @Expect(rs.nextInt8() == Int8(42))
    @Expect(rs.nextInt16() == Int16(42))
    @Expect(rs.nextInt32() == Int32(42))
    @Expect(rs.nextInt64() == 42)
    @Expect(rs.nextIntNative() == IntNative(42))
    @Expect(rs.nextUIntNative() == UIntNative(42))
    @Expect(0 == rs.nextInt8(1))
    @Expect(0 == rs.nextInt16(1))
    @Expect(0 == rs.nextInt32(1))
    @Expect(0 == rs.nextInt64(1))
    @Expect(0 == rs.nextUInt8(1))
    @Expect(0 == rs.nextUInt16(1))
    @Expect(0 == rs.nextUInt32(1))
    @Expect(0 == rs.nextUInt64(1))

    @Expect(rs.suggestUInt8() == UInt8(42))
    @Expect(rs.suggestUInt16() == UInt16(42))
    @Expect(rs.suggestUInt32() == UInt32(42))
    @Expect(rs.suggestUInt64() == 42)
    @Expect(rs.suggestUIntNative() == UIntNative(42))
    @Expect(rs.suggestInt8() == Int8(42))
    @Expect(rs.suggestInt16() == Int16(42))
    @Expect(rs.suggestInt32() == Int32(42))
    @Expect(rs.suggestInt64() == 42)
    @Expect(rs.suggestIntNative() == IntNative(42))
    @Expect(rs.suggestFloat16() == Float16(42))
    @Expect(rs.suggestFloat32() == Float32(42))
    @Expect(rs.suggestFloat64() == Float64(42))
    rs.suggestBool()
    @Expect(rs.suggestInt64(Int64(42), Int64(42)) == 42)
    @Expect(rs.suggestUInt64(UInt64(42), UInt64(42)) == UInt64(42))
    @Expect(rs.suggestInt32(Int32(42), Int32(42)) == Int32(42))
    @Expect(rs.suggestUInt32(UInt32(42), UInt32(42)) == UInt32(42))
    @Expect(rs.suggestInt16(Int16(42), Int16(42)) == Int16(42))
    @Expect(rs.suggestUInt16(UInt16(42), UInt16(42)) == UInt16(42))
    @Expect(rs.suggestInt8(Int8(42), Int8(42)) == Int8(42))
    @Expect(rs.suggestUInt8(UInt8(42), UInt8(42)) == UInt8(42))
    @Expect(rs.suggestIntNative(IntNative(42), IntNative(42)) == IntNative(42))
    @Expect(rs.suggestUIntNative(UIntNative(42), UIntNative(42)) == UIntNative(42))
    @Expect(rs.suggestFloat64(Float64(42), Float64(42)) == Float64(42))
    @Expect(rs.suggestFloat32(Float32(42), Float32(42)) == Float32(42))
    @Expect(rs.suggestFloat16(Float16(42), Float16(42)) == Float16(42))
    
    @AssertThrows[IllegalArgumentException](rs.nextInt8(-1))
    @AssertThrows[IllegalArgumentException](rs.nextInt16(-1))
    @AssertThrows[IllegalArgumentException](rs.nextInt32(-1))
    @AssertThrows[IllegalArgumentException](rs.nextInt64(-1))

    @AssertThrows[IllegalArgumentException](rs.suggestFloat64(Float64(1), Float64(0)))
    @AssertThrows[IllegalArgumentException](rs.suggestFloat32(Float32(1), Float32(0)))
    @AssertThrows[IllegalArgumentException](rs.suggestFloat16(Float16(1), Float16(0)))

    @AssertThrows[IllegalArgumentException](rs.suggestFloat64(Float64.getNaN(), Float64(0)))
    @AssertThrows[IllegalArgumentException](rs.suggestFloat32(Float32.getNaN(), Float32(0)))
    @AssertThrows[IllegalArgumentException](rs.suggestFloat16(Float16.getNaN(), Float16(0)))

    @AssertThrows[IllegalArgumentException](rs.suggestFloat64(Float64(1), Float64.getNaN()))
    @AssertThrows[IllegalArgumentException](rs.suggestFloat32(Float32(1), Float32.getNaN()))
    @AssertThrows[IllegalArgumentException](rs.suggestFloat16(Float16(1), Float16.getNaN()))
}
