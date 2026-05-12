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

const N: Int64 = 100
var sum = 0

@Test
class Test_treeset_init_01 {
    public func PreData(a: Int64): Int64 {
        let x: Int64 = a
        return x
    }
    public override func beforeEach(): Unit {
        sum = 0
    }
    @TestCase
    func test_01(): Unit {
        // test the init() and query the size.
        let cmap = TreeSet<Int64>()
        @Expect(cmap.size, 0)
        for (i in 0..N) {
            cmap.add(i)
        }
        @Expect(cmap.size, N)
        let resArr = Array<Int64>(N, {i => i})
        @Expect(cmap.toArray(), resArr)
    }

    @TestCase
    func test_02(): Unit {
        //test the init(elements: Collection<T>) and query the size with not repeats.
        let cmap = TreeSet<Int64>(HashSet<Int64>())
        @Expect(cmap.size, 0)
        let collect = HashSet<Int64>(Array<Int64>(N, {i => i}))
        let cmap1 = TreeSet<Int64>(collect)
        @Expect(cmap1.size, N)
        let resArr = Array<Int64>(N, {i => i})
        @Expect(cmap1.toArray(), resArr)
    }

    @TestCase
    func test_03(): Unit {
        //test the init(elements: Collection<T>) and query the size with repeats.
        let cmap = TreeSet<Int64>(HashSet<Int64>())
        @Expect(cmap.size, 0)
        let arr = Array<Int64>(N, {i => 1})
        let collect = HashSet<Int64>(arr)
        let cmap1 = TreeSet<Int64>(collect)
        @Expect(cmap1.size, 1)
        @Expect(cmap1.toArray()[0], 1)
    }

    @TestCase
    func test_04(): Unit {
        //test the of(elements: Array<T>) and query the size with not repeats.
        let cmap = TreeSet<Int64>(HashSet<Int64>())
        @Expect(cmap.size, 0)
        let arr = Array<Int64>(N, {i => i + 5})
        let cmap1 = TreeSet.of(arr)
        @Expect(cmap1.size, N)
        let resArr = Array<Int64>(N, {i => i + 5})
        @Expect(cmap1.toArray(), resArr)
    }

    @TestCase
    func test_05(): Unit {
        //test the of(elements: Array<T>) and query the size with repeats.
        let cmap = TreeSet<Int64>(HashSet<Int64>())
        @Expect(cmap.size, 0)
        let arr = Array<Int64>(N, {i => 1})
        let cmap1 = TreeSet.of(arr)
        @Expect(cmap1.size, 1)
    }

    @TestCase
    func test_06(): Unit {
        //test the init(size: Int64, initElement: (Int64)->T) of minus.
        try {
            TreeSet<Int64>(-5, PreData)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Invalid size of TreeSet"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_07(): Unit {
        //test the init(size: Int64, initElement: (Int64)->T) of not repeats.
        let cmap = TreeSet<Int64>(0, PreData)
        @Expect(cmap.size, 0)
        for (i in 0..N) {
            cmap.add(i)
        }
        @Expect(cmap.size, N)
    }

    @TestCase
    func test_08(): Unit {
        //test the init(size: Int64, initElement: (Int64)->T) of not repeats.
        let cmap = TreeSet<Int64>(0, PreData)
        @Expect(cmap.size, 0)
        for (i in 0..N) {
            cmap.add(1)
        }
        @Expect(cmap.size, 1)
    }
}
