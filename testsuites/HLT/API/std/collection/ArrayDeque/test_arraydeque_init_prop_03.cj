/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.collection.*
import std.math.*

@Test
class Test_arraydeque_init_prop_03 {
    @TestCase
    func test_init_notblank_01(): Unit {
        let e = @AssertThrows[IllegalArgumentException](ArrayDeque<Int64>(-1))
        @Expect(e.message.contains("The capacity must be greater than or equal to 0"))
    }

    @TestCase
    func test_init_notblank_02(): Unit {
        let arrdeque = ArrayDeque<Int64>(0)
        @Expect(arrdeque.first, Option<Int64>.None)
        @Expect(arrdeque.last, Option<Int64>.None)
        @Expect(arrdeque.capacity, 8)
        @Expect(arrdeque.size, 0)
        @Expect(arrdeque.isEmpty(), true)
        @Expect(arrdeque.toArray(), Array<Int64>())
        @Expect(arrdeque.removeFirst(), Option<Int64>.None)
        @Expect(arrdeque.removeLast(), Option<Int64>.None)
        @Expect(arrdeque.toString(), "[]")
    }

    @TestCase
    func test_init_notblank_03(): Unit {
        let arrdeque = ArrayDeque<Int64>(9)
        @Expect(arrdeque.first, Option<Int64>.None)
        @Expect(arrdeque.last, Option<Int64>.None)
        @Expect(arrdeque.capacity, 9)
        @Expect(arrdeque.size, 0)
        @Expect(arrdeque.isEmpty(), true)
        @Expect(arrdeque.toArray(), Array<Int64>())
        @Expect(arrdeque.removeFirst(), Option<Int64>.None)
        @Expect(arrdeque.removeLast(), Option<Int64>.None)
        @Expect(arrdeque.toString(), "[]")
    }

    @TestCase
    func test_init_notblank_04(): Unit {
        let arrdeque = ArrayDeque<String>(100)
        @Expect(arrdeque.first, Option<String>.None)
        @Expect(arrdeque.last, Option<String>.None)
        @Expect(arrdeque.capacity, 100)
        @Expect(arrdeque.size, 0)
        @Expect(arrdeque.isEmpty(), true)
        @Expect(arrdeque.toArray(), Array<String>())
        @Expect(arrdeque.removeFirst(), Option<String>.None)
        @Expect(arrdeque.removeLast(), Option<String>.None)
        @Expect(arrdeque.toString(), "[]")
    }

    @TestCase
    func test_init_notblank_05(): Unit {
        let arrdeque = ArrayDeque<Int64>(20)
        arrdeque.addFirst(-100)
        arrdeque.addFirst(0)
        arrdeque.addFirst(Int64.Max)
        @Expect(arrdeque.size, 3)
        @Expect(arrdeque.first, Int64.Max)
        @Expect(arrdeque.last, -100)
        arrdeque.addLast(Int64.Min)
        arrdeque.addLast(-1)
        arrdeque.addLast(101)
        @Expect(arrdeque.first, Int64.Max)
        @Expect(arrdeque.last, 101)
        @Expect(arrdeque.removeFirst(), Some(Int64.Max))
        @Expect(arrdeque.removeLast(), Some(101))

        @Expect(arrdeque.capacity, 20)
        @Expect(arrdeque.size, 4)
        @Expect(arrdeque.isEmpty(), false)
        @Expect(arrdeque.toArray(), [0, -100, Int64.Min, -1])
        @Expect(arrdeque.toString(), "[0, -100, -9223372036854775808, -1]")

        arrdeque.reserve(9)
        @Expect(arrdeque.capacity, 20)

        arrdeque.clear()
        @Expect(arrdeque.capacity, 20)
        @Expect(arrdeque.size, 0)
    }

    @TestCase
    func test_init_notblank_06(): Unit {
        let arrdeque = ArrayDeque<String>(8)
        for (i in 0..10) {
            arrdeque.addFirst("${i}")
        }
        @Expect(arrdeque.size, 10)
        @Expect(arrdeque.first, "9")
        @Expect(arrdeque.last, "0")
        @Expect(arrdeque.removeFirst(), Some("9"))
        @Expect(arrdeque.removeFirst(), Some("8"))
        @Expect(arrdeque.removeLast(), Some("0"))
        @Expect(arrdeque.removeLast(), Some("1"))
        @Expect(arrdeque.capacity, 12)
        @Expect(arrdeque.size, 6)
        @Expect(arrdeque.isEmpty(), false)
        arrdeque.addFirst("abc")
        arrdeque.addLast("仓颉鸿蒙")
        @Expect(arrdeque.first, "abc")
        @Expect(arrdeque.last, "仓颉鸿蒙")
        @Expect(arrdeque.toArray(), ["abc", "7", "6", "5", "4", "3", "2", "仓颉鸿蒙"])
        @Expect(arrdeque.toString(), "[abc, 7, 6, 5, 4, 3, 2, 仓颉鸿蒙]")
        arrdeque.addFirst("")
        arrdeque.addLast("*&^%$")
        @Expect(arrdeque.toArray(), ["","abc", "7", "6", "5", "4", "3", "2", "仓颉鸿蒙","*&^%$"])
        @Expect(arrdeque.toString(), "[, abc, 7, 6, 5, 4, 3, 2, 仓颉鸿蒙, *&^%$]")
    }
}
