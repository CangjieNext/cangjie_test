/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output --test
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*
import std.collection.concurrent.*
import std.sync.*
import std.math.*

let threads = [1, 2, 4, 8, 16, 32]

@Test
class Test_LinkedBlockingQueue {
    @TestCase
    func initLinkedBlockingQueue() {
        var bq1 = LinkedBlockingQueue<Int64>()
        @Expect(bq1.capacity,Int64.Max)
        @Expect(bq1.size, 0)
        @Expect(bq1.peek(), None)

        var bq2 = LinkedBlockingQueue<Int64>(10)
        @Expect(bq2.size, 0)
        @Expect(bq2.capacity, 10)

        let arr1 = Array<Int64>(10, {i => i + 10})
        let arr2 = ArrayList<Int64>([10, 11, 12, 13, 14])
        var bq3 = LinkedBlockingQueue<Int64>(10)
        var bq4 = LinkedBlockingQueue<Int64>(5)

        for (i in arr1) {
            bq3.add(i)
        }
        for (i in arr2) {
            bq4.add(i)
        }
    }

    @TestCase
    func removeLinkedBlockingQueue() {
        let arr1 = Array<Int64>(10, {i => i + 10})
        var bq1 = LinkedBlockingQueue<Int64>(10)

        for (i in arr1) {
            bq1.add(i)
        }
        @Expect(bq1.remove(), 10)

        for (size in [1, 5, 9, 50]) {
            let queue = LinkedBlockingQueue<Int64>(size)
            for (i in 0..size) {
                @Expect(queue.add(i, Duration.millisecond), true)
            }

            @Expect(queue.add(size, Duration.millisecond), false)
            for (i in 0..size) {
                @Expect(queue.remove(Duration.millisecond).getOrThrow(), i)
            }
            @Expect(queue.remove(Duration.millisecond), None)
        }
    }

    @TestCase
    func tryRemoveLinkedBlockingQueue(): Unit {
        let queue = LinkedBlockingQueue<Int64>(1)
        @Expect( queue.tryRemove(), None)

        let arr1 = Array<Int64>(10, {i => i + 10})
        var bq1 = LinkedBlockingQueue<Int64>(100)
        for (i in arr1) {
            bq1.add(i)
        }
        @Expect( bq1.tryRemove().getOrThrow(), 10)
    }

    @TestCase
    func tryAddLinkedBlockingQueue(): Unit {
        let M = 128
        for (N in threads) {
            let bq = ArrayBlockingQueue<Int64>(10)
            let bq2 = LinkedBlockingQueue<Int64>(10)
            let jobs = Array<Future<Unit>>(N, repeat: unsafe { zeroValue<Future<Unit>>() })
            for (t in 0..N) {
                jobs[t] = spawn {
                    for (i in t..M : N) {
                        bq.tryAdd(i)
                        bq2.tryAdd(i)
                    }
                }
            }

            for (t in 0..N) {
                jobs[t].get()
            }

            @Expect(bq.size, 10)
            @Expect(bq.tryEnqueue(M), false)
            @Expect(bq2.size, 10)
            @Expect(bq2.tryEnqueue(M), false)

            for (t in 0..N) {
                jobs[t] = spawn {
                    for (i in t..M : N) {
                        bq.tryRemove()
                        bq2.tryRemove()
                    }
                }
            }

            for (t in 0..N) {
                jobs[t].get()
            }

            @Expect(bq.size, 0)
            @Expect(bq.tryRemove(), None)
            @Expect(bq2.size, 0)
            @Expect(bq2.tryRemove(), None)
        }
    }
}
