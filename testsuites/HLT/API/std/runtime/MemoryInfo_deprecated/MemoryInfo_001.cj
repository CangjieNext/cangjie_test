/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %export cjHeapSize=120mb && %run %run_opt %output %run_args
// ASSERT: scan struct 'MemoryInfo' is deprecated. All static Properties are converted to public funtions.

import std.runtime.*
import std.collection.*

class A {
    var test11 = 10
    var test22 = 20
    var test33 = 30
    var test44 = 40
    var test55 = 50
    var test66 = 60
    var test77 = 70
}

let test1 = A()
let test2 = A()
let test3 = A()
let test4 = A()
let test5 = A()
let test6 = A()
let test7 = A()

main(): Int64 {
    if (MemoryInfo.maxHeapSize != 125829120) {
        println("1: ${MemoryInfo.maxHeapSize}")
        return 1
    }
    if (MemoryInfo.allocatedHeapSize == 0) {
        println("2: ${MemoryInfo.allocatedHeapSize}")
        return 1
    }
    if (MemoryInfo.heapPhysicalMemory > MemoryInfo.maxHeapSize) {
        println("3: ${MemoryInfo.allocatedHeapSize}")
        println("4: ${MemoryInfo.heapPhysicalMemory}")
        return 1
    }

    var a = 0
    var b = 0
    var c = 0
    for (i in 0..10000) {
        a = MemoryInfo.maxHeapSize
        b = MemoryInfo.allocatedHeapSize
        c = MemoryInfo.heapPhysicalMemory
        if (a != 125829120) {
            println("5: ${a}")
            return 1
        }
        if (b > a) {
            println("6: ${b}")
            return 1
        }
        if (c > a) {
            println("7: ${c}")
            return 1
        }
    }

    if (MemoryInfo.allocatedHeapSize == 0) {
        println("8: ${MemoryInfo.allocatedHeapSize}")
        return 1
    }

    var list = ArrayList<A>()
    for (i in 0..10000) {
        list.add(A())
    }

    if (MemoryInfo.allocatedHeapSize == 0) {
        println("9: ${MemoryInfo.allocatedHeapSize}")
        return 1
    }

    return 0
}
