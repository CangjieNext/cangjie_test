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
class Test_arraystack_init_prop_03 {
    @TestCase
    func test_arraystack_init_notblank_01(): Unit {
        let arrstack = ArrayStack<Int64>(7)
        @Expect(arrstack.peek(), Option<Int64>.None)
        @Expect(arrstack.remove(), Option<Int64>.None)
        @Expect(arrstack.capacity, 8)
        @Expect(arrstack.size, 0)
        @Expect(arrstack.isEmpty(), true)
        @Expect(arrstack.toArray(), Array<Int64>())
        @Expect(arrstack.toString(), "[]")
        var iter = arrstack.iterator()
        @Expect(iter.count(), 0)
        @Expect(iter.next(), Option<Int64>.None)

        arrstack.clear()
        @Expect(arrstack.size, 0)
    }

    @TestCase
    func test_arraystack_init_notblank_02(): Unit {
        let arrstack = ArrayStack<String>(9)
        @Expect(arrstack.peek(), Option<String>.None)
        @Expect(arrstack.remove(), Option<String>.None)
        @Expect(arrstack.capacity, 9)
        @Expect(arrstack.size, 0)
        @Expect(arrstack.isEmpty(), true)
        @Expect(arrstack.toArray(), Array<String>())
        var iter = arrstack.iterator()
        @Expect(iter.count(), 0)
        @Expect(iter.next(), Option<String>.None)

        arrstack.clear()
        @Expect(arrstack.size, 0)
    }

    @TestCase
    func test_arraystack_init_notblank_03(): Unit {
        let arrstack = ArrayStack<Int64>(30)
        arrstack.add(Int64.Min)
        arrstack.add(0)
        arrstack.add(Int64.Max)
        @Expect(arrstack.capacity, 30)
        @Expect(arrstack.size, 3)
        @Expect(arrstack.isEmpty(), false)
        @Expect(arrstack.peek(), Option<Int64>.Some(Int64.Max))
        @Expect(arrstack.toArray(), [Int64.Max, 0, Int64.Min])
        @Expect(arrstack.toString(), "[9223372036854775807, 0, -9223372036854775808]")

        @Expect(arrstack.remove(), Option<Int64>.Some(Int64.Max))
        @Expect(arrstack.remove(), Option<Int64>.Some(0))

        @Expect(arrstack.capacity, 30)
        @Expect(arrstack.size, 1)
        @Expect(arrstack.isEmpty(), false)
        @Expect(arrstack.peek(), Option<Int64>.Some(Int64.Min))
    }

    @TestCase
    func test_arraystack_init_notblank_04(): Unit {
        let arrstack = ArrayStack<String>(100)
        for (i in 0..50) {
            arrstack.add("${i}")
        }
        @Expect(arrstack.capacity, 100)
        @Expect(arrstack.size, 50)
        @Expect(arrstack.isEmpty(), false)
        @Expect(arrstack.peek(), Option<String>.Some("49"))
        @Expect(arrstack.peek(), Option<String>.Some("49"))
        var arr = Array<String>(50, {i => "${49 - i}"})
        @Expect(arrstack.toArray(), arr)
        @Expect(arrstack.toString(), "${arr}")

        @Expect(arrstack.remove(), Option<String>.Some("49"))
        @Expect(arrstack.remove(), Option<String>.Some("48"))
        @Expect(arrstack.remove(), Option<String>.Some("47"))

        @Expect(arrstack.capacity, 100)
        @Expect(arrstack.size, 47)
        @Expect(arrstack.isEmpty(), false)
        @Expect(arrstack.peek(), Option<String>.Some("46"))

        arrstack.reserve(12)
        @Expect(arrstack.capacity, 100)

        arrstack.reserve(13)
        @Expect(arrstack.capacity, 100) // bug,此处不应该扩容

        arrstack.clear()
        @Expect(arrstack.capacity, 100)
        @Expect(arrstack.size, 0)
    }

    @TestCase
    func test_arraystack_init_notblank_05(): Unit {
        let arrstack = ArrayStack<String>(1000)
        for (i in 0..10) {
            arrstack.add("${i}")
        }
        @Expect(arrstack.size, 10)

        for (j in 0..9) {
            @Expect(arrstack.remove(), Some("${9-j}"))
            @Expect(arrstack.peek(), Option<String>.Some("${8-j}"))
        }
        @Expect(arrstack.remove(), Some("0"))
        @Expect(arrstack.peek(), Option<String>.None)

        @Expect(arrstack.capacity, 1000)
        @Expect(arrstack.size, 0)
        @Expect(arrstack.isEmpty(), true)

        arrstack.add("")
        @Expect(arrstack.peek(), Option<String>.Some(""))
        @Expect(arrstack.remove(), Some(""))
        arrstack.add("\0")
        @Expect(arrstack.peek(), Option<String>.Some("\0"))
        @Expect(arrstack.remove(), Some("\0"))
        arrstack.add("abc")
        @Expect(arrstack.peek(), Option<String>.Some("abc"))
        @Expect(arrstack.remove(), Some("abc"))
        arrstack.add("仓颉鸿蒙")
        @Expect(arrstack.peek(), Option<String>.Some("仓颉鸿蒙"))
        @Expect(arrstack.remove(), Some("仓颉鸿蒙"))
        arrstack.add("$%&^$*")
        @Expect(arrstack.peek(), Option<String>.Some("$%&^$*"))
        @Expect(arrstack.remove(), Some("$%&^$*"))
        let long_str = StringBuilder(r'a', 100).toString()
        arrstack.add(long_str)
        @Expect(arrstack.peek(), Option<String>.Some("${long_str}"))
        @Expect(arrstack.remove(), Some("${long_str}"))
    }

    @TestCase
    func test_arraystack_init_notblank_06(): Unit {
        let arrstack = ArrayStack<String>(0)
        let long_str = StringBuilder(r'a', 100).toString()
        arrstack.add("$%&^$*")
        arrstack.add("仓颉鸿蒙")
        arrstack.add("abc")
        arrstack.add("\0")
        arrstack.add("")
        arrstack.add(long_str)
        @Expect(arrstack.toArray(), ["${long_str}", "", "\0", "abc", "仓颉鸿蒙", "$%&^$*"])
        @Expect(arrstack.remove(), Some("${long_str}"))
        @Expect(arrstack.remove(), Some(""))
        @Expect(arrstack.remove(), Some("\0"))
        @Expect(arrstack.toString(), "[abc, 仓颉鸿蒙, $%&^$*]")
    }
}
