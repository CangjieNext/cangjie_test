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

let threads = [1, 2, 4, 8, 16, 32]

class A {
    public A() {}
}

struct B {
    public B(let a: Int64, let b: String) {}
}

@Test
class NonBlockingQueueTest {
    @TestCase
    func testOperateNonBlockingQueue(): Unit {
        var nbq = NonBlockingQueue<Int64>()
        @Expect(nbq.size, 0)
        @Expect(nbq.peek(), None)
        @Expect(nbq.remove(), None)
        for (i in 0..10000) {
            nbq.add(i)
        }
        @Expect(nbq.size, 10000)
        @Expect(nbq.peek(), 0)
        var tmp = 9999
        var flag = true
        for (i in 0..10000 : 1) {
            if (nbq.remove() != Some(i)) {
                flag = false
                break
            }
        }
        @Expect(flag, true)
    }

    @TestCase
    func testAdd(): Unit {
        for (N in threads) {
            let nbq = NonBlockingQueue<Int64>()
            let jobs = Array<Future<Unit>>(N, repeat: unsafe { zeroValue<Future<Unit>>() })
            let M = 128
            for (t in 0..N) {
                jobs[t] = spawn {
                    for (i in t..M : N) {
                        nbq.add(i)
                    }
                }
            }

            for (t in 0..N) {
                jobs[t].get()
            }

            @Expect(nbq.size, M)
            @Expect(nbq.peek().getOrThrow() < N, true)
        }
    }

    @TestCase
    func testRemove(): Unit {
        for (N in threads) {
            let M: Int64 = 128
            let nbq = NonBlockingQueue<Int64>()
            for (i in 0..M) {
                nbq.add(i)
            }
            let jobs = Array<Future<Unit>>(N, repeat: unsafe { zeroValue<Future<Unit>>() })
            for (t in 0..N) {
                jobs[t] = spawn {
                    for (i in t..M : N) {
                        nbq.remove()
                    }
                }
            }

            for (t in 0..N) {
                jobs[t].get()
            }

            @Expect(nbq.size, 0)
        }
    }

    @TestCase
    func testIter(): Unit {
        let nbq = NonBlockingQueue<Int64>()
        let szs = [127, 128, 129, 255, 256, 258]
        for (sz in szs) {
            for (i in 0..sz) {
                nbq.add(i)
            }

            var i = 0
            for (elem in nbq) {
                @Expect(elem, i)
                i++
            }
            @Expect(i, sz)

            for (i in 0..sz) {
                let elem = nbq.remove()
                @Expect(elem, i)
            }

            for (elem in nbq) {
                @Expect(1, 2) // nbq is empty now
            }
        }
    }

    @TestCase
    func testToArray(): Unit {
        let szs = [127, 128, 129, 255, 256, 258]
        for (sz in szs) {
            let arr = Array<Int64>(sz, {i => i})
            let nbq = NonBlockingQueue<Int64>()
            for (i in 0..sz) {
                nbq.add(i)
            }
            @Expect(nbq.toArray(), arr)
        }
    }

    @TestCase
    func testIterConcurrent(): Unit {
        let queue = NonBlockingQueue<Int64>()
        for (i in 1..1000) {
            queue.add(i)
        }
        spawn {
            for (i in 1001..10000) {
                queue.add(i)
            }
        }
        spawn {
            for (i in 1..10000) {
                while (queue.remove().isNone()) {}
            }
        }
        let f = spawn {
            var prev = 1
            for (e in queue) {
                @Expect(prev <= e)
                prev = e
            }
        }
        f.get()
    }
}
