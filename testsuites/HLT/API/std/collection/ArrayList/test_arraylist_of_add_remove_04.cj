/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

import std.collection.*
import std.math.*

@Test
class Test_arraylist_of_add_remove_04 {
    @TestCase
    func test_arraylist_of_add_remove_01(): Unit {
        var arrlist = ArrayList.of(Array<Int64>())
        arrlist.add(-1, at: 0)
        arrlist.add(0, at: 1)
        arrlist.add(100, at: 2)
        @Expect(arrlist.first, Option<Int64>.Some(-1))
        @Expect(arrlist.last, Option<Int64>.Some(100))
        var arr: Array<Int64> = [0, 1, 2, 3, 4, 5]
        arrlist.add(all: arr, at: 0)
        @Expect(arrlist.last, Option<Int64>.Some(100))
        @Expect(arrlist.size, 9)

        arrlist.add(all: arr, at: 9)
        @Expect(arrlist.first, Option<Int64>.Some(0))
        @Expect(arrlist.last, Option<Int64>.Some(5))
        @Expect(arrlist.size, 15)
        var arr1: Array<Int64> = [0, 1, 2, 3, 4, 5, -1, 0, 100, 0, 1, 2, 3, 4, 5]
        @Expect(arrlist.toArray(), arr1)
    }

    @TestCase
    func test_arraylist_of_add_remove_02(): Unit {
        var arrlist = ArrayList.of(Array<String>())
        arrlist.add("", at: 0)
        arrlist.add("\0", at: 1)
        arrlist.add("cangjie", at: 2)
        arrlist.add("仓颉鸿蒙", at: 3)
        @Expect(arrlist.first, Option<String>.Some(""))
        @Expect(arrlist.last, Option<String>.Some("仓颉鸿蒙"))
        var arr: Array<String> = ["xyaty", "$#%^#", "♫♬♪♩✲✳❃"]
        arrlist.add(all: arr, at: 0)
        @Expect(arrlist.last, Option<String>.Some("仓颉鸿蒙"))
        @Expect(arrlist.size, 7)

        arrlist.add(all: arr, at: 7)
        @Expect(arrlist.first, Option<String>.Some("xyaty"))
        @Expect(arrlist.last, Option<String>.Some("♫♬♪♩✲✳❃"))
        @Expect(arrlist.size, 10)
        @Expect(arrlist.capacity, 10)
        arrlist.remove(at: 0)
        @Expect(arrlist.size, 9)
        @Expect(arrlist.capacity, 10)
    }

    @TestCase
    func test_arraylist_of_add_remove_03(): Unit {
        var arrlist = ArrayList.of(Array<String>())
        let e = @AssertThrows[IndexOutOfBoundsException](arrlist.add("-1", at:-1))
        @Expect(e.message.contains("index: -1, size: 0"))
        arrlist.add("zps")
        arrlist.add("1", at: 1)
        let e1 = @AssertThrows[IndexOutOfBoundsException](arrlist.add("2", at:3))
        @Expect(e1.message.contains("index: 3, size: 2"))
    }

    @TestCase
    func test_arraylist_of_add_remove_04(): Unit {
        var arr0: Array<String> = ["zps", "cangjie", "hongmeng"]
        var arrlist = ArrayList.of(arr0)
        arrlist.add("", at: 0)
        arrlist.add("\0", at: 1)
        arrlist.add("cangjie", at: 2)
        arrlist.add("仓颉鸿蒙", at: 3)
        @Expect(arrlist.first, Option<String>.Some(""))
        @Expect(arrlist.last, Option<String>.Some("hongmeng"))
        var arr: Array<String> = ["xyaty", "$#%^#", "♫♬♪♩✲✳❃"]
        arrlist.add(all: arr, at: 0)
        @Expect(arrlist.last, Option<String>.Some("hongmeng"))
        @Expect(arrlist.size, 10)

        arrlist.add(all: arr, at: 7)
        @Expect(arrlist.first, Option<String>.Some("xyaty"))
        @Expect(arrlist.last, Option<String>.Some("hongmeng"))
        @Expect(arrlist.size, 13)
        @Expect(arrlist.capacity, 15)
        arrlist.remove(at: 0)
        @Expect(arrlist.size, 12)
        @Expect(arrlist.capacity, 15)
        let long_str = StringBuilder(r'a', 100).toString()
        arrlist.add(long_str)
        @Expect(arrlist.last, Option<String>.Some(long_str))
    }
}
