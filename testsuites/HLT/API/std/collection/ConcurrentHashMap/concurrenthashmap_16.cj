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
import std.sync.*

var cmap = Option<ConcurrentHashMap<Int64, Int64>>.None
let M = 512

@Test
class Test_concurrenthashmap_16 {
    public func PreData(N: Int64): Unit {
        let cmap1 = ConcurrentHashMap<Int64, Int64>()
        let jobs = Array<Future<Unit>>(N, repeat: unsafe { zeroValue<Future<Unit>>() })
        for (t in 0..N) {
            jobs[t] = spawn {
                for (i in t..M : N) {
                    cmap1.put(i, i + 1)
                }
            }
        }
        for (t in 0..N) {
            jobs[t].get()
        }
        cmap = Option<ConcurrentHashMap<Int64, Int64>>.Some(cmap1)
    }

    @TestCase
    func test_01(): Unit {
        //test the concurrent of replace(key: K, predicate: (V) -> Bool, eval: (V) -> V) with exist key.
        let threads = [2, 4, 8, 12, 16, 20, 24, 28, 32, 36]
        for (N in threads) {
            PreData(N)
            let jobs = Array<Future<Unit>>(N, repeat: unsafe { zeroValue<Future<Unit>>() })
            for (t in 0..N) {
                jobs[t] = spawn {
                    for (i in t..M : N) {
                        cmap.getOrThrow().replace(i, {v: Int64 => v % 2 == 0}, {i => i - 1})
                    }
                }
            }
            for (t in 0..N) {
                jobs[t].get()
            }
            let res = Array<Int64>(M, repeat: -1)
            for ((k, v) in cmap.getOrThrow()) {
                res[k] = v
            }
            for (k in 0..M - 1 : N) {
                @Expect(res[k], res[k+1])
            }
        }
    }

    @TestCase
    func test_02(): Unit {
        //test the concurrent of replace(key: K, predicate: (V) -> Bool, eval: (V) -> V) with exist key.
        let threads = [2, 4, 8, 12, 16, 20, 24, 28, 32, 36]
        for (N in threads) {
            PreData(N)
            let jobs = Array<Future<Unit>>(N, repeat: unsafe { zeroValue<Future<Unit>>() })
            for (t in 0..N) {
                jobs[t] = spawn {
                    for (i in t..M : N) {
                        cmap.getOrThrow().replace(i, {v: Int64 => v % 2 == 0}, {_ => i})
                    }
                }
            }
            for (t in 0..N) {
                jobs[t].get()
            }
            let res = Array<Int64>(M, repeat: -1)
            for ((k, v) in cmap.getOrThrow()) {
                res[k] = v
            }
            for (k in 0..M - 1 : N) {
                @Expect(res[k], res[k+1])
            }
        }
    }

    @TestCase
    func test_03(): Unit {
        //test the concurrent of replace(key: K, predicate: (V) -> Bool, eval: (V) -> V) with unexist key.
        let threads = [2, 4, 8, 12, 16, 20, 24, 28, 32, 36]
        for (N in threads) {
            PreData(N)
            let jobs = Array<Future<Unit>>(N, repeat: unsafe { zeroValue<Future<Unit>>() })
            for (t in 0..N) {
                jobs[t] = spawn {
                    for (i in t..M : N) {
                        cmap.getOrThrow().replace(M + i, {v: Int64 => v % 2 == 0}, {i => M + i + 5})
                    }
                }
            }
            for (t in 0..N) {
                jobs[t].get()
            }
            let res = Array<Int64>(M, repeat: -1)
            let res1 = Array<Int64>(M, repeat: 0)
            let resArr = Array<Int64>(M, {i => i + 1})
            let resArr1 = Array<Int64>(M, repeat: 0)
            for ((k, v) in cmap.getOrThrow()) {
                if (k <= M - 1) {
                    res[k] = v
                } else {
                    res1[k - M] = v
                }
            }
            @Expect(res, resArr)
            @Expect(res1, resArr1)
            @Expect(res.size, resArr.size)
            @Expect(res1.size, resArr1.size)
        }
    }

    @TestCase
    func test_04(): Unit {
        //test the concurrent return value of replace(key: K, predicate: (V) -> Bool, eval: (V) -> V) with exist key.
        let threads = [2, 4, 8, 12, 16, 20, 24, 28, 32, 36]
        for (N in threads) {
            PreData(N)
            let jobs = Array<Future<Unit>>(N, repeat: unsafe { zeroValue<Future<Unit>>() })
            let sum = AtomicInt64(0)
            let sum1 = AtomicInt64(0)
            for (t in 0..N) {
                jobs[t] = spawn {
                    for (i in t..2 * M : N) {
                        match (cmap.getOrThrow().replace(i, {v: Int64 => v % 2 == 0}, {i => i - 1})) {
                            case Some(v) =>
                                if (v == i + 1) {
                                    sum.fetchAdd(1)
                                }
                            case None => sum1.fetchAdd(1)
                        }
                    }
                }
            }
            for (t in 0..N) {
                jobs[t].get()
            }
            @Expect(sum.load(), M / 2)
            @Expect(sum1.load(), M * 3 / 2)
        }
    }

    @TestCase
    func test_05(): Unit {
        //test the concurrent return value of replace(key: K, predicate: (V) -> Bool, eval: (V) -> V) with unexist key.
        let threads = [2, 4, 8, 12, 16, 20, 24, 28, 32, 36]
        for (N in threads) {
            PreData(N)
            let jobs = Array<Future<Unit>>(N, repeat: unsafe { zeroValue<Future<Unit>>() })
            let sum = AtomicInt64(0)
            for (t in 0..N) {
                jobs[t] = spawn {
                    for (i in t..M : N) {
                        match (cmap.getOrThrow().replace(M + i, {v: Int64 => v % 2 == 0}, {i => M + i - 1})) {
                            case Some(v) => ()
                            case None => sum.fetchAdd(1)
                        }
                    }
                }
            }
            for (t in 0..N) {
                jobs[t].get()
            }
            @Expect(sum.load(), M)
        }
    }
}
