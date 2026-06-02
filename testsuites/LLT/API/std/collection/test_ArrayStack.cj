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
class Test_ArrayStack {
    @TestCase
    func test_init(): Unit {
        var stack = ArrayStack<Int64>()
        @Assert(stack.isEmpty())
        @Assert(stack.size,0)
        @Assert(stack.capacity,8)

        stack = ArrayStack<Int64>(10)
        @Assert(stack.isEmpty())
        @Assert(stack.size,0)
        @Assert(stack.capacity,10)

        stack = ArrayStack<Int64>(3)
        @Assert(stack.isEmpty())
        @Assert(stack.size,0)
        @Assert(stack.capacity,8)

        @ExpectThrows[IllegalArgumentException](ArrayStack<Int64>(-1))
    }

    @TestCase
    func test_push_pop(): Unit {
        var stack = ArrayStack<Int64>()
        stack.add(10)
        @Assert(!stack.isEmpty())
        @Assert(stack.size,1)
        @Assert(stack.peek(),10)
        @Assert(stack.remove(),10)
        @Assert(stack.isEmpty())
        @Assert(stack.size,0)
        @Assert(stack.remove(),Option<Int64>.None)
    }

    @TestCase
    func test_peek(): Unit {
        var stack = ArrayStack<Int64>()
        @Assert(stack.peek(),Option<Int64>.None)
        stack.add(10)
        @Assert(stack.peek().getOrThrow(),10)
        stack.add(20)
        @Assert(stack.peek().getOrThrow(),20)
        for (i in 0..10000) {
            stack.add(i)
            @Assert(stack.peek().getOrThrow(),i)
        }
        stack.clear()
        @Assert(stack.peek(),Option<Int64>.None)
    }

    @TestCase
    func test_remove(): Unit {
        var stack = ArrayStack<Int64>()
        @Assert(stack.remove(),Option<Int64>.None)
        stack.add(10)
        @Assert(stack.remove().getOrThrow(),10)
        @Assert(stack.remove(),Option<Int64>.None)
        for (i in 0..10000) {
            stack.add(i)
        }
        for (i in 0..10000) {
            @Assert(stack.remove().getOrThrow(),9999 - i)
        }
        @Assert(stack.remove(),Option<Int64>.None) // empty
    }

    @TestCase
    func test_add(): Unit {
        var stack = ArrayStack<Int64>()
        @Assert(stack.size, 0)
        @Assert(stack.capacity,8)
        for (i in 0..8000) {
            stack.add(i)
            @Assert(stack.size,i+1)
        }
        let result = Array<Int64>(8000, {i => 7999 - i})
        @Assert(stack.toArray(), result)
    }

    @TestCase
    func test_clear(): Unit {
        var stack = ArrayStack<Int64>()
        for (i in 0..8000) {
            stack.add(i)
        }
        @Assert(stack.size,8000)
        stack.clear()
        @Assert(stack.size,0)
        @Assert(stack.remove(),Option<Int64>.None)
        @Assert(stack.toArray(), [])
        let it = stack.iterator()
        @Assert(it.next(),Option<Int64>.None)
    }

    @TestCase
    func test_capacity(): Unit {
        var stack = ArrayStack<Int64>()
        @Assert(stack.capacity,8)
        for (i in 0..10000) {
            stack.add(i)
            @Assert(stack.capacity > i)
        }
    }

    @TestCase
    func test_reserve(): Unit {
        var stack = ArrayStack<Int64>()
        stack.reserve(20)
        for (i in 0..10000) {
            stack.reserve(i)
            @Assert(stack.capacity >= i)
        }
    }

    @TestCase
    func test_iterator(): Unit {
        var stack = ArrayStack<Int64>()
        let it = stack.iterator()
        stack.add(1)
        @ExpectThrows[ConcurrentModificationException](it.next())

        for (i in 0..10000) {
            stack.add(i)
        }

        let it2 = stack.iterator()
        for (i in 0..10000) {
            @Assert(it2.next().getOrThrow(), 9999 - i)
        }
        stack.add(10000)
        let it3 = stack.iterator()
        @Assert(it3.next().getOrThrow(), 10000)
    }

    @TestCase
    func test_stress(): Unit {
        let stack = ArrayStack<Int64>(8000)
        let list = ArrayList<Int64>(8000)
        let rnd = Random()

        for (i in 0..10000) {
            if (rnd.nextInt64() % 3 == 0) {
                stack.add(i)
                list.add(i)
            } else {
                if (stack.isEmpty()) {
                    stack.add(i)
                    list.add(i)
                    continue
                }
                @Expect(stack.remove(), list.remove(at: list.size - 1))
            }
        }

        @Expect(stack.size, list.size)
        for (i in 0..list.size) {
            @Expect(stack.remove(), list[list.size - 1 - i])
        }
    }

    @TestCase
    func test_toString(): Unit {
        let stack = ArrayStack<Int64>()
        @Assert(stack.toString(),"[]")
        stack.add(1)
        @Assert(stack.toString(), "[1]")
        stack.add(2)
        @Assert(stack.toString(), "[2, 1]")

        stack.remove()
        @Assert(stack.toString(), "[1]")
        stack.remove()
        @Assert(stack.toString(), "[]")
    }
}
