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
import std.deriving.*

@Test
func create_shrinkable() {
    let rdsr: RandomDataStrategyRange<Int64> = randomInRange<Int64>(min: 0, max: 1)
    let rds: RandomDataShrinkerRange<Int64> = rdsr.shrinker(defaultConfiguration())
    let shrinked = rds.shrink(1).iterator().next()
    @Expect(shrinked == 0)
}

@Derive[Comparable, Arbitrary, ToString]
struct MyInt <: ArbitraryRange<MyInt> {
    MyInt(let v: Int64) {}

    public static func min() { MyInt(Int64.Min) }
    public static func max() { MyInt(Int64.Max) }
    public static func arbitraryRange(random: RandomSource, min: MyInt, max: MyInt): Generator<MyInt> {
        Generators.single(MyInt(42))
    }
}

@Test
func create_non_shrinkable() {
    let rdsr: RandomDataStrategyRange<MyInt> = randomInRange<MyInt>(min: MyInt(0), max: MyInt(1))
    let rds: RandomDataShrinkerRange<MyInt> = rdsr.shrinker(defaultConfiguration())
    let shrinked = rds.shrink(MyInt(1)).iterator().next()
    @PowerAssert(shrinked == None)
}

@Test
func RandomDataProviderRange_use_random_from_configuration() {
    let emptyConfiguration = Configuration()
    @AssertThrows[IllegalArgumentException](RandomDataProviderRange<Int64>(emptyConfiguration, 0, 1))
}