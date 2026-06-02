/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output --test
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.concurrent.*
import std.collection.*

var sum = 0

@Test
class Test_arrayblockqueue_peek_01 {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_peek_init_01(): Unit {
        var arrayqueue = ArrayBlockingQueue<Int64>(1)
        @Expect(arrayqueue.peek(), None)
        var arrayqueue1 = ArrayBlockingQueue<Int64>(10000)
        @Expect(arrayqueue1.peek(), None)
        var arrayqueue2 = ArrayBlockingQueue<String>(1)
        @Expect(arrayqueue2.peek(), None)
        var arrayqueue3 = ArrayBlockingQueue<String>(10000)
        @Expect(arrayqueue3.peek(), None)
    }

    @TestCase
    func test_peek_elements_init_02(): Unit {
        var arrayqueue = ArrayBlockingQueue<Int64>(1, Array<Int64>())
        @Expect(arrayqueue.peek(), None)
        var arr1 = Array<Int64>(9999, {i => i + 10})
        var arrayqueue1 = ArrayBlockingQueue<Int64>(10000)
        for (i in arr1) {
            arrayqueue1.tryAdd(i)
        }
        @Expect(arrayqueue1.peek(), Some(10))
        var arrayqueue2 = ArrayBlockingQueue<String>(1)
        @Expect(arrayqueue2.peek(), None)
        var arr3 = Array<String>(9000, {i => "${i + 10}"})
        var arrayqueue3 = ArrayBlockingQueue<String>(10000)
        for (i in arr3) {
            arrayqueue3.tryAdd(i)
        }
        @Expect(arrayqueue3.peek(), Some("10"))
    }

    @TestCase
    func test_peek_elements_init_03(): Unit {
        var arrayqueue = ArrayBlockingQueue<Int64>(1, Array<Int64>())
        @Expect(arrayqueue.peek(), None)
        arrayqueue.add(1)
        @Expect(arrayqueue.peek(), Some(1))
        arrayqueue.remove()
        @Expect(arrayqueue.peek(), None)

        var arrayqueue1 = ArrayBlockingQueue<String>(1)
        @Expect(arrayqueue1.peek(), None)
        arrayqueue1.add("10")
        @Expect(arrayqueue1.peek(), Some("10"))
        arrayqueue1.remove()
        @Expect(arrayqueue1.peek(), None)
    }
}
