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

@Test
class TestFloat {
    let SIZE = 100

    @Types[T in<Float16, Float32, Float64>]
    @TestCase[x in random(), y in random()]
    func in_range<T>(x: T, y: T) where T <: Floatable<T> {
        if (x.isNaN() || y.isNaN()) {
            return
        }
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

    @Types[T in<Float16, Float32, Float64>]
    @TestCase[x in random(), y in random()]
    func it_throws_exception<T>(x: T, y: T) where T <: Floatable<T> & ArbitraryRange<T> {
        if (x.isNaN() || y.isNaN()) {
            @AssertThrows[IllegalArgumentException](T.arbitraryRange(Random(42), x, y))
        } else if (x != y) {
            @AssertThrows[IllegalArgumentException](randomInRange(min: max(x, y), max: min(x, y)))
            @AssertThrows[IllegalArgumentException](T.arbitraryRange(Random(42), max(x, y), min(x, y)))
        }
    }

    @Types[T in<Float16, Float32, Float64>]
    @TestCase[x in randomInRange(min: - 443.0, max: 922.0)]
    func in_range1<T>(x: T) where T <: Floatable<T> {
        @Assert(-443.0 <= x.toFloat64() && x.toFloat64() <= 922.0)
    }

    @Types[T in<Float32, Float64>]
    @TestCase[x in randomInRange(min: - 8954773.0, max: 5442345.0)]
    func in_range2<T>(x: T) where T <: Floatable<T> {
        @Assert(-8954773.0 <= x.toFloat64() && x.toFloat64() <= 5442345.0)
    }

    @Types[T in<Float64>]
    @TestCase[x in randomInRange(min: - 38432452355435438.0, max: 223423423423348.0)]
    func in_range3<T>(x: T) where T <: Floatable<T> {
        @Assert(-38432452355435438.0 <= x.toFloat64() && x.toFloat64() <= 223423423423348.0)
    }
}
