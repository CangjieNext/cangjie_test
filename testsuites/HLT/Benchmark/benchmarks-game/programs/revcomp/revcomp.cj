/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// (LLVM) EXEC: %compiler %cmp_opt %optimization_level_2 --fast-math %overflow_wrapping %f -o %output
// (JET) EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output

import std.collection.*
import std.sync.*
import std.fs.*

let pairs: Array<UInt8> = "ATaTCGcGGCgCTAtAUAuAMKmKRYrYWWwWSSsSYRyRKMkMVBvBHDhDDHdHBVbVNNnN".toArray()
let complement: Array<UInt8> = Array<UInt8>(128, repeat:0)
let H: UInt8 = 62  // '>'
let E: UInt8 = 10  // '\n'

var count: Int64 = 0
var mon = Monitor()

struct work_t {
    public let sour: Array<UInt8>
    public var begin: Int64 = 0
    public var end: Int64 = 0
    public var expectedNum: Int64 = 0
    public init(sour: Array<UInt8>, begin: Int64, end: Int64, num: Int64 ) {
        this.sour = sour
        this.begin= begin
        this.end= end
        this.expectedNum = num
    }
}

func process(work: work_t): Unit {
    let sour: Array<UInt8> = work.sour
    let start: Int64 = work.begin
    let end: Int64 = work.end
    let num = work.expectedNum

    var i: Int64 = start
    var j: Int64 = end - 1
    var ci: UInt8 = 0
    var cj: UInt8 = 0
    while (i < end) {
        if (sour[i] == E) {
            break
        }
        i++
    }
    i++
    while(i < j) {
        ci = sour[i]
        if (ci == E) {
            i++
            ci = sour[i]
        }
        cj = sour[j]
        if (cj == E) {
            j--
            cj = sour[j]
        }
        sour[i] = complement[Int64(cj)]
        sour[j] = complement[Int64(ci)]
        i++
        j--
    }
    var newArr = sour.slice(start, end-start)
    mon.lock()
    while (count != num) {
        mon.wait()
    }
    File.writeTo("/dev/stdout", newArr)
    count++
    mon.notifyAll()
    mon.unlock()
}

func getComplement() {
    let size = pairs.size
    for (i in 0..size:2) {
        complement[Int64(pairs[i])] = pairs[i+1]
    }
}

main(): Int64 {
    getComplement()
    let arr = File.readFrom("/dev/stdin")

    let threads: ArrayList<Future<Unit>> = ArrayList<Future<Unit>>()
    var arrSize = arr.size
    var last = 0
    var i = 0
    var blockNum = 0
    while (i < arrSize) {
        if (arr[i] == H) {
            if (i != 0) {
                let work: work_t = work_t(arr, last + 1, i, blockNum)
                var future: Future<Unit> = spawn { process(work) }
                threads.add(future)
                blockNum++
            }
            last = i
        }
        if (blockNum == 2) {
            let work: work_t = work_t(arr, last + 1, arrSize, blockNum)
            var future: Future<Unit> = spawn { process(work) }
            threads.add(future)
            break
        }
        i++
    }

    for(th in threads) {
        try {
            th.get()
            ()
        } catch(e: Exception) {
            print("Exception occured ---: ${e}\n")
        }
    }
    return 0
}
