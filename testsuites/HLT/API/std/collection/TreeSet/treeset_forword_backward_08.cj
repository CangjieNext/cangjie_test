/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt -o %output %f --test
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

var cmap = Option<TreeSet<Int64>>.None
var cmap_str = Option<TreeSet<String>>.None
const N: Int64 = 50
var sum = 0

@Test
class Test_treeset_dorward_backward_08 {
    public func PreData(): Unit {
        let cmap1 = TreeSet<Int64>()
        for (i in -N..N) {
            cmap1.add(i)
        }
        cmap = Option<TreeSet<Int64>>.Some(cmap1)
    }

    public func PreData_str(): Unit {
        let cmap1 = TreeSet<String>()
        for (i in -N..N) {
            cmap1.add("${i}")
        }
        cmap_str = Option<TreeSet<String>>.Some(cmap1)
    }

    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_01(): Unit {
        //test the forward() of findLUpper() using Int64.
        PreData()
        let findupper1 = cmap.getOrThrow().forward(-2, inclusive: false).next().getOrThrow()
        @Expect(findupper1, -1)

        try {
            var iter = cmap.getOrThrow().forward(500)
        } catch (e: NoneValueException) {
            @Expect(true)
        }

        var iter1 = cmap.getOrThrow().forward(-1)
        let resArr1 = Array<Int64>(N + 1, {i => i - 1})
        var j = 0
        for (it in iter1) {
            @Expect(it,resArr1.get(j))
            j++
        }
        var iter2 = cmap.getOrThrow().forward(-50, inclusive: false)
        let resArr2 = Array<Int64>(2 * N - 1, {i => i - 49})
        var k = 0
        for (it in iter2) {
            @Expect(it,resArr2.get(k))
            k++
        }
    }

    @TestCase
    func test_02(): Unit {
        //test the forward() of backward().next() using Int64.
        PreData()
        let findlower1 = cmap.getOrThrow().backward(500, inclusive: false).next().getOrThrow()
        @Expect(findlower1, 49)
        var iter = cmap.getOrThrow().forward(49)
        let resArr = Array<Int64>(N, {i => 49})
        let resArr_value = Array<Int64>(N, {i => 50})
        var k = 0
        for (it in iter) {
            @Expect(it,resArr.get(k))
            k++
        }
        var iter1 = cmap.getOrThrow().forward(0)
        let resArr1 = Array<Int64>(N, {i => i})
        let resArr_value1 = Array<Int64>(N, {i => i + 1})
        var j = 0
        for (it in iter1) {
            @Expect(it,resArr1.get(j))
            j++
        }
        let findlower2 = cmap.getOrThrow().backward(1, inclusive: false).next().getOrThrow()
        @Expect(findlower2, 0)

        try {
            var iter2 = cmap.getOrThrow().forward(49)
        } catch (_: NoneValueException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_03(): Unit {
        //test the forward() of forward().next() not contain self using Int64.
        PreData()
        let findupper1 = cmap.getOrThrow().forward(-2, inclusive: false).next().getOrThrow()
        @Expect(findupper1, -1)
        try {
            var iter = cmap.getOrThrow().forward(500, inclusive: false)
        } catch (_: NoneValueException) {
            @Expect(true)
        }

        try {
            var iter1 = cmap.getOrThrow().forward(-1, inclusive: false)
        } catch (_: NoneValueException) {
            @Expect(true)
        }

        var iter2 = cmap.getOrThrow().forward(-50, inclusive: false)
        let resArr2 = Array<Int64>(N * 2 - 1, {i => (i - 49)})
        var k = 0
        for (it in iter2) {
            @Expect(it,resArr2.get(k))
            k++
        }
    }

    @TestCase
    func test_04(): Unit {
        //test the forward() of backward().next() not contain self using Int64.
        PreData()
        let findlower1 = cmap.getOrThrow().backward(50).next().getOrThrow()
        @Expect(findlower1, 49)
        var iter = cmap.getOrThrow().forward(49, inclusive: false)
        for (it in iter) {
            @Assert(false)
        }
        var iter1 = cmap.getOrThrow().forward(-1, inclusive: false)
        let resArr1 = Array<Int64>(N, {i => i})
        let resArr_value1 = Array<Int64>(N, {i => i + 1})
        var j = 0
        for (it in iter1) {
            @Expect(it,resArr1.get(j))
            j++
        }
        let findlower2 = cmap.getOrThrow().backward(1, inclusive: false).next().getOrThrow()
        @Expect(findlower2, 0)
        try {
            var iter2 = cmap.getOrThrow().forward(49, inclusive: false).next().getOrThrow()
        } catch (e: NoneValueException) {
            @Expect(e.toString().contains("NoneValueException"))
        }
    }

    @TestCase
    func test_05(): Unit {
        //test the forward() of forward().next() using String.
        PreData_str()
        let findupper1 = cmap_str.getOrThrow().forward("-1", inclusive: false).next().getOrThrow()
        @Expect(findupper1, "-10")
        var iter = cmap_str.getOrThrow().forward("99", inclusive: false)
        for (it in iter) {
            @Assert(false)
        }
        var iter3 = cmap_str.getOrThrow().backward("-10", inclusive: true)
        let resArr3 = ["-10", "-1"]
        let resArr_value3 = ["-9", "0"]
        var j = 0
        for (it in iter3) {
            @Expect(it, resArr3.get(j))
            j++
        }
        try {
            var iter4 = cmap_str.getOrThrow().forward("-10", inclusive: false).next().getOrThrow()
        } catch (e: NoneValueException) {
            @Expect(e.toString().contains("NoneValueException"))
        }
        let findupper2 = cmap_str.getOrThrow().forward("-105").next().getOrThrow()
        var iter2 = cmap_str.getOrThrow().backward("-106")
        let resArr2 = ["-10", "-1", "-104", "-103", "-102", "-101", "-100", "-10", "-1", "-10", "-1"]
        var k = 0
        for (it in iter2) {
            @Expect(it,resArr2.get(k))
            k++
        }
    }

    @TestCase
    func test_06(): Unit {
        //test the forward() of backward().next() using String.
        PreData_str()
        let findlower1 = cmap_str.getOrThrow().backward("99", inclusive: false).next().getOrThrow()
        @Expect(findlower1, "9")
        var iter = cmap_str.getOrThrow().forward("99", inclusive: false)
        for (it in iter) {
            @Expect(false)
        }
        var iter1 = cmap_str.getOrThrow().forward("98", inclusive: false)
        let resArr1 = ["99"]
        let resArr_value1 = ["100"]
        var j = 0
        for (it in iter1) {
            @Expect(it,resArr1.get(j))
            j++
        }

        var iter3 = cmap_str.getOrThrow().backward("-1", inclusive: false)
        let resArr3 = ["-106", "-105", "-104", "-103", "-102", "-101", "-100", "-10", "-1", "-10", "-1"]
        var k = 0
        for (it in iter3) {
            @Expect(it,resArr3.get(k))
            k++
        }
    }
}
