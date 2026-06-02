/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan function 'dequeue' is deprecated. Use member function `public func remove(): E` instead.
// ASSERT: scan function 'dequeue' is deprecated. Use member function `public func remove(timeout: Duration): Option<E>` instead.
// ASSERT: scan function 'tryDequeue' is deprecated. Use member function `public func tryRemove(): Option<E>` instead.
// ASSERT: scan function 'tryEnqueue' is deprecated. Use member function `public func tryAdd(element: E): Bool` instead.
// ASSERT: scan function 'enqueue' is deprecated. Use member function `public func add(element: E): Unit` instead.
// ASSERT: scan function 'enqueue' is deprecated. Use member function `public func add(element: E, timeout: Duration): Bool` instead.
// ASSERT: scan function 'head' is deprecated. Use member function `public func peek(): Option<E>` instead.

import std.collection.*
import std.collection.concurrent.*
import std.sync.*
import std.time.*

main(): Unit {
    var bq1 = LinkedBlockingQueue<Int64>(2, [1, 2])
    var bq2 = LinkedBlockingQueue<String>(10, Array<String>(10, {i => "${i + 10}"}))

    var arr = Array<String>(1, {i => "${i + 1}"})
    var bq = LinkedBlockingQueue<String>(4)
    for (i in arr) {
        bq.tryAdd(i)
    }
    bq.dequeue()
    bq.dequeue(Duration.second)
    bq.tryDequeue()
    bq.tryEnqueue("1")
    bq.enqueue("0")
    bq.enqueue("0", Duration.second)
    bq.head()
}
