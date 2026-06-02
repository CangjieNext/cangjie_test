// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package GC

import std.runtime.*
import std.process

let KB = 1024
let MB = 1024 * 1024
var heapsize = {
    =>
    var temp = process.Process.current.getEnv("cjHeapSize") ?? "256";
    if (temp == "256") {
        return 256
    } else {
        return 0
    }
}()
var heapsize_4kb = Int64(Float64(heapsize) * 0.6) * 1024 / 4 - 1
var heapsize_4mb = Int64(Float64(heapsize) * 0.6) / 4 - 1
var debug = {
    =>
    var temp = process.Process.current.getEnv("GCDEBUG") ?? "false";
    if (temp == "false") {
        return false
    } else {
        return true
    }
}()

@When[backend == "cjnative"]
func getMemoryInfo() {
    var x = MemoryInfo.heapPhysicalMemory
    println("GetPhysicalMemorySize ${x}KB , ${Float64(x) / Float64(256 * 1024) * 100.0} %")
}

@When[backend != "cjnative"]
func getMemoryInfo() {
    // unsupported.
}

func printCostTime(n: Int64, cost: Int64, name: String) {
    var a = Float64(n) / Float64(cost) * 1000000000.0
    var b = Float64(cost) / 1000000000.0
    print("result: ${name}, ${a} ops/s , ${b} s.\n")
}
