/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f --test
// EXEC: %run %run_opt %n.%suffix %run_args

import std.collection.{ArrayList, ArrayQueue}
import std.random.*

@Test
class Test_Queue {
    @TestCase
    func test_init(): Unit {
        var que = ArrayQueue<Int64>()
        @Assert(que.isEmpty(),true)
        @Assert(que.size == 0,true)
        @Assert(que.capacity ,8)

        let que2 = ArrayQueue<Int64>(100)
        @Assert(que2.isEmpty(),true)
        @Assert(que2.size==0)
        @Assert(que2.capacity ,100)
    }

    @TestCase
    func testAdd(): Unit {
        let deque = ArrayQueue<Int64>()
        deque.add(100)
        @Assert(deque.size == 1)
        @Assert(deque.capacity ,8)
        deque.add(200)
        @Assert(deque.size == 2)
        @Assert(deque.capacity ,8)
        @Expect(deque.toArray(), [100, 200])
        let deque2 = ArrayQueue<Int64>()
        for (i in 0..100) {
            deque2.add(i)
        }
        @Expect(deque2.toArray(), Array<Int64>(100){i => i} )
    }

    @TestCase
    func testRemove(): Unit {
        var deque = ArrayQueue<Int64>()
        deque.add(100)
        deque.add(200)
        deque.add(300)

        @Assert(deque.remove(),100)
        @Assert(deque.size==2)
        @Expect(deque.toArray(), [200, 300])
        @Assert(deque.remove(),200)
        @Assert(deque.size==1)
        @Expect(deque.toArray(), [300])
        @Assert(deque.remove(),300)
        @Assert(deque.size==0)

        @Assert(deque.remove(), Option<Int64>.None)

        let deque2 = ArrayQueue<Int64>()
        for (i in 0..100) {
            deque2.add(i)
        }

        for (i in 0..100) {
            @Assert(deque2.peek(), i)
            @Assert(deque2.remove(), i)
            @Assert(deque2.size, 99 - i)
        }
    }

    @TestCase
    func testClear(): Unit {
        var deque = ArrayQueue<Int64>()
        deque.add(100)
        deque.add(200)
        deque.add(300)
        @Assert(deque.size, 3)

        deque.clear()
        @Assert(deque.size, 0)

        @Assert(deque.remove(), Option<Int64>.None)
    }

    @TestCase
    func testReserve(): Unit {
        var deque = ArrayQueue<Int64>()
        deque.reserve(100)
        @Assert(deque.capacity -  deque.size >= 100)
    }

    @TestCase
    func testIterator(): Unit {
        var deque = ArrayQueue<Int64>()
        for (i in 0..50) {
            deque.add(i)
        }

        let it = deque.iterator()
        var i = 0
        while (let Some(num) <- it.next()) {
            @Assert(num, i)
            i++
        }
        @Assert(i, 50)

        deque.remove()
        let it2 = deque.iterator()
        i = 1
        while (let Some(num) <- it2.next()) {
            @Assert(num, i)
            i++
        }
        @Assert(i, 50)
    }

    @TestCase
    func testToString() {
        var deque = ArrayQueue<Int64>()
        deque.add(1)
        deque.add(0)
        deque.add(2)
        deque.add(3)
        @Assert(deque.toString(), "[1, 0, 2, 3]")
    }

    @TestCase
    func testStress(): Unit {
        let random = Random()
        let deque = ArrayQueue<Int64>()
        let list = ArrayList<Int64>()

        for (i in 0..100000) {
            match (random.nextInt64(4)) {
                case 0 | 1 =>
                    deque.add(i)
                    list.add(i)
                case _ =>
                    deque.remove()
                    if (list.size > 0) {
                        list.remove(at: 0)
                    }
            }
        }
        @Expect(deque.size, list.size)

        let it_que = deque.iterator()
        let it_list = list.iterator()
        while (let Some(que_num) <- it_que.next()) {
            let list_num = it_list.next().getOrThrow()
            @Assert(que_num, list_num)
        }
        @Assert(deque.toString(), list.toString())

        for (i in 0..deque.size) {
            @Assert(deque.remove(), list[i])
        }
    }

    @TestCase
    func test_arrayqueue_init_notblank_03(): Unit {
        let e = @AssertThrows[IllegalArgumentException](ArrayQueue<Int64>(-100))
        @Expect(e.message.contains("The capacity must be greater than or equal to 0: -100."))
    }
}
