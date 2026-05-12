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
const N: Int64 = 10
const M: Int64 = 2

@Test
class Test_concurrenthashmap_06 {
    public func PreData(): Unit {
        let cmap1 = ConcurrentHashMap<Int64, Int64>()
        for (i in 0..N) {
            cmap1.put(i, i + 1)
        }
        cmap = Option<ConcurrentHashMap<Int64, Int64>>.Some(cmap1)
    }

    @TestCase
    func test_01(): Unit {
        //test the function of replace(key: K, predicate: (V) -> Bool, eval: (V) -> V) using exist key.
        PreData()
        for (j in 0..N) {
            cmap.getOrThrow().replace(j, {v: Int64 => v % 2 == 0}, {j => j - 1})
        }
        let res = Array<Int64>(N, repeat: 0)
        for ((k, v) in cmap.getOrThrow()) {
            res[k] = v
        }
        for (k in 0..N - 1 : M) {
            @Expect(res[k], res[k+1])
        }
    }

    @TestCase
    func test_02(): Unit {
        //test the function of replace(key: K, predicate: (V) -> Bool, eval: (V) -> V) using exist key.
        PreData()
        for (j in 0..N) {
            cmap.getOrThrow().replace(j, {v: Int64 => v % 2 == 0}, {_ => j})
        }
        let res = Array<Int64>(N, repeat: 0)
        for ((k, v) in cmap.getOrThrow()) {
            res[k] = v
        }
        for (k in 0..N - 1 : M) {
            @Expect(res[k], res[k+1])
        }
    }

    @TestCase
    func test_03(): Unit {
        //test the function of replace(key: K, predicate: (V) -> Bool, eval: (V) -> V) using unexist key.
        PreData()
        for (j in N..2 * N) {
            cmap.getOrThrow().replace(j, {v: Int64 => v % 2 == 0}, {j => j - 1})
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
    func test_04(): Unit {
        //test the function of replace(key: K, predicate: (V) -> Bool, eval: (V) -> V) using unexist and exist key.
        PreData()
        for (j in 0..2 * N) {
            cmap.getOrThrow().replace(j, {v: Int64 => v % 2 == 0}, {j => j - 1})
        }
        let res = Array<Int64>(N, repeat: 0)
        let res1 = Array<Int64>(N, repeat: -1)
        let resArr1 = Array<Int64>(N, repeat: -1)

        for ((k, v) in cmap.getOrThrow()) {
            if (k >= N) {
                res1[k] = v
            } else {
                res[k] = v
            }
        }
        for (k in 0..N - 1 : M) {
            @Expect(res[k], res[k+1])
        }
        @Expect(res1, resArr1)
    }

    @TestCase
    func test_05(): Unit {
        //test return value of replace(key: K, predicate: (V) -> Bool, eval: (V) -> V) using same key.      
        PreData()
        for (j in 0..N) {
            if (j % 2 == 0) {
                @Expect(cmap.getOrThrow().replace(j, {v: Int64 => v % 2 == 0}, {j => j - 1}), None)
            } else {
                @Expect(cmap.getOrThrow().replace(j, {v: Int64 => v % 2 == 0}, {j => j - 1}), Some(j+1))
            }
        }
    }

    @TestCase
    func test_06(): Unit {
        //test return value of replace(key: K, predicate: (V) -> Bool, eval: (V) -> V) using same key.      
        PreData()
        for (j in N..2 * N) {
            @Expect(cmap.getOrThrow().replace(j, {v: Int64 => v % 2 == 0}, {j => j - 1}), None)
        }
    }
}
