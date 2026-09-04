/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.collection.concurrent.*
import std.sync.*

@Test
class Test_arrayblockqueue_concurrent_producer_consumer_10 {
    @TestCase
    func test_int_4p4c_blocking_add_remove_01(): Unit {
        let producerCount = 4i64
        let consumerCount = 4i64
        let elementsPerProducer = 10_000i64
        let totalElements = producerCount * elementsPerProducer
        let queue = ArrayBlockingQueue<Int64>(8)
        let consumedCount = AtomicInt64(0)
        let consumedSum = AtomicInt64(0)
        let consumedSquareSum = AtomicInt64(0)

        let consumers = Array<Future<Unit>>(
            consumerCount, repeat: unsafe { zeroValue<Future<Unit>>() })
        for (index in 0 .. consumerCount) {
            consumers[index] = spawn {
                while (true) {
                    let value = queue.remove()
                    if (value < 0) {
                        break
                    }
                    consumedCount.fetchAdd(1)
                    consumedSum.fetchAdd(value)
                    consumedSquareSum.fetchAdd(value * value)
                }
            }
        }

        let producers = Array<Future<Unit>>(
            producerCount, repeat: unsafe { zeroValue<Future<Unit>>() })
        for (index in 0 .. producerCount) {
            producers[index] = spawn {
                let start = index * elementsPerProducer
                let end = start + elementsPerProducer
                for (value in start .. end) {
                    queue.add(value)
                }
            }
        }

        for (producer in producers) {
            producer.get()
        }
        for (_ in 0 .. consumerCount) {
            queue.add(-1)
        }
        for (consumer in consumers) {
            consumer.get()
        }

        let expectedSum = totalElements * (totalElements - 1) / 2
        let expectedSquareSum = totalElements * (totalElements - 1) *
            (2 * totalElements - 1) / 6
        @Expect(consumedCount.load(), totalElements)
        @Expect(consumedSum.load(), expectedSum)
        @Expect(consumedSquareSum.load(), expectedSquareSum)
        @Expect(queue.size, 0)
    }
}
