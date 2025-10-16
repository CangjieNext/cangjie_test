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

@Test
func shrink_helpers_tuple2() {
    let initial = (1, 2)
    let iter = ShrinkHelpers.shrinkTuple(initial, [-1], []).iterator()
    let shrinked = iter.next().getOrThrow()
    @PowerAssert(shrinked[0] == -1) 
    @PowerAssert(shrinked[1] == 2) 
}

@Test
func shrink_helpers_tuple3() {
    let initial = (1, 2, 3)
    let iter = ShrinkHelpers.shrinkTuple(initial, [-1], [], []).iterator()
    let shrinked = iter.next().getOrThrow()
    @PowerAssert(shrinked[0] == -1) 
    @PowerAssert(shrinked[1] == 2) 
    @PowerAssert(shrinked[2] == 3) 
}

@Test
func shrink_helpers_tuple4() {
    let initial = (1, 2, 3, 4)
    let iter = ShrinkHelpers.shrinkTuple(initial, [-1], [], [], []).iterator()
    let shrinked = iter.next().getOrThrow()
    @PowerAssert(shrinked[0] == -1) 
    @PowerAssert(shrinked[1] == 2) 
    @PowerAssert(shrinked[2] == 3) 
    @PowerAssert(shrinked[3] == 4) 
}


@Test
func shrink_helpers_tuple5() {
    let initial = (1, 2, 3, 4, 5)
    let iter = ShrinkHelpers.shrinkTuple(initial, [-1], [], [], [], []).iterator()
    let shrinked = iter.next().getOrThrow()
    @PowerAssert(shrinked[0] == -1) 
    @PowerAssert(shrinked[1] == 2) 
    @PowerAssert(shrinked[2] == 3) 
    @PowerAssert(shrinked[3] == 4) 
    @PowerAssert(shrinked[4] == 5) 
}
