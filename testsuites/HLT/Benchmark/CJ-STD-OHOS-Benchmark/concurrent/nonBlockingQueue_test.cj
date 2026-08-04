/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.time.*
import std.sort.*
import std.math.*
import std.random.Random
import std.collection.concurrent.*
import std.time.*

var cycles: Int64 = 10000

func randomize(arr: Array<Int64>) {
    let r: Random = Random()
    for (i in 0..arr.size) {
        arr[i] = r.nextInt64(cycles)
    }
}

class Timer {
    public func getTime() {
        let time = DateTime.now()
        return time
    }
}

class NonBlockingQueueBenchmark {
    func nonBlockingQueueEnqueueRun() {
        var nonblockingQueue = NonBlockingQueue<Int64>()
        let start = Timer().getTime()
        for (i in 0..cycles) {
            nonblockingQueue.enqueue(i)
        }
        let end = Timer().getTime()
        println("nonBlockingQueue-enqueue: ms = ${Float64((end-start).toNanoseconds())/1000000.0/Float64(cycles)}")
    }
    func nonBlockingQueueDequeueRun() {
        var arr: Array<Int64> = Array<Int64>(cycles, repeat: 0)
        randomize(arr)
        var nonblockingQueue = NonBlockingQueue<Int64>(arr)
        let start = Timer().getTime()
        for (i in 0..cycles) {
            nonblockingQueue.dequeue()
        }
        let end = Timer().getTime()
        println("nonBlockingQueue-dequeue: ms = ${Float64((end-start).toNanoseconds())/1000000.0/Float64(cycles)}")
    }
    func nonBlockingQueueHeadRun() {
        var arr: Array<Int64> = Array<Int64>(cycles, repeat: 0)
        randomize(arr)
        var nonblockingQueue = NonBlockingQueue<Int64>(arr)
        let start = Timer().getTime()
        for (i in 0..cycles) {
            nonblockingQueue.head()
        }
        let end = Timer().getTime()
        println("nonBlockingQueue-head: ms = ${Float64((end-start).toNanoseconds())/1000000.0/Float64(cycles)}")
    }
}

main() {
    NonBlockingQueueBenchmark().nonBlockingQueueEnqueueRun()
    NonBlockingQueueBenchmark().nonBlockingQueueDequeueRun()
    NonBlockingQueueBenchmark().nonBlockingQueueHeadRun()
}
