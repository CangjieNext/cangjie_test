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
let M = 100

@Test
class Test_concurrenthashmap_10 {
    public func PreData(N: Int64): Unit {
        let cmap1 = ConcurrentHashMap<Int64, Int64>()
        let jobs = Array<Future<Unit>>(N, repeat: unsafe { zeroValue<Future<Unit>>() })
        for (t in 0..N) {
            jobs[t] = spawn {
                for (i in t..M : N) {
                    cmap1.put(i, i + 3)
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
        //test the concurrent of put with unexist key.
        let threads = [2, 4, 8, 12, 16, 20, 24, 28, 32, 36]
        for (N in threads) {
            PreData(N)
            let res = Array<Int64>(M, repeat: -1)
            let resArr = Array<Int64>(M, {i => i + 3})
            for ((k, v) in cmap.getOrThrow()) {
                res[k] = v
            }
            @Expect(res, resArr)
            @Expect(res.size, resArr.size)
        }
    }

    @TestCase
    func test_02(): Unit {
        //test the concurrent of put with exist key.
        let threads = [2, 4, 8, 12, 16, 20, 24, 28, 32, 36]
        for (N in threads) {
            PreData(N)
            let jobs = Array<Future<Unit>>(N, repeat: unsafe { zeroValue<Future<Unit>>() })
            for (t in 0..N) {
                jobs[t] = spawn {
                    for (i in t..M : N) {
                        cmap.getOrThrow().put(i, i + 5)
                    }
                }
            }
            for (t in 0..N) {
                jobs[t].get()
            }
            let res = Array<Int64>(M, repeat: -1)
            let resArr = Array<Int64>(M, {i => i + 5})
            for ((k, v) in cmap.getOrThrow()) {
                res[k] = v
            }
            @Expect(res, resArr)
            @Expect(res.size, resArr.size)
        }
    }

    @TestCase
    func test_03(): Unit {
        //test the concurrent of put with exist and unexist key.
        let threads = [2, 4, 8, 12, 16, 20, 24, 28, 32, 36]
        for (N in threads) {
            PreData(N)
            let jobs = Array<Future<Unit>>(N, repeat: unsafe { zeroValue<Future<Unit>>() })
            for (t in 0..N) {
                jobs[t] = spawn {
                    for (i in t..2 * M : N) {
                        cmap.getOrThrow().put(i, i + 5)
                    }
                }
            }
            for (t in 0..N) {
                jobs[t].get()
            }
            let res = Array<Int64>(2 * M, repeat: -1)
            let resArr = Array<Int64>(2 * M, {i => i + 5})
            for ((k, v) in cmap.getOrThrow()) {
                res[k] = v
            }
            @Expect(res, resArr)
            @Expect(res.size, resArr.size)
        }
    }

    @TestCase
    func test_04(): Unit {
        //test the concurrent return value of put with exist key.
        let threads = [2, 4, 8, 12, 16, 20, 24, 28, 32, 36]
        for (N in threads) {
            PreData(N)
            let jobs = Array<Future<Unit>>(N, repeat: unsafe { zeroValue<Future<Unit>>() })
            let sum = AtomicInt64(0)
            for (t in 0..N) {
                jobs[t] = spawn {
                    for (i in t..M : N) {
                        match (cmap.getOrThrow().put(i, i + 5)) {
                            case Some(v) =>
                                if (v == i + 3) {
                                    sum.fetchAdd(1)
                                }
                            case None => ()
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

    @TestCase
    func test_05(): Unit {
        //test the concurrent return value of put with unexist key.
        let threads = [2, 4, 8, 12, 16, 20, 24, 28, 32, 36]
        for (N in threads) {
            PreData(N)
            let jobs = Array<Future<Unit>>(N, repeat: unsafe { zeroValue<Future<Unit>>() })
            let sum = AtomicInt64(0)
            for (t in 0..N) {
                jobs[t] = spawn {
                    for (i in t..M : N) {
                        match (cmap.getOrThrow().put(M + i, M + i + 5)) {
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
