/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.collection.*
import std.collection.concurrent.*
import std.sync.*
import std.math.*

func getExceptionNum(action: () -> Unit): Int64 {
    try {
        action()
    } catch (e: Exception) {
        return 1
    }
    return 0
}

class A {
    public A() {}
}

struct B {
    public B(let a: Int64, let b: String) {}
}

let threads = [1, 2, 4, 8, 16, 32]

@Test
class BlockingQueueTest {
    @TestCase
    func testInitBlockingQueue(): Unit {
        var bq1 = BlockingQueue<Int64>()
        @Expect(bq1.size, 0)
        @Expect(bq1.capacity, Int64.Max)
        @Expect(bq1.head(), None)

        var bq2 = BlockingQueue<Int64>(10)
        @Expect(bq2.size, 0)
        @Expect(bq2.capacity, 10)

        let arr1 = Array<Int64>(10, {i => i + 10})
        let arr2 = ArrayList<Int64>([10, 11, 12, 13, 14])
        var bq3 = BlockingQueue(100, arr1)
        var bq4 = BlockingQueue(100, arr2)

        @Expect(bq3.size, 10)
        @Expect(bq3.capacity, 100)
        @Expect(bq3.head(), bq4.head())

        let arr3 = Array<String>()
        var bq5 = ArrayBlockingQueue<String>(1, arr3)
        @Expect(bq5.size, 0)
        @Expect(bq5.capacity, 1)
        @Expect(getExceptionNum({ => var bq = BlockingQueue<A>(2048)}), 0)
        @Expect(getExceptionNum({ => var bq = BlockingQueue<B>(2048)}), 0)
    }

    @TestCase
    func testInitBlockingQueueInvalid(): Unit {
        let arr1 = Array<Int64>(10, {i => i + 10})
        let arr2 = ArrayList<Int64>([10, 11, 12, 13, 14])

        var exceptionNum = 0
        exceptionNum += getExceptionNum({=> var bq = BlockingQueue<Int64>(-1)})
        exceptionNum += getExceptionNum({=> var bq = BlockingQueue<Int64>(0)})
        exceptionNum += getExceptionNum({=> var bq = BlockingQueue<Int64>(-1, arr1)})
        exceptionNum += getExceptionNum({=> var bq = BlockingQueue<Int64>(0, arr1)})
        exceptionNum += getExceptionNum({=> var bq = BlockingQueue<Int64>(9, arr1)})
        exceptionNum += getExceptionNum({=> var bq = BlockingQueue<Int64>(-1, arr2)})
        exceptionNum += getExceptionNum({=> var bq = BlockingQueue<Int64>(0, arr2)})
        exceptionNum += getExceptionNum({=> var bq = BlockingQueue<Int64>(4, arr2)})
        @Expect(exceptionNum, 8)
    }

    @TestCase
    func testInitArrayBlockingQueue(): Unit {
        let arr1 = Array<Int64>(10, {i => i})
        var bq1 = ArrayBlockingQueue<Int64>(10, arr1)
        @Expect(bq1.size, arr1.size)
        @Expect(bq1.capacity, 10)

        let arr2 = ArrayList<Float64>([0.0])
        var bq2 = ArrayBlockingQueue<Float64>(1, arr2)
        @Expect(bq2.size, arr2.size)
        @Expect(bq2.capacity, bq2.size)

        let arr3 = Array<String>()
        var bq3 = ArrayBlockingQueue<String>(1, arr3)
        @Expect(bq3.size, 0)
        @Expect(bq3.capacity, 1)

        var bq4 = ArrayBlockingQueue<String>(1)
        @Expect(bq4.size, 0)
        @Expect(bq4.capacity, 1)

        var bq5 = ArrayBlockingQueue<Int64>(10000)
        @Expect(bq5.size, 0)
        @Expect(bq5.capacity, 10000)

        let arr4 = ArrayList<Int64>([0, 1, 2, 3, 4])
        var bq6 = ArrayBlockingQueue<Int64>(10000, arr4)
        @Expect(bq1.head(), bq6.head())
        @Expect(getExceptionNum({ => var bq = ArrayBlockingQueue<A>(2048)}), 0)
        @Expect(getExceptionNum({ => var bq = ArrayBlockingQueue<B>(2048)}), 0)
    }

    @TestCase
    func testInitArrayBlockingQueueInvalid(): Unit {
        var exceptionNum = 0
        let arr1 = Array<Int64>(10, {i => i})
        let arr2 = Array<Int64>()
        exceptionNum += getExceptionNum({=> var bq = ArrayBlockingQueue<Int64>(0)})
        exceptionNum += getExceptionNum({=> var bq = ArrayBlockingQueue<Int64>(-1)})
        exceptionNum += getExceptionNum({=> var bq = ArrayBlockingQueue<Int64>(0, arr1)})
        exceptionNum += getExceptionNum({=> var bq = ArrayBlockingQueue<Int64>(-1, arr1)})
        exceptionNum += getExceptionNum({=> var bq = ArrayBlockingQueue<Int64>(9, arr1)})
        exceptionNum += getExceptionNum({=> var bq = ArrayBlockingQueue<Int64>(0, arr2)})
        @Expect(exceptionNum, 6)
    }

    @TestCase
    func testHead(): Unit {
        let M = 128
        let duration = Duration.nanosecond
        for (N in threads) {
            let bq = ArrayBlockingQueue<Int64>(1000)
            let bq2 = BlockingQueue<Int64>(1000)
            let jobs = Array<Future<Unit>>(N, repeat: unsafe { zeroValue<Future<Unit>>() })
            for (t in 0..N) {
                jobs[t] = spawn {
                    for (i in t..M : N) {
                        bq.enqueue(i)
                        bq2.enqueue(i)
                    }
                }
            }

            for (t in 0..N) {
                jobs[t].get()
            }

            @Expect(bq.head().getOrThrow() < N, true)
            @Expect(bq2.head().getOrThrow() < N, true)
        }
    }

    // 如果一次执行出/入队的次数大于capacity, 会阻塞住
    @TestCase
    func testEnqDeq(): Unit {
        let M = 128
        for (N in threads) {
            let bq = ArrayBlockingQueue<Int64>(1000)
            let bq2 = BlockingQueue<Int64>()
            let jobs = Array<Future<Unit>>(N, repeat: unsafe { zeroValue<Future<Unit>>() })
            for (t in 0..N) {
                jobs[t] = spawn {
                    for (i in t..M : N) {
                        bq.enqueue(i)
                        bq2.enqueue(i)
                    }
                }
            }

            for (t in 0..N) {
                jobs[t].get()
            }

            @Expect(bq.size, M)
            @Expect(bq2.capacity, Int64.Max)
            @Expect(bq2.size, M)

            let job = spawn {
                for (i in 0..M) {
                    bq.dequeue()
                    bq2.dequeue()
                }
            }

            job.get()

            @Expect(bq.size, 0)
            @Expect(bq2.size, 0)
        }
    }

    // 如果一次执行出/入队的次数大于capacity, 会阻塞住
    @TestCase
    func testEnqDeqBlocked(): Unit {
        let M = 128
        for (N in threads) {
            let bq = ArrayBlockingQueue<Int64>(1000)
            let bq2 = BlockingQueue<Int64>()
            let jobs = Array<Future<Unit>>(N, repeat: unsafe { zeroValue<Future<Unit>>() })
            for (t in 0..N) {
                jobs[t] = spawn {
                    for (i in t..M : N) {
                        bq.enqueue(i)
                        bq2.enqueue(i)
                    }
                }
            }

            let job = spawn {
                for (i in 0..M) {
                    bq.dequeue()
                    bq2.dequeue()
                }
            }

            for (t in 0..N) {
                jobs[t].get()
            }

            job.get()

            @Expect(bq.size, 0)
            @Expect(bq2.size, 0)
        }
    }

    // 验证这种场景指定timeout能否成功执行。如果不指定, 会一直阻塞
    @TestCase
    func testEnqDeqWithTimeOut(): Unit {
        let M = 128
        let duration = Duration.nanosecond
        for (N in threads) {
            let bq = ArrayBlockingQueue<Int64>(10)
            let bq2 = BlockingQueue<Int64>(10)
            let jobs = Array<Future<Unit>>(N, repeat: unsafe { zeroValue<Future<Unit>>() })
            for (t in 0..N) {
                jobs[t] = spawn {
                    for (i in t..M : N) {
                        bq.enqueue(i, duration)
                        bq2.enqueue(i, duration)
                    }
                }
            }

            for (t in 0..N) {
                jobs[t].get()
            }

            @Expect(bq.size, 10)
            @Expect(bq.enqueue(M, duration), false)
            @Expect(bq2.size, 10)
            @Expect(bq2.enqueue(M, duration), false)

            for (t in 0..N) {
                jobs[t] = spawn {
                    for (i in t..M : N) {
                        bq.dequeue(duration)
                        bq2.dequeue(duration)
                    }
                }
            }

            for (t in 0..N) {
                jobs[t].get()
            }

            @Expect(bq.size, 0)
            @Expect(bq.dequeue(duration), None)
            @Expect(bq2.size, 0)
            @Expect(bq2.dequeue(duration), None)
        }
    }

    // 该场景测试非阻塞的入队出队操作。如果是enqueue或者dequeue会一直阻塞
    @TestCase
    func testTryEnqDeq(): Unit {
        let M = 128
        for (N in threads) {
            let bq = ArrayBlockingQueue<Int64>(10)
            let bq2 = BlockingQueue<Int64>(10)
            let jobs = Array<Future<Unit>>(N, repeat: unsafe { zeroValue<Future<Unit>>() })
            for (t in 0..N) {
                jobs[t] = spawn {
                    for (i in t..M : N) {
                        bq.tryEnqueue(i)
                        bq2.tryEnqueue(i)
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
                        bq.tryDequeue()
                        bq2.tryDequeue()
                    }
                }
            }

            for (t in 0..N) {
                jobs[t].get()
            }

            @Expect(bq.size, 0)
            @Expect(bq.tryDequeue(), None)
            @Expect(bq2.size, 0)
            @Expect(bq2.tryDequeue(), None)
        }
    }
}
