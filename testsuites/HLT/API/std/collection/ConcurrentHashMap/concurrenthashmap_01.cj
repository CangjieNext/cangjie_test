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

var cmap = Option<ConcurrentHashMap<Int64, Int64>>.None
const N: Int64 = 100

@Test
class Test_concurrenthashmap_01 {
    public func PreData(): Unit {
        let cmap1 = ConcurrentHashMap<Int64, Int64>()
        for (i in 0..N) {
            cmap1.put(i, i + 1)
        }
        cmap = Option<ConcurrentHashMap<Int64, Int64>>.Some(cmap1)
    }
    @TestCase
    func test_01(): Unit {
        //put the data and then compare the size and the value.
        PreData()
        let res = Array<Int64>(N, repeat: 0)
        let resArr = Array<Int64>(N, {i => i + 1})
        for ((k, v) in cmap.getOrThrow()) {
            res[k] = v
        }
        @Expect(res, resArr)
        @Expect(res.size, resArr.size)
        @Expect(cmap.getOrThrow().size, N)
        @Expect(cmap.getOrThrow().isEmpty(), false)
    }

    @TestCase
    func test_02(): Unit {
        //put the data and then test the function of put using exist key.
        PreData()
        for (i in 0..N) {
            cmap.getOrThrow().put(i, i + 2)
        }
        let res = Array<Int64>(N, repeat: 0)
        let resArr = Array<Int64>(N, {i => i + 2})
        for ((k, v) in cmap.getOrThrow()) {
            res[k] = v
        }
        @Expect(res, resArr)
        @Expect(res.size, resArr.size)
    }

    @TestCase
    func test_03(): Unit {
        //put the data and then test the function of put using unexist key.
        PreData()
        for (i in 0..N) {
            cmap.getOrThrow().put(N + i, N + i + 1)
        }
        let res = Array<Int64>(2 * N, repeat: 0)
        let resArr = Array<Int64>(2 * N, {i => i + 1})
        for ((k, v) in cmap.getOrThrow()) {
            res[k] = v
        }
        @Expect(res, resArr)
        @Expect(res.size, resArr.size)
    }

    @TestCase
    func test_04(): Unit {
        //test return value of put using exist key.
        PreData()
        for (i in 0..N) {
            @Expect(cmap.getOrThrow().put(i, i+2), Some(i+1))
        }
    }

    @TestCase
    func test_05(): Unit {
        //test return value of put using unexist key.
        PreData()
        for (i in 0..N) {
            @Expect(cmap.getOrThrow().put(N+i, N+i+1), None)
        }
    }

    @TestCase
    func test_06(): Unit {
        //put the data and then test the function of addIfAbsent using exist key.
        PreData()
        for (i in 0..N) {
            cmap.getOrThrow().putIfAbsent(i, i + 2)
        }
        let res = Array<Int64>(N, repeat: 0)
        let resArr = Array<Int64>(N, {i => i + 1})
        for ((k, v) in cmap.getOrThrow()) {
            res[k] = v
        }
        @Expect(res, resArr)
        @Expect(res.size, resArr.size)
    }

    @TestCase
    func test_07(): Unit {
        //put the data and then test the function of addIfAbsent using unexist key.
        PreData()
        for (i in 0..N) {
            cmap.getOrThrow().putIfAbsent(N + i, N + i + 1)
        }
        let res = Array<Int64>(2 * N, repeat: 0)
        let resArr = Array<Int64>(2 * N, {i => i + 1})
        for ((k, v) in cmap.getOrThrow()) {
            res[k] = v
        }
        @Expect(res, resArr)
        @Expect(res.size, resArr.size)
    }

    @TestCase
    func test_08(): Unit {
        //test return value of addIfAbsent using exist key.
        PreData()
        for (i in 0..N) {
            @Expect(cmap.getOrThrow().putIfAbsent(i, i+2), Some(i+1))
        }
    }

    @TestCase
    func test_09(): Unit {
        //test return value of addIfAbsent using unexist key.
        PreData()
        for (i in 0..N) {
            @Expect(cmap.getOrThrow().putIfAbsent(N+i, N+i+1), None)
        }
    }
}
