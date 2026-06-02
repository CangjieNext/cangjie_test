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

interface SignedInteger<T> where T <: ArbitraryRange<T> & ToString {
    func toInt64(): Int64
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

@Test
class TestInteger {
    let rand = Random(42)
    let TRIALS = 100000

    @Types[T in<Int8, Int16, Int32, Int64, IntNative>]
    @TestCase[x in random(), y in random(), expected in [ 5, - 7, 10, - 5 ]]
    func it_generates_signed_imaginable_values<T>(x: T, y: T, expected: Int64) where T <: SignedInteger<T> {
        let l = min(x, y)
        let r = max(x, y)
        if (expected < l.toInt64() || r.toInt64() < expected) {
            return
        }
        let generator = T.arbitraryRange(rand, l, r)

        for (i in 0..TRIALS) {
            if (generator.next().toInt64() == expected) {
                return
            }
        }

        @Fail("expected unsinged number '${expected}' was not generated in [${l.toInt64()}, ${r.toInt64()}]")
    }
}
