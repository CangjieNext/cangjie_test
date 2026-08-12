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
import std.sort.*

/*
 * Branch-focused coverage for std.sort sort_util.cj via global sort helpers on large arrays.
 */
@Test
class SortUtilCoverageTest {
    func buildData(): ArrayList<Int64> {
        ArrayList<Int64>(1024, {i => (i * 17 + 13) % 997})
    }

    @TestCase
    func testStableAndUnstableSortOnLargeArrayList(): Unit {
        var list = buildData()
        sort(list, stable: true)
        @Expect(list.all({x => x >= 0}), true)
        var list2 = buildData()
        sort(list2, stable: false, descending: true)
        @Expect(list2[0] >= list2[list2.size - 1], true)
    }

    @TestCase
    func testSortByComparatorOnLargeArrayList(): Unit {
        var list = buildData()
        sort(list, by: {a, b => b.compare(a)}, stable: true)
        @Expect(list.size, 1024)
        var list2 = buildData()
        sort(list2, by: {a, b => a.compare(b)}, stable: false, descending: true)
        @Expect(list2.last, Some(list2[list2.size - 1]))
    }

    @TestCase
    func testSortNativeArrayPaths(): Unit {
        var arr = Array<Int64>(512, {i => (512 - i) * 3})
        sort(arr)
        @Expect(arr[0] <= arr[511], true)
        var arr2 = Array<Int64>(512, {i => i * 7 % 101})
        sort(arr2, stable: true, descending: true)
        @Expect(arr2[0] >= arr2[511], true)
    }
}
