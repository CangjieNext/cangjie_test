/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-0: %run %run_opt %output %run_utest_opt %run_args --no-color --random-seed=90

import std.unittest.prop_test.*
import std.random.*

interface Floatable<T> where T <: ArbitraryRange<T> & ToString {
    func isNaN(): Bool
    func toFloat64(): Float64
}

extend Float64 <: Floatable<Float64> {
    public func toFloat64() {
        this
    }
}

extend Float32 <: Floatable<Float32> {
    public func toFloat64() {
        Float64(this)
    }
}

extend Float16 <: Floatable<Float16> {
    public func toFloat64() {
        Float64(this)
    }
}

interface SignedInteger<T> where T <: ArbitraryRange<T> & ToString {
    func toInt64(): Int64
}

interface UnsignedInteger<T> where T <: ArbitraryRange<T> & ToString {
    func toUInt64(): UInt64
}

extend Int8 <: SignedInteger<Int8> {
    public func toInt64() {
        Int64(this)
    }
}

extend Int16 <: SignedInteger<Int16> {
    public func toInt64() {
        Int64(this)
    }
}

extend Int32 <: SignedInteger<Int32> {
    public func toInt64() {
        Int64(this)
    }
}

extend Int64 <: SignedInteger<Int64> {
    public func toInt64() {
        Int64(this)
    }
}

extend IntNative <: SignedInteger<IntNative> {
    public func toInt64() {
        Int64(this)
    }
}

extend UInt8 <: UnsignedInteger<UInt8> {
    public func toUInt64() {
        UInt64(this)
    }
}

extend UInt16 <: UnsignedInteger<UInt16> {
    public func toUInt64() {
        UInt64(this)
    }
}

extend UInt32 <: UnsignedInteger<UInt32> {
    public func toUInt64() {
        UInt64(this)
    }
}

extend UInt64 <: UnsignedInteger<UInt64> {
    public func toUInt64() {
        UInt64(this)
    }
}

extend UIntNative <: UnsignedInteger<UIntNative> {
    public func toUInt64() {
        UInt64(this)
    }
}

@Test
class TestInteger {
    @Types[T in<Int8, Int16, Int32, Int64, IntNative>]
    @TestCase[x in randomInRange(min: - 57, max: 90)]
    func signed_in_range1<T>(x: T) where T <: SignedInteger<T> {
        @Assert(-57 <= x.toInt64() && x.toInt64() <= 90)
    }

    @Types[T in<Int16, Int32, Int64, IntNative>]
    @TestCase[x in randomInRange(min: - 18930, max: 20848)]
    func signed_in_range2<T>(x: T) where T <: SignedInteger<T> {
        @Assert(-18930 <= x.toInt64() && x.toInt64() <= 20848)
    }

    @Types[T in<Int32, Int64, IntNative>]
    @TestCase[x in randomInRange(min: - 453809988, max: 1908388298)]
    func signed_in_range3<T>(x: T) where T <: SignedInteger<T> {
        @Assert(-453809988 <= x.toInt64() && x.toInt64() <= 1908388298)
    }

    @Types[T in<Int64, IntNative>]
    @TestCase[x in randomInRange(min: - 4523455523343809988, max: 190823423553884298)]
    func signed_in_range4<T>(x: T) where T <: SignedInteger<T> {
        @Assert(-4523455523343809988 <= x.toInt64() && x.toInt64() <= 190823423553884298)
    }

    @Types[T in<UInt8, UInt16, UInt32, UInt64, UIntNative>]
    @TestCase[x in randomInRange(min: 39, max: 200)]
    func unsigned_in_range1<T>(x: T) where T <: UnsignedInteger<T> {
        @Assert(39 <= x.toUInt64() && x.toUInt64() <= 200)
    }

    @Types[T in<UInt16, UInt32, UInt64, UIntNative>]
    @TestCase[x in randomInRange(min: 3539, max: 64239)]
    func unsigned_in_range2<T>(x: T) where T <: UnsignedInteger<T> {
        @Assert(3539 <= x.toUInt64() && x.toUInt64() <= 64239)
    }

    @Types[T in<UInt32, UInt64, UIntNative>]
    @TestCase[x in randomInRange(min: 353, max: 643242239)]
    func unsigned_in_range3<T>(x: T) where T <: UnsignedInteger<T> {
        @Assert(353 <= x.toUInt64() && x.toUInt64() <= 643242239)
    }

    @Types[T in<UInt64, UIntNative>]
    @TestCase[x in randomInRange(min: 35323, max: 64324234252354239)]
    func unsigned_in_range4<T>(x: T) where T <: UnsignedInteger<T> {
        @Assert(35323 <= x.toUInt64() && x.toUInt64() <= 64324234252354239)
    }
}
