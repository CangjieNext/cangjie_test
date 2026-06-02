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

interface UnsignedInteger<T> where T <: ArbitraryRange<T> & ToString {
    func toUInt64(): UInt64
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
    let rand = Random(42)
    let TRIALS = 100000

    @Types[T in<UInt8, UInt16, UInt32, UInt64, UIntNative>]
    @TestCase[x in random(), y in random(), expected in [ 6, 19, 0, 1 ]]
    func it_generates_unsigned_imaginable_values<T>(x: T, y: T, expected: UInt64) where T <: UnsignedInteger<T> {
        let l = min(x, y)
        let r = max(x, y)
        if (expected < l.toUInt64() || r.toUInt64() < expected) {
            return
        }
        let generator = T.arbitraryRange(rand, l, r)
        for (i in 0..TRIALS) {
            if (generator.next().toUInt64() == expected) {
                return
            }
        }
        @Fail("expected unsinged number '${expected}' was not generated in [${l.toUInt64()}, ${r.toUInt64()}]")
    }
}
