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
class Test_treemap_05 {
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
        //test the forward().next() and backward().next() using Int64 .
        PreData()
        let findupper = cmap.getOrThrow().forward(499, inclusive: false).next()
        let findlower = cmap.getOrThrow().backward(-500, inclusive: false).next()
        match (findupper) {
            case None => sum += 1
            case _ => ()
        }
        @Expect(sum, 1)
        match (findlower) {
            case None => sum += 1
            case _ => ()
        }
        @Expect(sum, 2)
        let findupper1 = cmap.getOrThrow().forward(498, inclusive: false).next().getOrThrow()
        let findlower1 = cmap.getOrThrow().backward(-499, inclusive: false).next().getOrThrow()
        @Expect(findupper1[0], 499)
        @Expect(findupper1[1], 500)
        @Expect(findlower1[0], -500)
        @Expect(findlower1[1], -499)
        let findupper2 = cmap.getOrThrow().forward(499, inclusive: true).next().getOrThrow()
        let findlower2 = cmap.getOrThrow().backward(-500, inclusive: true).next().getOrThrow()
        @Expect(findupper2[0], 499)
        @Expect(findupper2[1], 500)
        @Expect(findlower2[0], -500)
        @Expect(findlower2[1], -499)
        let popfirst = cmap.getOrThrow().removeFirst()
        let poplast = cmap.getOrThrow().removeLast()
        let findupper3 = cmap.getOrThrow().forward(498, inclusive: false).next()
        let findlower3 = cmap.getOrThrow().backward(-499, inclusive: false).next()
        match (findupper3) {
            case None => sum += 1
            case _ => ()
        }
        @Expect(sum, 3)
        match (findlower3) {
            case None => sum += 1
            case _ => ()
        }
        @Expect(sum, 4)
        let findupper4 = cmap.getOrThrow().forward(497, inclusive: false).next().getOrThrow()
        let findlower4 = cmap.getOrThrow().backward(-498, inclusive: false).next().getOrThrow()
        @Expect(findupper4[0], 498)
        @Expect(findupper4[1], 499)
        @Expect(findlower4[0], -499)
        @Expect(findlower4[1], -498)
        let cmap_clear = cmap.getOrThrow().clear()
        try {
            let findupper5 = cmap.getOrThrow().forward(-10, inclusive: false).next()
        } catch (_: NoneValueException) {
            sum += 1
        }
        @Expect(sum, 5)

        try {
            let findlower5 = cmap.getOrThrow().backward(98, inclusive: false).next()
        } catch (_: NoneValueException) {
            sum += 1
        }
        @Expect(sum, 6)
    }

    @TestCase
    func test_02(): Unit {
        //test the forward().next() and backward().next() using String .
        PreData_str()
        let findupper = cmap_str.getOrThrow().forward("99", inclusive: false).next()
        let findlower = cmap_str.getOrThrow().backward("-1", inclusive: false).next()
        match (findupper) {
            case None => sum += 1
            case _ => ()
        }
        @Expect(sum, 1)
        match (findlower) {
            case None => sum += 1
            case _ => ()
        }
        @Expect(sum, 2)
        let findupper1 = cmap_str.getOrThrow().forward("99", inclusive: true).next().getOrThrow()
        let findlower1 = cmap_str.getOrThrow().backward("-1", inclusive: true).next().getOrThrow()
        @Expect(findupper1[0], "99")
        @Expect(findupper1[1], "100")
        @Expect(findlower1[0], "-1")
        @Expect(findlower1[1], "0")
        let popfirst = cmap_str.getOrThrow().removeFirst()
        let poplast = cmap_str.getOrThrow().removeLast()
        let findupper2 = cmap_str.getOrThrow().forward("-10", inclusive: false).next().getOrThrow()
        let findlower2 = cmap_str.getOrThrow().backward("98", inclusive: false).next().getOrThrow()
        @Expect(findupper2[0], "-100")
        @Expect(findupper2[1], "-99")
        @Expect(findlower2[0], "97")
        @Expect(findlower2[1], "98")
        let cmap_clear = cmap_str.getOrThrow().clear()
        try {
            let findupper3 = cmap_str.getOrThrow().forward("-10", inclusive: false).next()
        } catch (_: NoneValueException) {
            sum += 1
        }
        @Expect(sum, 3)

        try {
            let findlower3 = cmap_str.getOrThrow().backward("98", inclusive: false).next()
        } catch (_: NoneValueException) {
            sum += 1
        }
        @Expect(sum, 4)
    }
}
