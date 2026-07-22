/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt


import std.sort.*
import std.math.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class SortBranchApiTest {

    @TestCase
    func test_sort_small(): Unit {
        var arr = Array<Int64>(8, repeat: 0)
        arr[0] = 3; arr[1] = 1; arr[2] = 4; arr[3] = 1
        arr[4] = 5; arr[5] = 9; arr[6] = 2; arr[7] = 6
        sort(arr)
        @Expect(arr[0], 1)
        @Expect(arr[7], 9)
    }

    @TestCase
    func test_sort_already_sorted(): Unit {
        var arr = Array<Int64>(5, repeat: 0)
        arr[0] = 1; arr[1] = 2; arr[2] = 3; arr[3] = 4; arr[4] = 5
        sort(arr)
        @Expect(arr[0], 1)
        @Expect(arr[4], 5)
    }

    @TestCase
    func test_sort_reverse(): Unit {
        var arr = Array<Int64>(5, repeat: 0)
        arr[0] = 5; arr[1] = 4; arr[2] = 3; arr[3] = 2; arr[4] = 1
        sort(arr)
        @Expect(arr[0], 1)
        @Expect(arr[4], 5)
    }

    @TestCase
    func test_sort_all_equal(): Unit {
        var arr = Array<Int64>(5, repeat: 7)
        sort(arr)
        @Expect(arr[0], 7)
        @Expect(arr[4], 7)
    }

    @TestCase
    func test_sort_single(): Unit {
        var arr = Array<Int64>(1, repeat: 42)
        sort(arr)
        @Expect(arr[0], 42)
    }

    @TestCase
    func test_sort_empty(): Unit {
        var arr = Array<Int64>(0, repeat: 0)
        sort(arr)
        @Expect(arr.size, 0)
    }

    @TestCase
    func test_sort_two(): Unit {
        var arr = Array<Int64>(2, repeat: 0)
        arr[0] = 2; arr[1] = 1
        sort(arr)
        @Expect(arr[0], 1)
        @Expect(arr[1], 2)
    }

    @TestCase
    func test_sort_three(): Unit {
        var arr = Array<Int64>(3, repeat: 0)
        arr[0] = 3; arr[1] = 1; arr[2] = 2
        sort(arr)
        @Expect(arr[0], 1)
        @Expect(arr[1], 2)
        @Expect(arr[2], 3)
    }

    @TestCase
    func test_sort_descending(): Unit {
        var arr = Array<Int64>(5, repeat: 0)
        arr[0] = 1; arr[1] = 2; arr[2] = 3; arr[3] = 4; arr[4] = 5
        sort(arr, descending: true)
        @Expect(arr[0], 5)
        @Expect(arr[4], 1)
    }

    @TestCase
    func test_sort_stable(): Unit {
        var arr = Array<Int64>(5, repeat: 0)
        arr[0] = 3; arr[1] = 1; arr[2] = 4; arr[3] = 1; arr[4] = 5
        sort(arr, stable: true)
        @Expect(arr[0], 1)
        @Expect(arr[4], 5)
    }

    @TestCase
    func test_sort_stable_descending(): Unit {
        var arr = Array<Int64>(5, repeat: 0)
        arr[0] = 3; arr[1] = 1; arr[2] = 4; arr[3] = 1; arr[4] = 5
        sort(arr, stable: true, descending: true)
        @Expect(arr[0], 5)
        @Expect(arr[4], 1)
    }

    @TestCase
    func test_sort_negatives(): Unit {
        var arr = Array<Int64>(6, repeat: 0)
        arr[0] = -5; arr[1] = 3; arr[2] = -2; arr[3] = 0; arr[4] = 1; arr[5] = -10
        sort(arr)
        @Expect(arr[0], -10)
        @Expect(arr[5], 3)
    }

    @TestCase
    func test_sort_equal_prefix(): Unit {
        var arr = Array<Int64>(8, repeat: 0)
        arr[0] = 7; arr[1] = 7; arr[2] = 7; arr[3] = 7; arr[4] = 1; arr[5] = 2; arr[6] = 3; arr[7] = 4
        sort(arr)
        @Expect(arr[0], 1)
        @Expect(arr[7], 7)
    }

    @TestCase
    func test_sort_descending_run(): Unit {
        var arr = Array<Int64>(8, repeat: 0)
        arr[0] = 5; arr[1] = 4; arr[2] = 3; arr[3] = 2; arr[4] = 1; arr[5] = 6; arr[6] = 7; arr[7] = 8
        sort(arr)
        @Expect(arr[0], 1)
        @Expect(arr[7], 8)
    }

    @TestCase
    func test_sort_by_comparator(): Unit {
        var arr = Array<Int64>(5, repeat: 0)
        arr[0] = 3; arr[1] = 1; arr[2] = 4; arr[3] = 1; arr[4] = 5
        sort(arr, by: { a, b =>
            if (a < b) { Ordering.LT }
            else if (a > b) { Ordering.GT }
            else { Ordering.EQ }
        })
        @Expect(arr[0], 1)
        @Expect(arr[4], 5)
    }

    @TestCase
    func test_sort_by_comparator_descending(): Unit {
        var arr = Array<Int64>(5, repeat: 0)
        arr[0] = 1; arr[1] = 2; arr[2] = 3; arr[3] = 4; arr[4] = 5
        sort(arr, by: { a, b =>
            if (a < b) { Ordering.GT }
            else if (a > b) { Ordering.LT }
            else { Ordering.EQ }
        })
        @Expect(arr[0], 5)
        @Expect(arr[4], 1)
    }

    @TestCase
    func test_sort_by_less_than(): Unit {
        var arr = Array<Int64>(5, repeat: 0)
        arr[0] = 3; arr[1] = 1; arr[2] = 4; arr[3] = 1; arr[4] = 5
        sort(arr, lessThan: { a, b => a < b })
        @Expect(arr[0], 1)
        @Expect(arr[4], 5)
    }

    @TestCase
    func test_sort_by_key(): Unit {
        var arr = Array<Int64>(5, repeat: 0)
        arr[0] = -5; arr[1] = 3; arr[2] = -2; arr[3] = 1; arr[4] = -4
        sort(arr, key: { x: Int64 => abs(x) })
        @Assert(abs(arr[0]) <= abs(arr[4]))
    }

    @TestCase
    func test_sort_strings(): Unit {
        var arr = Array<String>(4, repeat: "")
        arr[0] = "banana"; arr[1] = "apple"; arr[2] = "cherry"; arr[3] = "date"
        sort(arr)
        @Expect(arr[0], "apple")
        @Expect(arr[3], "date")
    }

    @TestCase
    func test_sort_int32(): Unit {
        var arr = Array<Int32>(5, repeat: 0i32)
        arr[0] = 100i32; arr[1] = 0i32; arr[2] = -50i32; arr[3] = 75i32; arr[4] = -25i32
        sort(arr)
        @Expect(arr[0], -50i32)
        @Expect(arr[4], 100i32)
    }

    @TestCase
    func test_sort_uint64(): Unit {
        var arr = Array<UInt64>(5, repeat: 0u64)
        arr[0] = 100u64; arr[1] = 0u64; arr[2] = 50u64; arr[3] = 75u64; arr[4] = 25u64
        sort(arr)
        @Expect(arr[0], 0u64)
        @Expect(arr[4], 100u64)
    }

    // ==================== ArrayList sort ====================

    @TestCase
    func test_arraylist_sort(): Unit {
        var list = ArrayList<Int64>()
        list.add(3)
        list.add(1)
        list.add(4)
        list.add(1)
        list.add(5)
        sort(list)
        @Expect(list[0], 1)
        @Expect(list[4], 5)
    }

    @TestCase
    func test_arraylist_sort_descending(): Unit {
        var list = ArrayList<Int64>()
        list.add(1)
        list.add(2)
        list.add(3)
        sort(list, descending: true)
        @Expect(list[0], 3)
        @Expect(list[2], 1)
    }

    @TestCase
    func test_arraylist_sort_empty(): Unit {
        var list = ArrayList<Int64>()
        sort(list)
        @Expect(list.size, 0)
    }

    @TestCase
    func test_arraylist_sort_single(): Unit {
        var list = ArrayList<Int64>()
        list.add(42)
        sort(list)
        @Expect(list[0], 42)
    }

    @TestCase
    func test_arraylist_sort_by_key(): Unit {
        var list = ArrayList<Int64>()
        list.add(-5)
        list.add(3)
        list.add(-2)
        list.add(1)
        list.add(-4)
        sort(list, key: { x: Int64 => abs(x) })
        @Assert(abs(list[0]) <= abs(list[4]))
    }
}
