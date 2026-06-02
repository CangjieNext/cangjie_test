/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

import std.collection.*
import std.math.*

@Test
class Test_arraylist_of_add_remove_03 {
    @TestCase
    func test_arraylist_of_add_remove_01(): Unit {
        var arrlist = ArrayList.of(Array<Int64>())
        arrlist.add(-1)
        arrlist.add(0)
        arrlist.add(100)
        @Expect(arrlist.first, Option<Int64>.Some(-1))
        @Expect(arrlist.last, Option<Int64>.Some(100))
        var arr: Array<Int64> = [0, 1, 2, 3, 4, 5]
        arrlist.add(all: arr)
        @Expect(arrlist.last, Option<Int64>.Some(5))
        @Expect(arrlist.size, 9)

        arrlist.remove(at: 0)
        @Expect(arrlist.first, Option<Int64>.Some(0))
        @Expect(arrlist.size, 8)

        arrlist.remove(at: 3)
        @Expect(arrlist.toArray(), [0, 100, 0, 2, 3, 4, 5])
        @Expect(arrlist.size, 7)
        @Expect(arrlist.capacity, 9)
    }

    @TestCase
    func test_arraylist_of_add_remove_02(): Unit {
        var arrlist = ArrayList.of(Array<String>())
        arrlist.add("")
        arrlist.add("\0")
        arrlist.add("cangjie")
        arrlist.add("仓颉鸿蒙")
        @Expect(arrlist.first, Option<String>.Some(""))
        @Expect(arrlist.last, Option<String>.Some("仓颉鸿蒙"))
        var arr: Array<String> = ["xyaty", "$#%^#", "♫♬♪♩✲✳❃"]
        arrlist.add(all: arr)
        @Expect(arrlist.last, Option<String>.Some("♫♬♪♩✲✳❃"))
        @Expect(arrlist.size, 7)

        arrlist.remove(at: 3)
        @Expect(arrlist.first, Option<String>.Some(""))
        @Expect(arrlist.last, Option<String>.Some("♫♬♪♩✲✳❃"))
        @Expect(arrlist.size, 6)

        arrlist.remove(at: 5)
        @Expect(arrlist.toArray(), ["","\0","cangjie","xyaty","$#%^#"])
        @Expect(arrlist.size, 5)
        @Expect(arrlist.capacity, 7)
    }

    @TestCase
    func test_arraylist_of_add_remove_03(): Unit {
        var arrlist = ArrayList.of(Array<String>())
        let e = @AssertThrows[IndexOutOfBoundsException](arrlist.remove(at: Int64.Min))
        @Expect(e.message.contains("index: -9223372036854775808, size: 0"))
        var arr: Array<String> = ["100", "1000", "10000"]
        var arrlist1 = ArrayList.of(arr)
        let e1 = @AssertThrows[IndexOutOfBoundsException](arrlist1.remove(at: 3))
        @Expect(e1.message.contains("index: 3, size: 3"))
    }

    @TestCase
    func test_arraylist_of_add_remove_04(): Unit {
        var arr0: Array<String> = ["zps", "cangjie", "hongmeng"]
        var arrlist = ArrayList.of(arr0)
        arrlist.add("")
        arrlist.add("\0")
        arrlist.add("cangjie")
        arrlist.add("仓颉鸿蒙")
        @Expect(arrlist.first, Option<String>.Some("zps"))
        @Expect(arrlist.last, Option<String>.Some("仓颉鸿蒙"))
        var arr: Array<String> = ["xyaty", "$#%^#", "♫♬♪♩✲✳❃"]
        arrlist.add(all: arr)
        @Expect(arrlist.last, Option<String>.Some("♫♬♪♩✲✳❃"))
        @Expect(arrlist.size, 10)

        @Expect(arrlist.remove(at: 3), "")
        @Expect(arrlist.first, Option<String>.Some("zps"))
        @Expect(arrlist.last, Option<String>.Some("♫♬♪♩✲✳❃"))
        @Expect(arrlist.size, 9)

        arrlist.remove(at: 5)
        @Expect(arrlist.toArray(), ["zps", "cangjie", "hongmeng" , "\0", "cangjie", "xyaty", "$#%^#", "♫♬♪♩✲✳❃"])
        @Expect(arrlist.size, 8)
        @Expect(arrlist.capacity, 13)

        let long_str = StringBuilder(r'a', 100).toString()
        arrlist.add(long_str)
        @Expect(arrlist.last, Option<String>.Some(long_str))
    }
}
