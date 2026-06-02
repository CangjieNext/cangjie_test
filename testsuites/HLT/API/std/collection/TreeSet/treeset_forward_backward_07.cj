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
// var cmap_str1 = Option<TreeMap<String, Int64>>.None
const N: Int64 = 500
var sum = 0

@Test
class Test_treemap_07 {
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
        //test the forward().next() and backward().next() using Int64 .
        PreData()
        let findupper1 = cmap.getOrThrow().forward(498, inclusive: false)
        let findlower1 = cmap.getOrThrow().backward(-499, inclusive: true)
        let findupper2 = cmap.getOrThrow().forward(499, inclusive: false)
        let findlower2 = cmap.getOrThrow().backward(498, inclusive: false)

        @Expect(findupper1.next().getOrThrow() == 499)
        @Expect(findlower1.next().getOrThrow() == -499)
        @Expect(findlower1.next().getOrThrow() == -500)
        @Expect(findlower2.next().getOrThrow() == 497)
        try {
            let next1 = findupper1.next().getOrThrow()
        } catch (_: NoneValueException) {
            sum += 1
        }
        @Expect(sum, 1)
        try {
            let prev2 = findupper2.next().getOrThrow()
        } catch (_: NoneValueException) {
            sum += 1
        }
        @Expect(sum, 2)
    }

    @TestCase
    func test_02(): Unit {
        //test the forward().next() and backward().next() using String.
        PreData_str()
        let findupper1 = cmap_str.getOrThrow().forward("99", inclusive: true)
        let findlower1 = cmap_str.getOrThrow().forward("-1", inclusive: true)
        let findupper2 = cmap_str.getOrThrow().backward("-1", inclusive: false)
        let findlower2 = cmap_str.getOrThrow().backward("99", inclusive: false)
        var next1 = findupper1.next().getOrThrow()
        @Expect(next1 == "99")
        try {
            next1 = findupper1.next().getOrThrow()
        } catch (_: NoneValueException) {
            sum += 1
        }
        @Expect(sum, 1)

        var prev1 = findlower1.next().getOrThrow()
        @Expect(prev1 == "-1")
        try {
            let prev2 = findupper2.next().getOrThrow()
        } catch (_: NoneValueException) {
            sum += 1
        }
        @Expect(sum, 2)
        let prev2 = findlower2.next().getOrThrow()
        @Expect(prev2 == "98")
        let next2 = findlower1.next().getOrThrow()
        @Expect(next2 == "-10")
    }

    @TestCase
    func test_03(): Unit {
        //test the backward() of forward().next() using Int64.
        PreData()
        let findupper1 = cmap.getOrThrow().forward(-501).next().getOrThrow()
        @Expect(findupper1, -500)
        var iter = cmap.getOrThrow().forward(-500, inclusive: true)
        let resArr = Array<Int64>(2 * N, {i => i - 500})
        let resArr_value = Array<Int64>(2 * N, {i => i - 499})
        var i = 0
        for (it in iter) {
            @Expect(it,resArr.get(i))
            i++
        }
        var iter1 = cmap.getOrThrow().backward(-500, inclusive: false)
        let resArr1 = Array<Int64>(N, {i => i - 500})
        var j = 0
        for (it in iter1) {
            @Expect(it,resArr1.get(j))
            j++
        }
        var iter2 = cmap.getOrThrow().backward(-500, inclusive: false)
        let resArr2 = Array<Int64>(N, {i => -500})
        var k = 0
        for (it in iter2) {
            @Expect(it,resArr2.get(k))
            k++
        }
        let findupper2 = cmap.getOrThrow().forward(-1, inclusive: false).next().getOrThrow()
        @Expect(findupper2, 0)
        var iter3 = cmap.getOrThrow().backward(-500, inclusive: false)
        for (it in iter3) {
            @Assert(false)
        }
    }

    @TestCase
    func test_04(): Unit {
        //test the backward() of backward().next() using Int64 .
        PreData()
        let findlower1 = cmap.getOrThrow().backward(500).next().getOrThrow()
        @Expect(findlower1, 499)
        var iter = cmap.getOrThrow().forward(499, inclusive: false)
        let resArr = Array<Int64>(N, {i => 499})
        let resArr_value = Array<Int64>(N, {i => 500})
        var k = 0
        for (it in iter) {
            @Expect(it,resArr.get(k))
            k++
        }
        var iter1 = cmap.getOrThrow().backward(0, inclusive: false)
        for (it in iter1) {
            @Assert(true)
        }
        let findlower2 = cmap.getOrThrow().backward(1, inclusive: false).next().getOrThrow()
        @Expect(findlower2, 0)
        var iter2 = cmap.getOrThrow().forward(499, inclusive: false)
        let resArr2 = Array<Int64>(N, {i => i})
        let resArr_value2 = Array<Int64>(N, {i => i + 1})
        var i = 0
        for (it in iter2) {
            @Expect(it,resArr2.get(i))
            i++
        }
    }

    @TestCase
    func test_05(): Unit {
        //test the backward() of forward().next() using String.
        PreData()
        let findupper1 = cmap.getOrThrow().forward(-501, inclusive: false).next().getOrThrow()
        @Expect(findupper1, -500)
        var iter = cmap.getOrThrow().forward(-500, inclusive: true)
        let resArr = Array<Int64>(2 * N, {i => i - 500})
        let resArr_value = Array<Int64>(2 * N, {i => i - 499})
        var i = 0
        for (it in iter) {
            @Expect(it,resArr.get(i))
            i++
        }
        var iter1 = cmap.getOrThrow().backward(-500, inclusive: true)
        let resArr1 = Array<Int64>(N, {i => i - 500})
        var j = 0
        for (it in iter1) {
            @Expect(it,resArr1.get(j))
            j++
        }
        var iter2 = cmap.getOrThrow().backward(-500)
        let resArr2 = Array<Int64>(N, {i => -500})
        var k = 0
        for (it in iter2) {
            @Expect(it,resArr2.get(k))
            k++
        }
        let findupper2 = cmap.getOrThrow().forward(-1, inclusive: false).next().getOrThrow()
        @Expect(findupper2, 0)
        var iter3 = cmap.getOrThrow().backward(-500, inclusive: false)
        for (it in iter3) {
            @Assert(false)
        }
    }
}
