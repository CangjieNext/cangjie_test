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

import std.collection.concurrent.*
import std.collection.*
import std.sync.*
import std.math.*

var cmap = Option<ConcurrentHashMap<Int64, Int64>>.None
const N: Int64 = 100
var sum = 0

@Test
class Test_concurrenthashmap_19 {
    public override func beforeEach(): Unit {
        sum = 0
    }

    public func PreData(a: Int64): (Int64, Int64) {
        let x: (Int64, Int64) = (a, a + 1)
        return x
    }
    @TestCase
    func test_01(): Unit {
        let arr = Array<(Int64, Int64)>()
        let cmap = ConcurrentHashMap<Int64, Int64>(arr, concurrencyLevel: 0)
        for (i in 0..N) {
            cmap.put(i, i + 1)
        }
        let res = Array<Int64>(N, repeat: 0)
        let resArr = Array<Int64>(N, {i => i + 1})
        for ((k, v) in cmap) {
            res[k] = v
        }
        @Expect(res, resArr)
        @Expect(res.size, resArr.size)
        @Expect(cmap.size, N)
        @Expect(cmap.isEmpty(), false)
    }

    @TestCase
    func test_02(): Unit {
        let arr = Array<(Int64, Int64)>(N, {i => (i, i + 5)})
        let cmap = ConcurrentHashMap<Int64, Int64>(arr, concurrencyLevel: 100000)
        for (i in 0..N) {
            cmap.put(i, i + 1)
        }
        let res = Array<Int64>(N, repeat: 0)
        let resArr = Array<Int64>(N, {i => i + 1})
        for ((k, v) in cmap) {
            res[k] = v
        }
        @Expect(res, resArr)
        @Expect(res.size, resArr.size)
        @Expect(cmap.size, N)
        @Expect(cmap.isEmpty(), false)
    }

    @TestCase
    func test_03(): Unit {
        try {
            ConcurrentHashMap<Int64, Int64>(-2, concurrencyLevel: Int64.Max)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Invalid size of Concurrent HashMap"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_04(): Unit {
        let cmap = ConcurrentHashMap<Int64, Int64>(0, concurrencyLevel: -100)
        for (i in 0..N) {
            cmap.put(i, i + 1)
        }
        let res = Array<Int64>(N, repeat: 0)
        let resArr = Array<Int64>(N, {i => i + 1})
        for ((k, v) in cmap) {
            res[k] = v
        }
        @Expect(res, resArr)
        @Expect(res.size, resArr.size)
        @Expect(cmap.size, N)
        @Expect(cmap.isEmpty(), false)
    }

    @TestCase
    func test_05(): Unit {
        let cmap = ConcurrentHashMap<Int64, Int64>(10000, concurrencyLevel: 100000)
        for (i in 0..N) {
            cmap.put(i, i + 1)
        }
        let res = Array<Int64>(N, repeat: 0)
        let resArr = Array<Int64>(N, {i => i + 1})
        for ((k, v) in cmap) {
            res[k] = v
        }
        @Expect(res, resArr)
        @Expect(res.size, resArr.size)
        @Expect(cmap.size, N)
        @Expect(cmap.isEmpty(), false)
    }

    @TestCase
    func test_06(): Unit {
        let cmap = ConcurrentHashMap<Int64, Int64>(10000)
        for (i in 0..N) {
            cmap.put(i, i + 1)
        }
        let res = Array<Int64>(N, repeat: 0)
        let resArr = Array<Int64>(N, {i => i + 1})
        for ((k, v) in cmap) {
            res[k] = v
        }
        @Expect(res, resArr)
        @Expect(res.size, resArr.size)
        @Expect(cmap.size, N)
        @Expect(cmap.isEmpty(), false)
    }

    @TestCase
    func test_07(): Unit {
        try {
            ConcurrentHashMap<Int64, Int64>(-1, PreData)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Invalid size of Concurrent HashMap"))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_08(): Unit {
        let cmap = ConcurrentHashMap<Int64, Int64>(0, PreData)
        for (i in 0..N) {
            cmap.put(i, i + 1)
        }
        let res = Array<Int64>(N, repeat: 0)
        let resArr = Array<Int64>(N, {i => i + 1})
        for ((k, v) in cmap) {
            res[k] = v
        }
        @Expect(res, resArr)
        @Expect(res.size, resArr.size)
        @Expect(cmap.size, N)
        @Expect(cmap.isEmpty(), false)
    }

    @TestCase
    func test_09(): Unit {
        let cmap = ConcurrentHashMap<Int64, Int64>(20, PreData)
        for (i in 0..N) {
            cmap.put(i, i + 1)
        }
        let res = Array<Int64>(N, repeat: 0)
        let resArr = Array<Int64>(N, {i => i + 1})
        for ((k, v) in cmap) {
            res[k] = v
        }
        @Expect(res, resArr)
        @Expect(res.size, resArr.size)
        @Expect(cmap.size, N)
        @Expect(cmap.isEmpty(), false)
    }

    @TestCase
    func test_10(): Unit {
        let cmap = ConcurrentHashMap<Int64, Int64>(HashMap<Int64, Int64>())
        for (i in 0..N) {
            cmap.put(i, i + 1)
        }
        let res = Array<Int64>(N, repeat: 0)
        let resArr = Array<Int64>(N, {i => i + 1})
        for ((k, v) in cmap) {
            res[k] = v
        }
        @Expect(res, resArr)
        @Expect(res.size, resArr.size)
        @Expect(cmap.size, N)
        @Expect(cmap.isEmpty(), false)
    }
}
