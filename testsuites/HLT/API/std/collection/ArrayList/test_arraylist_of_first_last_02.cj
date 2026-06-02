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

@Test
class Test_arraylist_of_first_last_02 {
    @TestCase
    func test_arraylist_of_01(): Unit {
        var arrlist = ArrayList.of(Array<Int64>())
        @Expect(arrlist.first, Option<Int64>.None)
        @Expect(arrlist.last, Option<Int64>.None)
    }

    @TestCase
    func test_arraylist_of_02(): Unit {
        var arrlist = ArrayList.of(Array<String>())
        @Expect(arrlist.first, Option<String>.None)
        @Expect(arrlist.last, Option<String>.None)
    }

    @TestCase
    func test_arraylist_of_03(): Unit {
        var arrlist = ArrayList.of(Array<Float16>())
        @Expect(arrlist.first, Option<Float16>.None)
        @Expect(arrlist.last, Option<Float16>.None)
    }

    @TestCase
    func test_arraylist_of_04(): Unit {
        var arr = Array<Int64>(50, {i => i + 1})
        var arrlist = ArrayList.of(arr)
        @Expect(arrlist.first, Option<Int64>.Some(1))
        @Expect(arrlist.last, Option<Int64>.Some(50))
    }

    @TestCase
    func test_arraylist_of_05(): Unit {
        var arr = Array<String>(50, {i => "${i + 1}"})
        var arrlist = ArrayList.of(arr)
        @Expect(arrlist.first, Option<String>.Some("1"))
        @Expect(arrlist.last, Option<String>.Some("50"))
    }

    @TestCase
    func test_arraylist_of_06(): Unit {
        var arr = Array<String>(10, {i => ""})
        var arrlist = ArrayList.of(arr)
        @Expect(arrlist.first, Option<String>.Some(""))
        @Expect(arrlist.last, Option<String>.Some(""))
    }

    @TestCase
    func test_arraylist_of_07(): Unit {
        var arr = Array<String>(10, {i => "\0"})
        var arrlist = ArrayList.of(arr)
        @Expect(arrlist.first, Option<String>.Some("\0"))
        @Expect(arrlist.last, Option<String>.Some("\0"))
    }

    @TestCase
    func test_arraylist_of_08(): Unit {
        var arr = Array<String>(10, {i => "仓颉鸿蒙${i}"})
        var arrlist = ArrayList.of(arr)
        @Expect(arrlist.first, Option<String>.Some("仓颉鸿蒙0"))
        @Expect(arrlist.last, Option<String>.Some("仓颉鸿蒙9"))
    }

    @TestCase
    func test_arraylist_of_09(): Unit {
        var arr = Array<String>(10, {i => "#@%$&%${i}"})
        var arrlist = ArrayList.of(arr)
        @Expect(arrlist.first, Option<String>.Some("#@%$&%0"))
        @Expect(arrlist.last, Option<String>.Some("#@%$&%9"))
    }

    @TestCase
    func test_arraylist_of_10(): Unit {
        var arr = Array<Float64>(10, {i => (0.1 + Float64(i))})
        var arrlist = ArrayList.of(arr)
        @Expect(arrlist.first, Option<Float64>.Some(0.1))
        @Expect(arrlist.last, Option<Float64>.Some(9.1))
    }
}
