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
class Test_arraydeque_init_prop_02 {
    @TestCase
    func test_init_blank_01(): Unit {
        let arrdeque = ArrayDeque<String>()
        for (i in 0..50) {
            arrdeque.addFirst("${i}")
        }
        @Expect(arrdeque.size, 50)
        @Expect(arrdeque.first, "49")
        @Expect(arrdeque.last, "0")
        for (j in -50..0) {
            arrdeque.addLast("${j}")
        }
        @Expect(arrdeque.first, "49")
        @Expect(arrdeque.last, "-1")
        @Expect(arrdeque.removeFirst(), Some("49"))
        @Expect(arrdeque.removeLast(), Some("-1"))

        @Expect(arrdeque.capacity, 135)
        @Expect(arrdeque.size, 98)
        @Expect(arrdeque.isEmpty(), false)

        arrdeque.reserve(36)
        @Expect(arrdeque.capacity, 135)

        arrdeque.clear()
        @Expect(arrdeque.capacity, 135)
        @Expect(arrdeque.size, 0)
    }

    @TestCase
    func test_init_blank_02(): Unit {
        let arrdeque = ArrayDeque<String>()
        for (i in 0..50) {
            arrdeque.addFirst("${i}")
        }
        @Expect(arrdeque.capacity, 60)
        @Expect(arrdeque.size, 50)
        arrdeque.reserve(0)
        @Expect(arrdeque.capacity, 60)

        arrdeque.reserve(-100)
        @Expect(arrdeque.capacity, 60)

        arrdeque.reserve(11)
        @Expect(arrdeque.capacity, 90)

        arrdeque.reserve(39)
        @Expect(arrdeque.capacity, 90)

        arrdeque.reserve(40)
        @Expect(arrdeque.capacity, 90)
    }

    @TestCase
    func test_init_blank_03(): Unit {
        let arrdeque = ArrayDeque<String>()
        for (i in 0..50) {
            arrdeque.addFirst("${i}")
        }
        var iter = arrdeque.iterator()
        @Expect(iter.next(), Option<String>.Some("49"))
        @Expect(iter.count(), 49)
    }
}
