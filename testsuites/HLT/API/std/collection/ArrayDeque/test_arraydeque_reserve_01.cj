/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.collection.*
import std.math.*

@Test
class Test_arraydeque_reserve_01 {
    @TestCase
    func test_reserve_after_removefirst_01(): Unit {
        let arrdeque = ArrayDeque<Int64>()
        for (i in 0..5) {
            arrdeque.addLast(i)
        }
        @Expect(arrdeque.removeFirst(), Some(0))
        arrdeque.reserve(5)
        @Expect(arrdeque.capacity, 12)
        @Expect(arrdeque.size, 4)
        @Expect(arrdeque.first, Some(1))
        @Expect(arrdeque.last, Some(4))
        @Expect(arrdeque.toArray(), [1, 2, 3, 4])
        @Expect(arrdeque.toString(), "[1, 2, 3, 4]")
    }

    @TestCase
    func test_reserve_after_remove_mix_02(): Unit {
        let arrdeque = ArrayDeque<Int64>()
        for (i in 0..6) {
            arrdeque.addLast(i)
        }
        @Expect(arrdeque.removeFirst(), Some(0))
        @Expect(arrdeque.removeLast(), Some(5))
        arrdeque.reserve(6)
        @Expect(arrdeque.capacity, 12)
        @Expect(arrdeque.size, 4)
        @Expect(arrdeque.first, Some(1))
        @Expect(arrdeque.last, Some(4))
        @Expect(arrdeque.toArray(), [1, 2, 3, 4])
    }

    @TestCase
    func test_reserve_wrapped_03(): Unit {
        let arrdeque = ArrayDeque<Int64>()
        for (i in 0..6) {
            arrdeque.addLast(i)
        }
        @Expect(arrdeque.removeFirst(), Some(0))
        @Expect(arrdeque.removeFirst(), Some(1))
        @Expect(arrdeque.removeFirst(), Some(2))
        arrdeque.addLast(6)
        arrdeque.addLast(7)
        arrdeque.addLast(8)
        @Expect(arrdeque.size, 6)
        arrdeque.reserve(3)
        @Expect(arrdeque.capacity, 12)
        @Expect(arrdeque.size, 6)
        @Expect(arrdeque.first, Some(3))
        @Expect(arrdeque.last, Some(8))
        @Expect(arrdeque.toArray(), [3, 4, 5, 6, 7, 8])
    }
}
