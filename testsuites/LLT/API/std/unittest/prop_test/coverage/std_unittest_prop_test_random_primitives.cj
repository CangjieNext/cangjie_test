/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC: %run %run_opt %output %run_utest_opt %run_args --no-color

import std.random.*
import std.math.*
import std.unittest.prop_test.*

@Types[T in <Float16, Float32, Float64>]
@Test[x in random()]
func border_value_float<T>(x: T) where T <: ArbitraryRange<T> & FloatingPoint<T> {
    let INF = T.getInf()
    let NAN = T.getNaN()
    let E = T.getE()
    let PI = T.getPI()

    @AssertThrows[IllegalArgumentException](T.arbitraryRange(Random(), NAN, x).next())
    @AssertThrows[IllegalArgumentException](T.arbitraryRange(Random(), x, NAN).next())

    @Assert(
        T.arbitraryRange(Random(), INF, INF)
            .next()
            .isInf())
    @Assert(
        (-T.arbitraryRange(Random(), -INF, -INF).next())
        .isInf())
    @Assert(T.arbitraryRange(Random(), -INF, E).next() < PI)
}
