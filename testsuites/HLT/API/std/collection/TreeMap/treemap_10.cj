/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.collection.*

var cmap = Option<TreeMap<Int64, Int64>>.None
var cmap_str = Option<TreeMap<String, String>>.None
var cmap_str1 = Option<TreeMap<String, Int64>>.None
const N: Int64 = 500
var sum = 0

@Test
class Test_treemap_10 {
    public func PreData(): Unit {
        let cmap1 = TreeMap<Int64, Int64>()
        for (i in -N..N) {
            cmap1.add(i, i + 1)
        }
        cmap = Option<TreeMap<Int64, Int64>>.Some(cmap1)
    }

    public func PreData_str(): Unit {
        let cmap1 = TreeMap<String, String>()
        for (i in -N..N) {
            cmap1.add("${i}", "${i + 1}")
        }
        cmap_str = Option<TreeMap<String, String>>.Some(cmap1)
    }

    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_01(): Unit {
        //test the exception key() and value() situation using Int64.
        PreData()
        var findupper1 = cmap.getOrThrow().forward(-2, inclusive: false).next().getOrThrow()
        @Expect(findupper1[0], -1)
        @Expect(findupper1[1], 0)
        var iter1 = cmap.getOrThrow().forward(-1, inclusive: false)
        let resArr1 = Array<Int64>(500, {i => i})
        var j = 0
        for (it in iter1) {
            @Expect(it[0],resArr1.get(j))
            j++
        }
    }

    @TestCase
    func test_02(): Unit {
        //test the exception next() and prev() situation using Int64.
        PreData()
        let findlower1 = cmap.getOrThrow().backward(50000, inclusive: false).next().getOrThrow()
        @Expect(findlower1[0], 499)
        @Expect(findlower1[1], 500)
    }

    @TestCase
    func test_03(): Unit {
        //test the exception backward() and forward() situation using Int64.
        PreData()
        let findupper1 = cmap.getOrThrow().forward(-2, inclusive: false).next().getOrThrow()
        @Expect(findupper1[0], -1)
        @Expect(findupper1[1], 0)
    }
}
