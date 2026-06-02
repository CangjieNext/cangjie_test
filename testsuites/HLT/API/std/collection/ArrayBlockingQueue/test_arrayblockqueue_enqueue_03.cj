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

@Test
class Test_arrayblockqueue_enqueue_03 {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_enqueue_int_01(): Unit {
        var arrayqueue = ArrayBlockingQueue<Int64>(2)
        @Expect(arrayqueue.size, 0)
        arrayqueue.enqueue(0)
        arrayqueue.enqueue(0)
        @Expect(arrayqueue.size, 2)
        @Expect(arrayqueue.enqueue(1, Duration.second),false)
    }

    @TestCase
    func test_enqueue_string_02(): Unit {
        var arrayqueue = ArrayBlockingQueue<String>(2)
        @Expect(arrayqueue.size, 0)
        arrayqueue.enqueue("0")
        arrayqueue.enqueue("0")
        @Expect(arrayqueue.size, 2)
        @Expect(arrayqueue.enqueue("1", Duration.second),false)
    }

    @TestCase
    func test_int_add_end_verify_03(): Unit {
        var arrayqueue = ArrayBlockingQueue<Int64>(10000, Array<Int64>(9999, {i => i + 1}))
        @Expect(arrayqueue.size, 9999)
        arrayqueue.enqueue(10000)
        @Expect(arrayqueue.size, 10000)
        for (i in 0..9999) {
            arrayqueue.dequeue()
        }
        @Expect(arrayqueue.size, 1)
        @Expect(arrayqueue.head(), Some(10000))
    }

    @TestCase
    func test_string_add_end_verify_04(): Unit {
        var arrayqueue = ArrayBlockingQueue<String>(10000, Array<String>(9999, {i => "${i + 1}"}))
        @Expect(arrayqueue.size, 9999)
        arrayqueue.enqueue("10000")
        @Expect(arrayqueue.size, 10000)
        for (i in 0..9999) {
            arrayqueue.dequeue()
        }
        @Expect(arrayqueue.size, 1)
        @Expect(arrayqueue.head(), Some("10000"))
    }

    @TestCase
    func test_int_timeout_notfull_05(): Unit {
        var arrayqueue = ArrayBlockingQueue<Int64>(10000, Array<Int64>(9999, {i => i + 1}))
        @Expect(arrayqueue.size, 9999)
        arrayqueue.enqueue(10000, Duration.second * 10)
        @Expect(arrayqueue.size, 10000)
        for (i in 0..9999) {
            arrayqueue.dequeue()
        }
        @Expect(arrayqueue.size, 1)
        @Expect(arrayqueue.head(), Some(10000))
    }

    @TestCase
    func test_int_timeout_full_06(): Unit {
        var arrayqueue = ArrayBlockingQueue<Int64>(10000, Array<Int64>(9999, {i => i + 1}))
        @Expect(arrayqueue.size, 9999)
        arrayqueue.enqueue(10000, Duration.second * 10)
        @Expect(arrayqueue.enqueue(10001, Duration.second),false)
    }

    @TestCase
    func test_string_timeout_notfull_07(): Unit {
        var arrayqueue = ArrayBlockingQueue<String>(10000, Array<String>(9999, {i => "${i + 1}"}))
        @Expect(arrayqueue.size, 9999)
        arrayqueue.enqueue("10000", Duration.second * 10)
        @Expect(arrayqueue.size, 10000)
        for (i in 0..9999) {
            arrayqueue.dequeue()
        }
        @Expect(arrayqueue.size, 1)
        @Expect(arrayqueue.head(), Some("10000"))
    }

    @TestCase
    func test_string_timeout_full_08(): Unit {
        var arrayqueue = ArrayBlockingQueue<String>(10000, Array<String>(9999, {i => "${i + 1}"}))
        @Expect(arrayqueue.size, 9999)
        arrayqueue.enqueue("10000", Duration.second * 10)
        @Expect(arrayqueue.enqueue("10001", Duration.second),false)
    }
}
