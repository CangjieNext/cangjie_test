/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt  -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.collection.concurrent.*
import std.collection.*
import std.time.*

var sum = 0
let M = 10000
var arrayqueue = Option<ArrayBlockingQueue<Int64>>.None
var arrayqueuestring = Option<ArrayBlockingQueue<String>>.None

@Test
class Test_arrayblockqueue_concurrent_tryenqueue_07 {
    public override func beforeEach(): Unit {
        sum = 0
    }

    public func PreData(N: Int64): Unit {
        let arrayqueue1 = ArrayBlockingQueue<Int64>(10000)
        let jobs = Array<Future<Unit>>(N, repeat: unsafe { zeroValue<Future<Unit>>() })
        for (t in 0..N) {
            jobs[t] = spawn {
                for (i in t..M : N) {
                    arrayqueue1.tryEnqueue(i + 1)
                }
            }
        }
        for (t in 0..N) {
            jobs[t].get()
        }
        arrayqueue = Option<ArrayBlockingQueue<Int64>>.Some(arrayqueue1)
    }

    public func PreDataString(N: Int64): Unit {
        let arrayqueuestring1 = ArrayBlockingQueue<String>(10000)
        let jobs = Array<Future<Unit>>(N, repeat: unsafe { zeroValue<Future<Unit>>() })
        for (t in 0..N) {
            jobs[t] = spawn {
                for (i in t..M : N) {
                    arrayqueuestring1.tryEnqueue("${i + 1}")
                }
            }
        }
        for (t in 0..N) {
            jobs[t].get()
        }
        arrayqueuestring = Option<ArrayBlockingQueue<String>>.Some(arrayqueuestring1)
    }

    @TestCase
    func test_int_concurrent_tryenqueue_01(): Unit {
        let threads = [1, 4, 8, 12, 16, 20, 24, 28, 32]
        for (N in threads) {
            PreData(N)
            @Expect(arrayqueue.getOrThrow().size, M)
        }
    }

    @TestCase
    func test_string_concurrent_tryenqueue_02(): Unit {
        let threads = [1, 4, 8, 12, 16, 20, 24, 28, 32]
        for (N in threads) {
            PreDataString(N)
            @Expect(arrayqueuestring.getOrThrow().size, M)
        }
    }
}
