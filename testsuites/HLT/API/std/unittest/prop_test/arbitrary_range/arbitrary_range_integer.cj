/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args --no-color --random-seed=90

import std.unittest.prop_test.*
import std.random.*

interface SignedInteger<T> where T <: ArbitraryRange<T> & ToString {
    func toInt64(): Int64
}

extend Int8 <: SignedInteger<Int8> {
    public func toInt64():Int64 {
        Int64(this)
    }
}

extend Int16 <: SignedInteger<Int16> {
    public func toInt64():Int64 {
        Int64(this)
    }
}

extend Int32 <: SignedInteger<Int32> {
    public func toInt64():Int64 {
        Int64(this)
    }
}

extend Int64 <: SignedInteger<Int64> {
    public func toInt64() :Int64{
        Int64(this)
    }
}

extend IntNative <: SignedInteger<IntNative> {
    public func toInt64():Int64 {
        Int64(this)
    }
}

let SIZE = 100

@Test
class TestInteger {
    @Types[T in<Int8, Int16, Int32, Int64, IntNative>]
    @TestCase[x in random(), y in random()]
    func it_throws_exception<T>(x: T, y: T) where T <: ArbitraryRange<T> {
        if (x != y) {
            @AssertThrows[IllegalArgumentException](T.arbitraryRange(Random(42), max(x, y), min(x, y)))
            @AssertThrows[IllegalArgumentException](randomInRange(min: max(x, y), max: min(x, y)))
        }
    }
    @Types[T in<Int8, Int16, Int32, Int64, IntNative>]
    @TestCase[x in random(), y in random()]
    func in_range<T>(x: T, y: T) where T <: ArbitraryRange<T> & ToString {
        let l = min(x, y)
        let r = max(x, y)
        let generator = T.arbitraryRange(Random(42), l, r)

        for (i in 0..SIZE) {
            var cur = generator.next()
            if (cur < l || r < cur) {
                @Fail("generated number ${cur} is out of range [${l}, ${r}]")
            }
        }
    }
}
