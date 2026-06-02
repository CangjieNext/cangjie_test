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

func allocate_internal(sizeInBytes: Int64, numberOfObjects: Int64) {
    var junk = ArrayList<Array<Byte>>(numberOfObjects)
    for (j in 0..numberOfObjects) {
        junk.add(Array<Byte>(sizeInBytes, repeat: 1))
    }
    if (debug) {
        println("${sizeInBytes}, ${numberOfObjects}")
        getMemoryInfo()
    }
}

func allocate(sizeInBytes: Int64, numberOfObjects: Int64) {
    for (iter in 0..4) {
        allocate_internal(sizeInBytes, numberOfObjects)
    }
}

main() {
    let name = "BurstHeapMemoryAllocatorBenchmark_4MB"
    var now = DateTime.now()
    var n = 10
    for (_ in 0..n) {
        allocate(4 * MB - 16, heapsize_4mb)
    }
    var end = DateTime.now()
    var cost = (end - now).toNanoseconds()
    printCostTime(n, cost, name)
}
