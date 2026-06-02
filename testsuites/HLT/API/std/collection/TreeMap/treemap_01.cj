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

const N: Int64 = 500
var sum = 0

@Test
class Test_treemap_01 {
    public func PreData(a: Int64): (Int64, Int64) {
        let x: (Int64, Int64) = (a, a + 1)
        return x
    }
    public override func beforeEach(): Unit {
        sum = 0
    }
    @TestCase
    func test_01(): Unit {
        // test the init() and query the size.
        let cmap = TreeMap<Int64, Int64>()
        @Expect(cmap.size, 0)
        for (i in 0..N) {
            cmap.add(i, i + 1)
        }
        let res = Array<Int64>(N, repeat: 0)
        let resArr = Array<Int64>(N, {i => i + 1})
        for ((k, v) in cmap) {
            res[k] = v
        }
        @Expect(res,resArr)
        @Expect(res.size, resArr.size)
        @Expect(cmap.size, N)
    }

    @TestCase
    func test_02(): Unit {
        //test the init(elements: Collection<(K, V)>) and query the size with not repeats.
        let cmap = TreeMap<Int64, Int64>(HashMap<Int64, Int64>())
        @Expect(cmap.size, 0)
        let collect = HashMap<Int64, Int64>(Array<(Int64, Int64)>(N, {i => (i, i + 5)}))
        let cmap1 = TreeMap<Int64, Int64>(collect)
        @Expect(cmap1.size, N)
        let res = Array<Int64>(N, repeat: 0)
        let resArr = Array<Int64>(N, {i => i + 5})
        for ((k, v) in cmap1) {
            res[k] = v
        }
        @Expect(res,resArr)
        @Expect(res.size, resArr.size)
    }
    @TestCase
    func test_03(): Unit {
        //test the init(elements: Collection<(K, V)>) and query the size with repeats.
        let cmap = TreeMap<Int64, Int64>(HashMap<Int64, Int64>())
        @Expect(cmap.size, 0)
        let arr = Array<(Int64, Int64)>(N, {i => (1, 1)})
        let collect = HashMap<Int64, Int64>(arr)
        let cmap1 = TreeMap<Int64, Int64>(collect)
        @Expect(cmap1.size, 1)
        let res = Array<Int64>(N, repeat: 0)
        let resArr = Array<Int64>(N, {i => 1})
        for ((k, v) in cmap1) {
            res[k] = v
        }
        @Expect(res[1], 1)
    }

    @TestCase
    func test_04(): Unit {
        //test the init(elements: Array<(K,V)>) and query the size with not repeats.
        let cmap = TreeMap<Int64, Int64>(HashMap<Int64, Int64>())
        @Expect(cmap.size, 0)
        let arr = Array<(Int64, Int64)>(N, {i => (i, i + 5)})
        let cmap1 = TreeMap<Int64, Int64>(arr)
        @Expect(cmap1.size, N)
        let res = Array<Int64>(N, repeat: 0)
        let resArr = Array<Int64>(N, {i => i + 5})
        for ((k, v) in cmap1) {
            res[k] = v
        }
        @Expect(res,resArr)
        @Expect(res.size, resArr.size)
    }

    @TestCase
    func test_05(): Unit {
        //test the init(elements: Array<(K,V)>) and query the size with repeats.
        let cmap = TreeMap<Int64, Int64>(HashMap<Int64, Int64>())
        @Expect(cmap.size, 0)
        let arr = Array<(Int64, Int64)>(N, {i => (1, 1)})
        let cmap1 = TreeMap<Int64, Int64>(arr)
        @Expect(cmap1.size, 1)
        let res = Array<Int64>(N, repeat: 0)
        let resArr = Array<Int64>(N, {i => 1})
        for ((k, v) in cmap1) {
            res[k] = v
        }
        @Expect(res[1], 1)
    }

    @TestCase
    func test_06(): Unit {
        //test the init(size: Int64, initElement: (Int64)->(K,V)) of minus.
        try {
            TreeMap<Int64, Int64>(-5, PreData)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Invalid size of TreeMap"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_07(): Unit {
        //test the init(size: Int64, initElement: (Int64)->(K,V)) of not repeats.
        let cmap = TreeMap<Int64, Int64>(0, PreData)
        @Expect(cmap.size, 0)
        for (i in 0..N) {
            cmap.add(i, i + 1)
        }
        @Expect(cmap.size, N)
    }

    @TestCase
    func test_08(): Unit {
        //test the init(size: Int64, initElement: (Int64)->(K,V)) of not repeats.
        let cmap = TreeMap<Int64, Int64>(0, PreData)
        @Expect(cmap.size, 0)
        for (i in 0..N) {
            cmap.add(1, 1)
        }
        @Expect(cmap.size, 1)
    }
}
