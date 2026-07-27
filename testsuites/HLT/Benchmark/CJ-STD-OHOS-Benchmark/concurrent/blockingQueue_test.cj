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

class BlockingQueueBenchmark {
    func blockingQueueEnqueueRun() {
        var blockingQueue = BlockingQueue<Int64>()
        let start = Timer().getTime()
        for (i in 0..cycles) {
            blockingQueue.enqueue(i)
        }
        let end = Timer().getTime()
        println("blockingQueue-enqueue: ms = ${Float64((end-start).toNanoseconds())/1000000.0/Float64(cycles)}")
    }
    func blockingQueueEnqueueTimeoutRun() {
        var blockingQueue = BlockingQueue<Int64>()
        let start = Timer().getTime()
        for (i in 0..cycles) {
            blockingQueue.enqueue(i, Duration.second * 2)
        }
        let end = Timer().getTime()
        println("blockingQueue-enqueue-timeout: ms = ${Float64((end-start).toNanoseconds())/1000000.0/Float64(cycles)}")
    }
    func blockingQueueDequeueRun() {
        var arr: Array<Int64> = Array<Int64>(cycles, repeat: 0)
        randomize(arr)
        var blockingQueue = BlockingQueue<Int64>(cycles, arr)
        let start = Timer().getTime()
        for (i in 0..cycles) {
            blockingQueue.dequeue()
        }
        let end = Timer().getTime()
        println("blockingQueue-dequeue: ms = ${Float64((end-start).toNanoseconds())/1000000.0/Float64(cycles)}")
    }
    func blockingQueueHeadRun() {
        var arr: Array<Int64> = Array<Int64>(cycles, repeat: 0)
        randomize(arr)
        var blockingQueue = BlockingQueue<Int64>(cycles, arr)
        let start = Timer().getTime()
        for (i in 0..cycles) {
            blockingQueue.head()
        }
        let end = Timer().getTime()
        println("blockingQueue-head: ms = ${Float64((end-start).toNanoseconds())/1000000.0/Float64(cycles)}")
    }
    func blockingQueueTryEnqueueRun() {
        var arr: Array<Int64> = Array<Int64>(cycles, repeat: 0)
        randomize(arr)
        var blockingQueue = BlockingQueue<Int64>(cycles, arr)
        let start = Timer().getTime()
        for (i in 0..cycles) {
            blockingQueue.tryEnqueue(i)
        }
        let end = Timer().getTime()
        println("blockingQueue-tryEnqueue: ms = ${Float64((end-start).toNanoseconds())/1000000.0/Float64(cycles)}")
    }
    func blockingQueueTryDequeueRun() {
        var arr: Array<Int64> = Array<Int64>(cycles, repeat: 0)
        randomize(arr)
        var blockingQueue = BlockingQueue<Int64>(cycles, arr)
        let start = Timer().getTime()
        for (i in 0..cycles) {
            blockingQueue.tryDequeue()
        }
        let end = Timer().getTime()
        println("blockingQueue-tryDequeue: ms = ${Float64((end-start).toNanoseconds())/1000000.0/Float64(cycles)}")
    }
}

main() {
    BlockingQueueBenchmark().blockingQueueEnqueueRun()
    BlockingQueueBenchmark().blockingQueueEnqueueTimeoutRun()
    BlockingQueueBenchmark().blockingQueueDequeueRun()
    BlockingQueueBenchmark().blockingQueueHeadRun()
    BlockingQueueBenchmark().blockingQueueTryEnqueueRun()
    BlockingQueueBenchmark().blockingQueueTryDequeueRun()
}
