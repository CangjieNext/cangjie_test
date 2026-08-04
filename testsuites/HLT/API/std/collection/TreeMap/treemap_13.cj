/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.collection.*

@Test
class Test_treemap_13 {
    @TestCase
    func test_empty_forward(): Unit {
        // Empty TreeMap: forward should return an empty iterator
        // instead of throwing NoneValueException.
        let cmap = TreeMap<Int64, Int64>()
        @Expect(cmap.isEmpty(), true)
        var iter = cmap.forward(1)
        @Expect((iter).next().isNone(), true)
        @Expect((iter).next().isNone(), true)
    }

    @TestCase
    func test_empty_backward(): Unit {
        // Empty TreeMap: backward should return an empty iterator
        // instead of throwing NoneValueException.
        let cmap = TreeMap<Int64, Int64>()
        @Expect(cmap.isEmpty(), true)
        var iter = cmap.backward(1)
        @Expect((iter).next().isNone(), true)
        @Expect((iter).next().isNone(), true)
    }

    @TestCase
    func test_empty_for_loop(): Unit {
        // Empty TreeMap: iterating over forward/backward results should yield nothing.
        let cmap = TreeMap<Int64, Int64>()
        var count: Int64 = 0
        for ((_, _) in cmap.forward(0)) {
            count++
        }
        for ((_, _) in cmap.backward(0)) {
            count++
        }
        @Expect(count, 0)
    }

    @TestCase
    func test_empty_mark_boundary(): Unit {
        // Empty TreeMap: forward/backward should not throw for any mark value.
        let cmap = TreeMap<Int64, Int64>()
        @Expect((cmap.forward(0)).next().isNone(), true)
        @Expect((cmap.forward(-1, inclusive: false)).next().isNone(), true)
        @Expect((cmap.backward(0)).next().isNone(), true)
        @Expect((cmap.backward(1, inclusive: false)).next().isNone(), true)
    }
}
