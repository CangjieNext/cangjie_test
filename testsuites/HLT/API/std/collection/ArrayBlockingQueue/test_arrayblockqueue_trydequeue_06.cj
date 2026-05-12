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
var arrayqueue = Option<ArrayBlockingQueue<Int64>>.None
var arrayqueuestring = Option<ArrayBlockingQueue<String>>.None

@Test
class Test_arrayblockqueue_tryenqueue_05 {
    public override func beforeEach(): Unit {
        sum = 0
    }

    public func PreData(): Unit {
        let arrayqueue1 = ArrayBlockingQueue<Int64>(10000)
        for (i in 0..10000) {
            arrayqueue1.tryEnqueue(i + 1)
        }
        arrayqueue = Option<ArrayBlockingQueue<Int64>>.Some(arrayqueue1)
    }

    public func PreDataString(): Unit {
        let arrayqueuestring1 = ArrayBlockingQueue<String>(10000)
        for (i in 0..10000) {
            arrayqueuestring1.tryEnqueue("${i + 1}")
        }
        arrayqueuestring = Option<ArrayBlockingQueue<String>>.Some(arrayqueuestring1)
    }

    @TestCase
    func test_int_tryenqueue_different_elements_01(): Unit {
        PreData()
        for (i in 0..20000) {
            if (i <= 9999) {
                @Expect(arrayqueue.getOrThrow().tryDequeue(), Some(i + 1))
            } else {
                @Expect(arrayqueue.getOrThrow().tryDequeue(), None)
            }
        }
        @Expect(arrayqueue.getOrThrow().size, 0)
    }

    @TestCase
    func test_string_dequeue_different_elements_02(): Unit {
        PreDataString()
        for (i in 0..20000) {
            if (i <= 9999) {
                @Expect(arrayqueuestring.getOrThrow().tryDequeue(), Some("${i + 1}"))
            } else {
                @Expect(arrayqueuestring.getOrThrow().tryDequeue(), None)
            }
        }
        @Expect(arrayqueuestring.getOrThrow().size, 0)
    }

    @TestCase
    func test_int_tryenqueue_trydequeue_elements_03(): Unit {
        PreData()
        for (i in 0..20000) {
            if (i <= 9999) {
                @Expect(arrayqueue.getOrThrow().tryDequeue(), Some(i + 1))
            } else {
                @Expect(arrayqueue.getOrThrow().tryDequeue(), None)
            }
        }
        @Expect(arrayqueue.getOrThrow().size, 0)
        for (i in 0..1000) {
            arrayqueue.getOrThrow().tryEnqueue(i + 1)
        }
        @Expect(arrayqueue.getOrThrow().size, 1000)
        @Expect(arrayqueue.getOrThrow().head(), Some(1))
    }
}
