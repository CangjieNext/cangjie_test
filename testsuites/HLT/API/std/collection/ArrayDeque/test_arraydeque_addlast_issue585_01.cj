/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.collection.*

let OPS: Int64 = 512
let WRAP_OPS: Int64 = 256

@Test
class Test_arraydeque_addlast_issue585_01 {
    @TestCase
    func test_addlast_no_grow_keeps_order(): Unit {
        let arrdeque = ArrayDeque<Int64>(OPS + 1)
        for (i in 0..OPS) {
            arrdeque.addLast(i)
        }

        @Expect(arrdeque.size, OPS)
        @Expect(arrdeque.first, 0)
        @Expect(arrdeque.last, OPS - 1)
        for (i in 0..OPS) {
            @Expect(arrdeque.removeFirst(), Some(i))
        }
        @Expect(arrdeque.isEmpty(), true)
    }

    @TestCase
    func test_addlast_grow_keeps_order(): Unit {
        let arrdeque = ArrayDeque<Int64>()
        for (i in 0..OPS) {
            arrdeque.addLast(i)
        }

        @Expect(arrdeque.size, OPS)
        @Expect(arrdeque.first, 0)
        @Expect(arrdeque.last, OPS - 1)
        for (i in 0..OPS) {
            @Expect(arrdeque.removeFirst(), Some(i))
        }
        @Expect(arrdeque.isEmpty(), true)
    }

    @TestCase
    func test_addlast_wrap_around_grow_keeps_order(): Unit {
        let arrdeque = ArrayDeque<Int64>(8)
        for (i in 0..6) {
            arrdeque.addLast(i)
        }
        for (i in 0..4) {
            @Expect(arrdeque.removeFirst(), Some(i))
        }

        for (i in 6..WRAP_OPS) {
            arrdeque.addLast(i)
        }

        @Expect(arrdeque.size, WRAP_OPS - 4)
        @Expect(arrdeque.first, 4)
        @Expect(arrdeque.last, WRAP_OPS - 1)
        for (i in 4..WRAP_OPS) {
            @Expect(arrdeque.removeFirst(), Some(i))
        }
        @Expect(arrdeque.isEmpty(), true)
    }

    @TestCase
    func test_addlast_in_hashset_filter_workload(): Unit {
        let seen = HashSet<Int64>(OPS)
        let arrdeque = ArrayDeque<Int64>(OPS + 1)
        for (i in 0..OPS) {
            if (!seen.contains(i)) {
                seen.add(i)
                arrdeque.addLast(i)
            }
        }

        @Expect(seen.size, OPS)
        @Expect(arrdeque.size, OPS)
        for (i in 0..OPS) {
            @Expect(arrdeque.removeFirst(), Some(i))
        }
        @Expect(arrdeque.isEmpty(), true)
    }
}
