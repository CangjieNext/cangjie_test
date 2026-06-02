/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output 
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import std.sort.*

@Test
class Test {
    @TestCase
    func test00(): Unit {
        var list = ArrayList<Int64>(0)
        @Expect(list.capacity,0)
        list.reserve(20)
        @Expect(list.capacity,20)
        @Expect(list.get(0),None)
        var rawdata = unsafe { list.getRawArray() }
        @Expect(rawdata[0],0)
        list.add(1, at: 0)
        @Expect(list.get(0),1)
        @Expect(unsafe {list.getRawArray()}[0],1)
    }

    @TestCase
    func test01(): Unit {
        let arr2 = ArrayList([1, 4, 0, 3, -1])
        sort(arr2)
        @Expect(arr2,ArrayList([-1,0,1,3,4]))
        arr2.reserve(10)
        @Expect(arr2.capacity,15)
        sort(arr2)
        @Expect(arr2,ArrayList([-1,0,1,3,4]))
        @Expect(unsafe {arr2.getRawArray()},[-1,0,1,3,4,0,0,0,0,0,0,0,0,0,0])
    }

    @TestCase
    func test02(): Unit {
        let arr2 = ArrayList([1.1, 4.0, 0.0, 3.2, -1.5])
        sort(arr2)
        arr2.reserve(10)
        @Expect(arr2,ArrayList([-1.5,0.0,1.1,3.2,4.0]))
        sort(arr2)
        @Expect(unsafe {arr2.getRawArray()},[-1.5,0.0,1.1,3.2,4.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0])
        sort(unsafe { arr2.getRawArray() })
        @Expect(unsafe {arr2.getRawArray()},[-1.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.1,3.2,4.0])
    }

    @TestCase
    func test03(): Unit {
        var deque = ArrayDeque<Int64>(0)
        @Expect(deque.capacity,8)
        @Expect(deque.size,0)
        @Expect(deque.first,None)

        deque.reserve(10)
        @Expect(deque.capacity,12)
        @Expect(deque.size,0)
        @Expect(deque.first,None)
    }

    @TestCase
    func test04(): Unit {
        var queue = ArrayQueue<Int64>(0)
        @Expect(queue.capacity,8)
        @Expect(queue.size,0)
        @Expect(queue.remove(),None)

        queue.reserve(10)
        println(queue.capacity)
        println(queue.size)
        @Expect(queue.remove(),None)

        @Expect(queue.capacity,12)
        @Expect(queue.size,0)
    }

    @TestCase
    func test05(): Unit {
        var map = HashMap<Int64, String>(0)
        @Expect(map.size,0)
        @Expect(map.keys().size,0)
        @Expect(map.capacity,0)
        map.reserve(16)
        @Expect(map.size,0)
        @Expect(map.keys().size,0)
        @Expect(map.capacity,16)
        @Expect(map.get(0),None)
    }
}

main(): Unit {}
