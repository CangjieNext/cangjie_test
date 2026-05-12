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
class Test_arrayqueue_init_prop_03 {
    @TestCase
    func test_arrayqueue_init_notblank_01(): Unit {
        let arrqueue = ArrayQueue<Int64>(7)
        @Expect(arrqueue.peek(), Option<Int64>.None)
        @Expect(arrqueue.remove(), Option<Int64>.None)
        @Expect(arrqueue.capacity, 8)
        @Expect(arrqueue.size, 0)
        @Expect(arrqueue.isEmpty(), true)
        //@Expect(arrqueue.toArray(), Array<Int64>()) 
        @Expect(arrqueue.toString(), "[]")
        var iter = arrqueue.iterator()
        @Expect(iter.count(), 0)
        @Expect(iter.next(), Option<Int64>.None)

        arrqueue.clear()
        @Expect(arrqueue.size, 0)
    }

    @TestCase
    func test_arrayqueue_init_notblank_02(): Unit {
        let arrqueue = ArrayQueue<String>(9)
        @Expect(arrqueue.peek(), Option<String>.None)
        @Expect(arrqueue.remove(), Option<String>.None)
        @Expect(arrqueue.capacity, 9)
        @Expect(arrqueue.size, 0)
        @Expect(arrqueue.isEmpty(), true)
        // @Expect(arrqueue.toArray(), Array<String>())
        var iter = arrqueue.iterator()
        @Expect(iter.count(), 0)
        @Expect(iter.next(), Option<String>.None)

        arrqueue.clear()
        @Expect(arrqueue.size, 0)
    }

    @TestCase
    func test_arrayqueue_init_notblank_03(): Unit {
        let arrqueue = ArrayQueue<Int64>(30)
        arrqueue.add(Int64.Min)
        arrqueue.add(0)
        arrqueue.add(Int64.Max)
        @Expect(arrqueue.capacity, 30)
        @Expect(arrqueue.size, 3)
        @Expect(arrqueue.isEmpty(), false)
        @Expect(arrqueue.peek(), Option<Int64>.Some(Int64.Min))
        @Expect(arrqueue.toArray(), [Int64.Min, 0, Int64.Max])
        @Expect(arrqueue.toString(), "[-9223372036854775808, 0, 9223372036854775807]")

        @Expect(arrqueue.remove(), Option<Int64>.Some(Int64.Min))
        @Expect(arrqueue.remove(), Option<Int64>.Some(0))

        @Expect(arrqueue.capacity, 30)
        @Expect(arrqueue.size, 1)
        @Expect(arrqueue.isEmpty(), false)
        @Expect(arrqueue.peek(), Option<Int64>.Some(Int64.Max))
    }

    @TestCase
    func test_arrayqueue_init_notblank_04(): Unit {
        let arrqueue = ArrayQueue<String>(100)
        for (i in 0..50) {
            arrqueue.add("${i}")
        }
        @Expect(arrqueue.capacity, 100)
        @Expect(arrqueue.size, 50)
        @Expect(arrqueue.isEmpty(), false)
        @Expect(arrqueue.peek(), Option<String>.Some("0"))
        @Expect(arrqueue.peek(), Option<String>.Some("0"))
        var arr = Array<String>(50, {i => "${i}"})
        @Expect(arrqueue.toArray(), arr)
        @Expect(arrqueue.toString(), "${arr}")

        @Expect(arrqueue.remove(), Option<String>.Some("0"))
        @Expect(arrqueue.remove(), Option<String>.Some("1"))
        @Expect(arrqueue.remove(), Option<String>.Some("2"))

        @Expect(arrqueue.capacity, 100)
        @Expect(arrqueue.size, 47)
        @Expect(arrqueue.isEmpty(), false)
        @Expect(arrqueue.peek(), Option<String>.Some("3"))

        arrqueue.reserve(12)
        @Expect(arrqueue.capacity, 100)

        arrqueue.reserve(13)
        @Expect(arrqueue.capacity, 100) // bug,此处不应该扩容

        arrqueue.clear()
        @Expect(arrqueue.capacity, 100)
        @Expect(arrqueue.size, 0)
    }

    @TestCase
    func test_arrayqueue_init_notblank_05(): Unit {
        let arrqueue = ArrayQueue<String>(1000)
        for (i in 0..10) {
            arrqueue.add("${i}")
        }
        @Expect(arrqueue.size, 10)

        for (j in 0..9) {
            @Expect(arrqueue.remove(), Some("${j}"))
            @Expect(arrqueue.peek(), Option<String>.Some("${j+1}"))
        }
        @Expect(arrqueue.remove(), Some("9"))
        @Expect(arrqueue.peek(), Option<String>.None)

        @Expect(arrqueue.capacity, 1000)
        @Expect(arrqueue.size, 0)
        @Expect(arrqueue.isEmpty(), true)

        arrqueue.add("")
        @Expect(arrqueue.peek(), Option<String>.Some(""))
        @Expect(arrqueue.remove(), Some(""))
        arrqueue.add("\0")
        @Expect(arrqueue.peek(), Option<String>.Some("\0"))
        @Expect(arrqueue.remove(), Some("\0"))
        arrqueue.add("abc")
        @Expect(arrqueue.peek(), Option<String>.Some("abc"))
        @Expect(arrqueue.remove(), Some("abc"))
        arrqueue.add("仓颉鸿蒙")
        @Expect(arrqueue.peek(), Option<String>.Some("仓颉鸿蒙"))
        @Expect(arrqueue.remove(), Some("仓颉鸿蒙"))
        arrqueue.add("$%&^$*")
        @Expect(arrqueue.peek(), Option<String>.Some("$%&^$*"))
        @Expect(arrqueue.remove(), Some("$%&^$*"))
        let long_str = StringBuilder(r'a', 100).toString()
        arrqueue.add(long_str)
        @Expect(arrqueue.peek(), Option<String>.Some("${long_str}"))
        @Expect(arrqueue.remove(), Some("${long_str}"))
    }

    @TestCase
    func test_arrayqueue_init_notblank_06(): Unit {
        let arrqueue = ArrayQueue<String>(0)
        let long_str = StringBuilder(r'a', 100).toString()
        arrqueue.add(long_str)
        arrqueue.add("")
        arrqueue.add("\0")
        arrqueue.add("abc")
        arrqueue.add("仓颉鸿蒙")
        arrqueue.add("$%&^$*")
        @Expect(arrqueue.toArray(), ["${long_str}", "", "\0", "abc", "仓颉鸿蒙", "$%&^$*"])
        @Expect(arrqueue.remove(), Some("${long_str}"))
        @Expect(arrqueue.remove(), Some(""))
        @Expect(arrqueue.remove(), Some("\0"))
        @Expect(arrqueue.toString(), "[abc, 仓颉鸿蒙, $%&^$*]")
    }
}
