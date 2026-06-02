/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output --test
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.concurrent.*
import std.collection.*
import std.time.*

var sum = 0

@Test
class Test_arrayblockqueue_remove_03 {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_remove_int_01(): Unit {
        var arr = Array<Int64>(1, {i => i + 1})
        var arrayqueue = ArrayBlockingQueue<Int64>(1)
        for (i in arr) {
            arrayqueue.tryAdd(i)
        }
        @Expect(arrayqueue.size, 1)
        @Expect(arrayqueue.remove(), 1)
        @Expect(arrayqueue.remove(Duration.second), None)
        @Expect(arrayqueue.size, 0)
    }

    @TestCase
    func test_remove_string_02(): Unit {
        var arr = Array<String>(1, {i => "${i + 1}"})
        var arrayqueue = ArrayBlockingQueue<String>(1)
        for (i in arr) {
            arrayqueue.tryAdd(i)
        }
        @Expect(arrayqueue.size, 1)
        @Expect(arrayqueue.remove(), "1")
        @Expect(arrayqueue.remove(Duration.second), None)
        @Expect(arrayqueue.size, 0)
    }

    @TestCase
    func test_int_del_first_elements_verify_03(): Unit {
        var arr = Array<Int64>(10000, {i => i + 1})
        var arrayqueue = ArrayBlockingQueue<Int64>(10000)
        for (i in arr) {
            arrayqueue.tryAdd(i)
        }
        @Expect(arrayqueue.size, 10000)
        for (i in 0..10000) {
            @Expect(arrayqueue.remove(), i + 1)
        }
        @Expect(arrayqueue.size, 0)
    }

    @TestCase
    func test_string_del_first_elements_verify_04(): Unit {
        var arr = Array<String>(10000, {i => "${i + 1}"})
        var arrayqueue = ArrayBlockingQueue<String>(10000)
        for (i in arr) {
            arrayqueue.tryAdd(i)
        }
        @Expect(arrayqueue.size, 10000)
        for (i in 0..10000) {
            @Expect(arrayqueue.remove(),"${i + 1}")
        }
    }

    @TestCase
    func test_int_timeout_blank_05(): Unit {
        var arrayqueue = ArrayBlockingQueue<Int64>(1)
        @Expect(arrayqueue.size, 0)
        @Expect(arrayqueue.remove(Duration.second),None)
    }

    @TestCase
    func test_int_timeout_notblank_06(): Unit {
        var arr = Array<Int64>(10000, {i => i + 1})
        var arrayqueue = ArrayBlockingQueue<Int64>(10000)
        for (i in arr) {
            arrayqueue.tryAdd(i)
        }
        @Expect(arrayqueue.size, 10000)
        for (i in 0..10000) {
            @Expect(arrayqueue.remove(Duration.second), Some(i+1))
        }
    }

    @TestCase
    func test_int_timeout_full_remove_07(): Unit {
        var arr = Array<Int64>(9999, {i => i + 1})
        var arrayqueue = ArrayBlockingQueue<Int64>(10000)
        for (i in arr) {
            arrayqueue.tryAdd(i)
        }
        @Expect(arrayqueue.size, 9999)
        arrayqueue.add(10000, Duration.second * 10)
        arrayqueue.remove()

        @Expect(arrayqueue.add(10001, Duration.second * 5 ), true)
    }

    @TestCase
    func test_int_timeout_blank_08(): Unit {
        var arrayqueue = ArrayBlockingQueue<String>(1)
        @Expect(arrayqueue.size, 0)
        @Expect(arrayqueue.remove(Duration.second), None)
    }

    @TestCase
    func test_int_timeout_notblank_09(): Unit {
        var arr = Array<String>(10000, {i => "${i + 1}"})
        var arrayqueue = ArrayBlockingQueue<String>(10000)
        for (i in arr) {
            arrayqueue.tryAdd(i)
        }
        @Expect(arrayqueue.size, 10000)
        for (i in 0..10000) {
            @Expect(arrayqueue.remove(Duration.second), Some("${i+1}"))
        }
    }
}
