/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt  -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.collection.concurrent.*
import std.collection.*

var sum = 0

@Test
class Test_arrayblockqueue_head_01 {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_head_init_01(): Unit {
        var arrayqueue = ArrayBlockingQueue<Int64>(1)
        @Expect(arrayqueue.head(), None)
        var arrayqueue1 = ArrayBlockingQueue<Int64>(10000)
        @Expect(arrayqueue1.head(), None)
        var arrayqueue2 = ArrayBlockingQueue<String>(1)
        @Expect(arrayqueue2.head(), None)
        var arrayqueue3 = ArrayBlockingQueue<String>(10000)
        @Expect(arrayqueue3.head(), None)
    }

    @TestCase
    func test_head_elements_init_02(): Unit {
        var arrayqueue = ArrayBlockingQueue<Int64>(1, Array<Int64>())
        @Expect(arrayqueue.head(), None)
        var arrayqueue1 = ArrayBlockingQueue<Int64>(10000, Array<Int64>(9999, {i => i + 10}))
        @Expect(arrayqueue1.head(), Some(10))
        var arrayqueue2 = ArrayBlockingQueue<String>(1, Array<String>())
        @Expect(arrayqueue2.head(), None)
        var arrayqueue3 = ArrayBlockingQueue<String>(10000, Array<String>(9000, {i => "${i + 10}"}))
        @Expect(arrayqueue3.head(), Some("10"))
    }

    @TestCase
    func test_head_elements_init_03(): Unit {
        var arrayqueue = ArrayBlockingQueue<Int64>(1, Array<Int64>())
        @Expect(arrayqueue.head(), None)
        arrayqueue.enqueue(1)
        @Expect(arrayqueue.head(), Some(1))
        arrayqueue.dequeue()
        @Expect(arrayqueue.head(), None)

        var arrayqueue1 = ArrayBlockingQueue<String>(1, Array<String>())
        @Expect(arrayqueue1.head(), None)
        arrayqueue1.enqueue("10")
        @Expect(arrayqueue1.head(), Some("10"))
        arrayqueue1.dequeue()
        @Expect(arrayqueue1.head(), None)
    }
}
