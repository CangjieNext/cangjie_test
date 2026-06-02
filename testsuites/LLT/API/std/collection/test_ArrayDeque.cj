/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f --test
// EXEC: %run %run_opt %n.%suffix %run_args

import std.collection.*
import std.random.*

@Test
class Test_ArrayDeque {
    @TestCase
    func test_init(): Unit {
        var que = ArrayDeque<Int64>()
        @Assert(que.isEmpty(),true)
        @Assert(que.size==0,true)
        @Assert(que.capacity ,8)

        let que2 = ArrayDeque<Int64>(100)
        @Assert(que2.isEmpty(),true)
        @Assert(que2.size==0)
        @Assert(que2.capacity ,100)

        let que3 = ArrayDeque<Int64>(5)
        @Assert(que3.isEmpty(),true)
        @Assert(que3.size==0)
        @Assert(que3.capacity ,8)

        @Assert(que3.first, Option<Int64>.None)
        @Assert(que3.last, Option<Int64>.None)

        @ExpectThrows[IllegalArgumentException](ArrayDeque<Int64>(-1))
    }

    @TestCase
    func testAddFirst(): Unit {
        let deque = ArrayDeque<Int64>()
        deque.addFirst(100)
        @Assert(deque.size , 1)
        @Assert(deque.capacity ,8)
        @Assert(deque.first ,100)
        @Assert(deque.last ,100)

        deque.addFirst(200)
        @Assert(deque.size, 2)
        @Assert(deque.capacity ,8)
        @Assert(deque.first ,200)
        @Assert(deque.last ,100)
        @Expect(deque.toArray(), [200, 100])

        let deque2 = ArrayDeque<Int64>()
        for (i in 0..100) {
            deque2.addFirst(i)
            @Expect(deque2.first, i)
            @Expect(deque2.last, 0)
        }
        @Expect(deque2.toArray(), Array<Int64>(100) {i => 99 - i})
    }

    @TestCase
    func testAddLast(): Unit {
        let deque = ArrayDeque<Int64>()
        deque.addLast(100)
        @Assert(deque.size==1)
        @Assert(deque.capacity ,8)
        deque.addLast(200)
        @Assert(deque.size==2)
        @Assert(deque.capacity ,8)
        @Expect(deque.toArray(), [100, 200])
        let deque2 = ArrayDeque<Int64>()
        for (i in 0..100) {
            deque2.addLast(i)
            @Expect(deque2.first, 0)
            @Expect(deque2.last, i)
        }
        @Expect(deque2.toArray(), Array<Int64>(100){i => i} )
    }

    @TestCase
    func test_init_blank_01(): Unit {
        let arrdeque = ArrayDeque<Int64>()
        @Expect(arrdeque.first, Option<Int64>.None)
        @Expect(arrdeque.last, Option<Int64>.None)
        @Expect(arrdeque.capacity, 8)
        @Expect(arrdeque.size, 0)
        @Expect(arrdeque.isEmpty(), true)
        @Expect(arrdeque.toArray(), Array<Int64>())
        @Expect(arrdeque.removeFirst(), Option<Int64>.None)
        @Expect(arrdeque.removeLast(), Option<Int64>.None)
        @Expect(arrdeque.toString(), "[]")
    }

    @TestCase
    func testRemoveFirst(): Unit {
        var deque = ArrayDeque<Int64>()
        deque.addLast(100)
        deque.addLast(200)
        deque.addLast(300)

        @Assert(deque.removeFirst(),100)
        @Assert(deque.size==2)
        @Expect(deque.toArray(), [200, 300])
        @Assert(deque.removeFirst(),200)
        @Assert(deque.size==1)
        @Expect(deque.toArray(), [300])
        @Assert(deque.removeFirst(),300)
        @Assert(deque.size==0)

        @Assert(deque.removeFirst(), Option<Int64>.None)

        let deque2 = ArrayDeque<Int64>()
        for (i in 0..100) {
            deque2.addLast(i)
        }

        for (i in 0..100) {
            @Assert(deque2.removeFirst(), i)
            @Assert(deque2.size, 99 - i)
        }
    }

    @TestCase
    func testRemoveLast(): Unit {
        var deque = ArrayDeque<Int64>()
        deque.addLast(100)
        deque.addLast(200)
        deque.addLast(300)

        @Assert(deque.removeLast(),300)
        @Assert(deque.size==2)
        @Expect(deque.toArray(), [100, 200])
        @Assert(deque.removeLast(),200)
        @Assert(deque.size==1)
        @Expect(deque.toArray(), [100])
        @Assert(deque.removeLast(),100)
        @Assert(deque.size==0)

        @Assert(deque.removeLast(), Option<Int64>.None)

        let deque2 = ArrayDeque<Int64>()
        for (i in 0..100) {
            deque2.addLast(i)
        }

        for (i in 0..100) {
            @Assert(deque2.removeLast(), 99 - i)
            @Assert(deque2.size, 99 - i)
        }

        let queue3 = ArrayDeque<Int64>()
        queue3.addFirst(1)
        @Expect(queue3.removeLast(), 1)
    }

    @TestCase
    func testClear(): Unit {
        var deque = ArrayDeque<Int64>()
        deque.addLast(100)
        deque.addLast(200)
        deque.addLast(300)

        deque.clear()
        @Assert(deque.size==0)

        @Assert(deque.removeFirst(), Option<Int64>.None)
        @Assert(deque.removeLast(), Option<Int64>.None)
    }

    @TestCase
    func testReserve(): Unit {
        var deque = ArrayDeque<Int64>()
        deque.reserve(100)
        @Assert(deque.capacity -  deque.size >= 100)
        for (i in 10..1000) {
            deque.reserve(i)
            @Assert(deque.capacity -  deque.size >= i)
        }
    }

    @TestCase
    func testReserve01(): Unit {
        var deque = ArrayDeque<Int64>(0)
        @Expect(deque.capacity,8)
        @Expect(deque.size,0)
        println(deque.first)

        deque.reserve(10)
        println(deque.capacity)
        println(deque.size)
        println(deque.first)

        @Expect(deque.capacity,12)
        @Expect(deque.size,0)
    }

    @TestCase
    func test_init_blank_02(): Unit {
        let arrdeque = ArrayDeque<String>()
        for (i in 0..50) {
            arrdeque.addFirst("${i}")
        }
        @Expect(arrdeque.capacity, 60)
        @Expect(arrdeque.size, 50)
        arrdeque.reserve(0)
        @Expect(arrdeque.capacity, 60)

        arrdeque.reserve(-100)
        @Expect(arrdeque.capacity, 60)

        arrdeque.reserve(11)
        @Expect(arrdeque.capacity, 90)

        arrdeque.reserve(39)
        @Expect(arrdeque.capacity, 90)

        arrdeque.reserve(40)
        @Expect(arrdeque.capacity, 90) //135
    }

    @TestCase
    func testIterator(): Unit {
        var deque = ArrayDeque<Int64>()
        for (i in 0..50) {
            deque.addLast(i)
        }

        for (i in -1..-50 : -1) {
            deque.addFirst(i)
        }

        let it = deque.iterator()
        var i = -49
        while (let Some(num) <- it.next()) {
            @Assert(num, i)
            i++
        }
        @Assert(i,50)

        let it2 = deque.iterator()
        deque.addLast(100)
        @ExpectThrows[ConcurrentModificationException](it2.next())
    }

    @TestCase
    func testToString() {
        var deque = ArrayDeque<Int64>()
        deque.addFirst(1)
        deque.addFirst(0)
        deque.addLast(2)
        deque.addLast(3)
        @Assert(deque.toString(), "[0, 1, 2, 3]")
    }

    @TestCase
    func testStress(): Unit {
        let random = Random()
        let deque = ArrayDeque<Int64>()
        let list = ArrayList<Int64>()

        for (i in 0..100000) {
            match (random.nextInt64(6)) {
                case 0 | 1 =>
                    deque.addFirst(i)
                    list.add(i, at: 0)
                case 2 | 3 =>
                    deque.addLast(i)
                    list.add(i)
                case 4 =>
                    deque.removeFirst()
                    if (list.size > 0) {
                        list.remove(at: 0)
                    }
                case 5 =>
                    deque.removeLast()
                    if (list.size > 0) {
                        list.remove(at: list.size - 1)
                    }
                case _ => ()
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
            @Assert(deque.removeFirst(), list[i])
        }
    }
}
