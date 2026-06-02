// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../utils.cj
// (CJNATIVE) EXEC: %compiler %cmp_opt --fobf-all --fno-obf-export-symbols utils.cj %f -o %output

/*
sizeInBytes is:
_4_KB
_4_MB
numberOfObjects is automatically calculated to consume up only 60% of the available Heap memory
 */

package GC

import std.time.*
import std.collection.*

let sizeInBytes_ = 4 * KB - 16
var init_temp = Array<Byte>(sizeInBytes_, repeat: 1) // Init before manually_init func.

func allocate_internal(sizeInBytes: Int64, numberOfObjects: Int64) {
    var junk = ArrayList<Array<Byte>>(0)
    for (j in 0..numberOfObjects) {
        init_temp = Array<Byte>(sizeInBytes_, repeat: 1)
        junk.add(init_temp)
    }
    if (debug) {
        println("${sizeInBytes}, ${numberOfObjects}")
        getMemoryInfo()
        for (j in 0..numberOfObjects) {
            println(junk[j].size)
        }
    }
}

func allocate(sizeInBytes: Int64, numberOfObjects: Int64) {
    for (iter in 0..4) {
        allocate_internal(sizeInBytes, numberOfObjects)
    }
}

// We only want to get memory allocate time, so only count array init time here.
func only_init(sizeInBytes: Int64, numberOfObjects: Int64) {
    for (iter in 0..4) {
        manually_init(sizeInBytes, numberOfObjects)
    }
}

func manually_init(sizeInBytes: Int64, numberOfObjects: Int64) {
    var junk = ArrayList<Array<Byte>>(0)
    for (j in 0..numberOfObjects) {
        for (x in 0..sizeInBytes) {
            init_temp[x] = 1 // Only count init time here.
        }
    }
    if (debug) {
        println("${sizeInBytes}, ${numberOfObjects}")
        getMemoryInfo()
    }
}

main() {
    let name = "BurstHeapMemoryAllocatorBenchmark_4KB"
    var n = 10

    var now = DateTime.now()
    for (_ in 0..n) {
        allocate(sizeInBytes_, heapsize_4kb)
    }
    var end = DateTime.now()
    var cost = (end - now).toNanoseconds()

    var now_2 = DateTime.now()
    for (_ in 0..n) {
        only_init(sizeInBytes_, heapsize_4kb)
    }
    var end_2 = DateTime.now()
    var cost_2 = (end_2 - now_2).toNanoseconds()

    cost = cost - cost_2 // allocate_time = total_time - init_time
    printCostTime(n, cost, name)
}
