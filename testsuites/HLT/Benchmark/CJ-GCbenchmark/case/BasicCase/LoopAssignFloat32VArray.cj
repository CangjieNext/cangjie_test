/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// (LLVM) EXEC: %compiler %cmp_opt %optimization_level_2 --no-sub-pkg %f -o %output
// (LLVM) RUN-EXEC: %export cjHeapSize=512mb && %run %run_opt %output %run_args 2>&1 | compare %f
// (LLVM) ASSERT: scan ms

import std.time.*
import std.collection.*
import std.sync.*

main() : Unit {
    var startTime = DateTime.now()
    sleep(Duration.second * 1)
    var className1 = VArray<Float32, $5000000>({i => Float32(i)})
    var className2 = VArray<Float32, $5000000>({i => Float32(i)})
    for ( i in 0..5000000) {
        className1[i] = Float32(i)
        className2[i] = Float32(i)
    }
    var num_total = 0
    sleep(Duration.second * 1)
    num_total = num_total + className1.size + className2.size
    var endTime = DateTime.now()
    println("LoopAssignFloat32VArray: ms = ${Float64((endTime - startTime).toNanoseconds()) / 1000000.0}")
    println(num_total)
    return 
}