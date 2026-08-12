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
import std.collection.*
import std.time.*

var cycles: Int64 = 10000

func randomize(arr: ArrayList<Int64>) {
    let r: Random = Random()
    for (i in 0..cycles) {
        arr.add(r.nextInt64(), at: i)
    }
}

class Timer {
    public func getTime() {
        let time = DateTime.now()
        return time
    }
}

class ArrayBlockingQueueBenchmark {
    func arrayBlockingQueueEnqueueRun() {
        var arr = ArrayList<Int64>()
        randomize(arr)
        var arrayBlockingQueue = ArrayBlockingQueue<Int64>(cycles)
        let start = Timer().getTime()
        for (i in 0..cycles) {
            arrayBlockingQueue.enqueue(i)
        }
        let end = Timer().getTime()
        println("arrayBlockingQueue-enqueue: ms = ${Float64((end-start).toNanoseconds())/1000000.0/Float64(cycles)}")
    }

    func arrayBlockingQueueTimeoutEnqueueRun() {
        var arrayBlockingQueue = ArrayBlockingQueue<Int64>(cycles)
        let start = Timer().getTime()
        for (i in 0..cycles) {
            arrayBlockingQueue.enqueue(i, Duration.second * 1)
        }
        let end = Timer().getTime()
        println(
            "arrayBlockingQueue-enqueue-timeout: ms = ${Float64((end-start).toNanoseconds())/1000000.0/Float64(cycles)}"
        )
    }
    func arrayBlockingQueueDequeueRun() {
        var arr = ArrayList<Int64>()
        randomize(arr)
        var arrayBlockingQueue = ArrayBlockingQueue<Int64>(cycles, arr)
        let start = Timer().getTime()
        for (i in 0..cycles) {
            arrayBlockingQueue.dequeue()
        }
        let end = Timer().getTime()
        println("arrayBlockingQueue-dequeue: ms = ${Float64((end-start).toNanoseconds())/1000000.0/Float64(cycles)}")
    }
    func arrayBlockingQueueDequeueTimeoutRun() {
        var arr = ArrayList<Int64>()
        randomize(arr)
        var arrayBlockingQueue = ArrayBlockingQueue<Int64>(cycles, arr)
        let start = Timer().getTime()
        for (i in 0..cycles) {
            arrayBlockingQueue.dequeue(Duration.second * 1)
        }
        let end = Timer().getTime()
        println(
            "arrayBlockingQueue-dequeue-timeout: ms = ${Float64((end-start).toNanoseconds())/1000000.0/Float64(cycles)}"
        )
    }
    func arrayBlockingQueueHeadRun() {
        var arr = ArrayList<Int64>()
        randomize(arr)
        var arrayBlockingQueue = ArrayBlockingQueue<Int64>(cycles, arr)
        let start = Timer().getTime()
        for (i in 0..cycles) {
            arrayBlockingQueue.head()
        }
        let end = Timer().getTime()
        println("arrayBlockingQueue-head: ms = ${Float64((end-start).toNanoseconds())/1000000.0/Float64(cycles)}")
    }
    func arrayBlockingQueueTryEnqueueRun() {
        var arr = ArrayList<Int64>()
        randomize(arr)
        var arrayBlockingQueue = ArrayBlockingQueue<Int64>(cycles, arr)
        let start = Timer().getTime()
        for (i in 0..cycles) {
            arrayBlockingQueue.tryEnqueue(i)
        }
        let end = Timer().getTime()
        println("arrayBlockingQueue-tryEnqueue: ms = ${Float64((end-start).toNanoseconds())/1000000.0/Float64(cycles)}")
    }
}

main() {
    ArrayBlockingQueueBenchmark().arrayBlockingQueueEnqueueRun()
    ArrayBlockingQueueBenchmark().arrayBlockingQueueTimeoutEnqueueRun()
    ArrayBlockingQueueBenchmark().arrayBlockingQueueDequeueRun()
    ArrayBlockingQueueBenchmark().arrayBlockingQueueDequeueTimeoutRun()
    ArrayBlockingQueueBenchmark().arrayBlockingQueueHeadRun()
    ArrayBlockingQueueBenchmark().arrayBlockingQueueTryEnqueueRun()
}
