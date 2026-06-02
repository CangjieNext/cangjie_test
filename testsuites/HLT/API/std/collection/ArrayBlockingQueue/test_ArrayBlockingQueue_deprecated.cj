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
    var arr = Array<String>(1, {i => "${i + 1}"})
    var arrayqueue = ArrayBlockingQueue<String>(4)
    for (i in arr) {
        arrayqueue.tryAdd(i)
    }
    arrayqueue.dequeue()
    arrayqueue.dequeue(Duration.second)
    arrayqueue.tryDequeue()
    arrayqueue.tryEnqueue("1")
    arrayqueue.enqueue("0")
    arrayqueue.enqueue("0", Duration.second)
    arrayqueue.head()
}
