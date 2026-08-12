/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt -Woff unused
// EXEC: %run %run_opt %output %run_utest_opt

import std.collection.*

/*
 * Branch-focused coverage for std.collection array_deque.cj wrap-around and resize paths.
 */
@Test
class ArrayDequeCoverageTest {
    @TestCase
    func testWrapAroundBothEnds(): Unit {
        var dq = ArrayDeque<Int64>(4)
        for (i in 0..20) {
            dq.addLast(i)
        }
        @Expect(dq.size, 20)
        @Expect(dq.first, Some(0))
        @Expect(dq.last, Some(19))
        for (i in 0..10) {
            @Expect(dq.removeFirst(), Some(i))
        }
        for (i in 100..110) {
            dq.addFirst(i)
        }
        @Expect(dq.size, 20)
        @Expect(dq.toArray().size, 20)
    }

    @TestCase
    func testReserveClearAndIterator(): Unit {
        var dq = ArrayDeque<Int64>()
        for (i in 0..128) {
            if (i % 2 == 0) {
                dq.addLast(i)
            } else {
                dq.addFirst(i)
            }
        }
        dq.reserve(256)
        var count: Int64 = 0
        var it = dq.iterator()
        while (let Some(_) <- it.next()) {
            count++
        }
        @Expect(count, dq.size)
        dq.clear()
        @Expect(dq.isEmpty(), true)
        @Expect(dq.toString().size >= 2, true)
    }

    @TestCase
    func testRemoveLastAndEmptyRemovals(): Unit {
        var dq = ArrayDeque<Int64>()
        @Expect(dq.removeFirst(), None)
        @Expect(dq.removeLast(), None)
        dq.addLast(1)
        dq.addLast(2)
        @Expect(dq.removeLast(), Some(2))
        @Expect(dq.removeFirst(), Some(1))
        @Expect(dq.isEmpty(), true)
    }
}
