/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.collection.*
import std.collection.concurrent.*
import std.sync.*
import std.time.*

/*
 * Branch-focused coverage for array_blocking_queue.cj blocking paths:
 * waitForWritableSlot / waitForReadableSlot, timed add/remove.
 */
@Test
class ArrayBlockingQueueCoverageTest {
    @TestCase
    func testBlockingAddWhenFull(): Unit {
        let q = ArrayBlockingQueue<Int64>(1)
        q.add(1)
        let producer = spawn {
            q.add(2)
        }
        sleep(Duration.millisecond * 30)
        @Expect(q.size, 1)
        @Expect(q.remove(), 1)
        producer.get()
        @Expect(q.remove(), 2)
    }

    @TestCase
    func testBlockingRemoveWhenEmpty(): Unit {
        let q = ArrayBlockingQueue<Int64>(1)
        let consumer = spawn {
            @Expect(q.remove(), 42)
        }
        sleep(Duration.millisecond * 30)
        q.add(42)
        consumer.get()
        @Expect(q.size, 0)
    }

    @TestCase
    func testTimedAddAndRemoveWhenBlocked(): Unit {
        let q = ArrayBlockingQueue<Int64>(1)
        q.add(1)
        @Expect(q.add(2, Duration.millisecond * 20), false)

        let consumer = spawn {
            @Expect(q.remove(Duration.millisecond * 500), Some(1))
        }
        sleep(Duration.millisecond * 30)
        @Expect(q.add(9, Duration.millisecond * 500), true)
        consumer.get()
        @Expect(q.remove(), 9)
    }

    @TestCase
    func testInitFromCollectionAndSize(): Unit {
        let arr = ArrayList<Int64>([1, 2, 3])
        let q = ArrayBlockingQueue<Int64>(5, arr)
        @Expect(q.size, 3)
        @Expect(q.capacity, 5)
        @Expect(q.remove(), 1)
        @Expect(q.remove(), 2)
        @Expect(q.remove(), 3)
    }
}
