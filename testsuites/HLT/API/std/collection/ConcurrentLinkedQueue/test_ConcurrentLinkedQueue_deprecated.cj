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
// ASSERT: scan function 'dequeue' is deprecated. Use member function `public func remove(): Option<E>` instead.
// ASSERT: scan function 'enqueue' is deprecated. Use member function `func addIfAbsent(key: K, value: V): ?V` instead.
// ASSERT: scan function 'head' is deprecated. Use member function `public func peek(): Option<E>` instead.

import std.collection.*
import std.collection.concurrent.*
import std.sync.*
import std.time.*

main(): Unit {
    var arr = Array<String>(1, {i => "${i + 1}"})
    var concurrentLinkedQueue = ConcurrentLinkedQueue<String>()
    for (i in arr) {
        concurrentLinkedQueue.add(i)
    }
    concurrentLinkedQueue.dequeue()
    concurrentLinkedQueue.enqueue("0")
    concurrentLinkedQueue.head()
}
