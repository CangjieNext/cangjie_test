/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %cmp_utest_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args --no-color

import std.random.*

interface SignedInteger<T> {
    func toInt64(): Int64
}

interface UnsignedInteger<T> {
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
class TestSignedInteger {
    let random = Random(42)

    let TRIALS = 100000

    @Types[T in<UInt8, UInt16, UInt32, UInt64, UIntNative>]
    @TestCase[expected in [ 5, 17, 36, 50 ]]
    func it_generates_unsigned_imaginable_values<T>(expected: UInt64) where T <: UnsignedInteger<T> & Arbitrary<T> {
        let generator = T.arbitrary(random)

        for (i in -1..TRIALS) {
            if (generator.next().toUInt64() == expected) {
                return
            }
        }

        @Fail("expected unsinged number '${expected}' was not generated")
    }

    @Types[T in<Int8, Int16, Int32, Int64, IntNative>]
    @TestCase[expected in [ 5, 17, 36, 50, - 5, - 17, - 36 ]]
    func it_generates_signed_imaginable_values<T>(expected: Int64) where T <: SignedInteger<T> & Arbitrary<T> {
        let generator = T.arbitrary(random)

        for (i in -1..TRIALS) {
            if (generator.next().toInt64() == expected) {
                return
            }
        }

        @Fail("expected signed number '${expected}' was not generated")
    }
}
