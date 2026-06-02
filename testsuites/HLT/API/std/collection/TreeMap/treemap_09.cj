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
class Test_treemap_09 {
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
        //test the forward() of findLUpper() using Int64.
        PreData()
        let findupper1 = cmap.getOrThrow().forward(-2, inclusive: false).next().getOrThrow()
        @Expect(findupper1[0], -1)
        @Expect(findupper1[1], 0)
        try {
            var iter = cmap.getOrThrow().forward(500)
        } catch (_: NoneValueException) {
            @Assert(true)
        }
        var iter1 = cmap.getOrThrow().forward(-1)
        let resArr1 = Array<Int64>(N + 1, {i => i - 1})
        var j = 0
        for (it in iter1) {
            @Expect(it[0],resArr1.get(j))
            j++
        }
        var iter2 = cmap.getOrThrow().forward(-500, inclusive: false)
        let resArr2 = Array<Int64>(2 * N - 1, {i => i - 499})
        var k = 0
        for (it in iter2) {
            @Expect(it[0],resArr2.get(k))
            k++
        }
    }

    @TestCase
    func test_02(): Unit {
        //test the forward() of backward().next() using Int64.
        PreData()
        let findlower1 = cmap.getOrThrow().backward(500, inclusive: false).next().getOrThrow()
        @Expect(findlower1[0], 499)
        @Expect(findlower1[1], 500)
        var iter = cmap.getOrThrow().forward(499)
        let resArr = Array<Int64>(N, {i => 499})
        let resArr_value = Array<Int64>(N, {i => 500})
        var k = 0
        for (it in iter) {
            @Expect(it[0],resArr.get(k))
            @Expect(it[1],resArr_value.get(k))
            k++
        }
        var iter1 = cmap.getOrThrow().forward(0)
        let resArr1 = Array<Int64>(N, {i => i})
        let resArr_value1 = Array<Int64>(N, {i => i + 1})
        var j = 0
        for (it in iter1) {
            @Expect(it[0],resArr1.get(j))
            @Expect(it[1],resArr_value1.get(j))
            j++
        }
        let findlower2 = cmap.getOrThrow().backward(1, inclusive: false).next().getOrThrow()
        @Expect(findlower2[0], 0)
        @Expect(findlower2[1], 1)
        try {
            var iter2 = cmap.getOrThrow().forward(499)
        } catch (_: NoneValueException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_03(): Unit {
        //test the forward() of findLUpper() not contain self using Int64.
        PreData()
        let findupper1 = cmap.getOrThrow().forward(-2, inclusive: false).next().getOrThrow()
        @Expect(findupper1[0], -1)
        @Expect(findupper1[1], 0)

        try {
            var iter = cmap.getOrThrow().forward(500, inclusive: false)
        } catch (_: NoneValueException) {
            @Assert(true)
        }

        try {
            var iter1 = cmap.getOrThrow().forward(-1, inclusive: false)
        } catch (_: NoneValueException) {
            @Assert(true)
        }
        var iter2 = cmap.getOrThrow().forward(-500, inclusive: false)
        let resArr2 = Array<Int64>(2 * N - 1, {i => i - 499})
        var k = 0
        for (it in iter2) {
            @Expect(it[0],resArr2.get(k))
            k++
        }
    }

    @TestCase
    func test_04(): Unit {
        //test the forward() of backward().next() not contain self using Int64.
        PreData()
        let findlower1 = cmap.getOrThrow().backward(500, inclusive: false).next().getOrThrow()
        @Expect(findlower1[0], 499)
        @Expect(findlower1[1], 500)
        var iter = cmap.getOrThrow().forward(499, inclusive: false)
        for (it in iter) {
            @Assert(false)
        }
        var iter1 = cmap.getOrThrow().forward(0, inclusive: true)
        let resArr1 = Array<Int64>(N, {i => i})
        let resArr_value1 = Array<Int64>(N, {i => i + 1})
        var j = 0
        for (it in iter1) {
            @Expect(it[0],resArr1.get(j))
            @Expect(it[1],resArr_value1.get(j))
            j++
        }
        let findlower2 = cmap.getOrThrow().backward(1, inclusive: false).next().getOrThrow()
        @Expect(findlower2[0], 0)
        @Expect(findlower2[1], 1)
        var iter2 = cmap.getOrThrow().forward(499, inclusive: false)
        for (it in iter2) {
            @Assert(false)
        }
    }

    @TestCase
    func test_05(): Unit {
        //test the forward() of findLUpper() using String.
        PreData()
        let findupper1 = cmap.getOrThrow().forward(-2, inclusive: false).next().getOrThrow()
        @Expect(findupper1[0], -1)
        @Expect(findupper1[1], 0)
        try {
            var iter = cmap.getOrThrow().forward(500)
        } catch (_: NoneValueException) {
            @Assert(true)
        }
        var iter1 = cmap.getOrThrow().forward(-1, inclusive: false)
        let resArr1 = Array<Int64>(N, {i => i})
        var j = 0
        for (it in iter1) {
            @Expect(it[0],resArr1.get(j))
            j++
        }
        var iter2 = cmap.getOrThrow().forward(-500, inclusive: false)
        let resArr2 = Array<Int64>(2 * N - 1, {i => i - 499})
        var k = 0
        for (it in iter2) {
            @Expect(it[0],resArr2.get(k))
            k++
        }
    }
}
