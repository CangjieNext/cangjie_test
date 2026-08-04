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

var cycles: Int64 = 10000

func randomize(arr: Array<(Int64, Int64)>) {
    let r: Random = Random()
    for (i in 0..arr.size) {
        arr[i] = (r.nextInt64(cycles), r.nextInt64(cycles))
    }
}

class Timer {
    public func getTime() {
        let time = DateTime.now()
        return time
    }
}

class ConcurrentHashMapBenchmark {
    func concurrentHashMapPutRun() {
        var arr: Array<(Int64, Int64)> = Array<(Int64, Int64)>(cycles, repeat: (0, 0))
        randomize(arr)
        var concurrentHashMap = ConcurrentHashMap(arr)
        let start = Timer().getTime()
        for (i in 0..cycles) {
            concurrentHashMap.put(i, i)
        }
        let end = Timer().getTime()
        println("concurrentHashMap-put: ms = ${Float64((end-start).toNanoseconds())/1000000.0/Float64(cycles)}")
    }

    func concurrentHashMapPutIfAbsentRun() {
        var arr: Array<(Int64, Int64)> = Array<(Int64, Int64)>(cycles, repeat: (0, 0))
        randomize(arr)
        var concurrentHashMap = ConcurrentHashMap(arr)
        let start = Timer().getTime()
        for (i in 0..cycles) {
            concurrentHashMap.putIfAbsent(i, i)
        }
        let end = Timer().getTime()
        println("concurrentHashMap-putIfAbsent: ms = ${Float64((end-start).toNanoseconds())/1000000.0/Float64(cycles)}")
    }
    func concurrentHashMapRemoveRun() {
        var arr: Array<(Int64, Int64)> = Array<(Int64, Int64)>(cycles, repeat: (0, 0))
        randomize(arr)
        var concurrentHashMap = ConcurrentHashMap(arr)
        let start = Timer().getTime()
        for (i in 0..cycles) {
            concurrentHashMap.remove(i)
        }
        let end = Timer().getTime()
        println("concurrentHashMap-remove: ms = ${Float64((end-start).toNanoseconds())/1000000.0/Float64(cycles)}")
    }
    func concurrentHashMapReplaceRun() {
        var arr: Array<(Int64, Int64)> = Array<(Int64, Int64)>(cycles, repeat: (0, 0))
        randomize(arr)
        var concurrentHashMap = ConcurrentHashMap(arr)
        let start = Timer().getTime()
        for (i in 0..cycles) {
            concurrentHashMap.replace(i, i)
        }
        let end = Timer().getTime()
        println("concurrentHashMap-replace: ms = ${Float64((end-start).toNanoseconds())/1000000.0/Float64(cycles)}")
    }
    func concurrentHashMapIteratorRun() {
        var arr: Array<(Int64, Int64)> = Array<(Int64, Int64)>(cycles, repeat: (0, 0))
        randomize(arr)
        var concurrentHashMap = ConcurrentHashMap(arr)
        var iteratort = ConcurrentHashMapIterator<Int64, Int64>(concurrentHashMap)
        let start = Timer().getTime()
        for (i in 0..cycles) {
            iteratort.next()
        }
        let end = Timer().getTime()
        println("concurrentHashMap-iterator: ms = ${Float64((end-start).toNanoseconds())/1000000.0/Float64(cycles)}")
    }
}

main() {
    ConcurrentHashMapBenchmark().concurrentHashMapPutRun()
    ConcurrentHashMapBenchmark().concurrentHashMapPutIfAbsentRun()
    ConcurrentHashMapBenchmark().concurrentHashMapRemoveRun()
    ConcurrentHashMapBenchmark().concurrentHashMapReplaceRun()
    ConcurrentHashMapBenchmark().concurrentHashMapIteratorRun()
}
