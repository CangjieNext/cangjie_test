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
class Test_treeset_forward_backward_empty {
    @TestCase
    func test_empty_forward(): Unit {
        // Empty TreeSet: forward should return an empty iterator
        // instead of throwing NoneValueException.
        let cset = TreeSet<Int64>()
        @Expect(cset.isEmpty(), true)
        var iter = cset.forward(1)
        @Expect((iter).next().isNone(), true)
        @Expect((iter).next().isNone(), true)
    }

    @TestCase
    func test_empty_backward(): Unit {
        // Empty TreeSet: backward should return an empty iterator
        // instead of throwing NoneValueException.
        let cset = TreeSet<Int64>()
        @Expect(cset.isEmpty(), true)
        var iter = cset.backward(1)
        @Expect((iter).next().isNone(), true)
        @Expect((iter).next().isNone(), true)
    }

    @TestCase
    func test_empty_for_loop(): Unit {
        // Empty TreeSet: iterating over forward/backward results should yield nothing.
        let cset = TreeSet<Int64>()
        var count: Int64 = 0
        for (v in cset.forward(0)) {
            count++
        }
        for (v in cset.backward(0)) {
            count++
        }
        @Expect(count, 0)
    }
}
