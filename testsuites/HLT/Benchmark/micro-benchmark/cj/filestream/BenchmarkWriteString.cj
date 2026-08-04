/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %import-cangjie-stdx %optimization_level_2 %overflow_wrapping --no-sub-pkg -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run_stdx %output %run_utest_opt %run_args

import std.io.*
import std.fs.*
import std.time.*
import std.convert.*
import std.posix.*


let nums: Array<Int64> =[64, 512, 4096, 32768, 262144, 2097152, 16777216]
let repeat: Array<Int64> =[800000, 800000, 600000, 400000, 100000, 50000, 10000]

func getString(len: Int64): String {
    var array: Array<Rune> = Array<Rune>(len, repeat: r'1')
    var data: String = String(array)
    return data
}

func benchmarkWriteString(num: Int64, reps: Int64): Duration {
    var str = getString(num)
    var file = "BenchmarkWriteString_n${num}.txt"
    var f: File = File(file, Write)
    var startTime = DateTime.now()
    for (i in 0..reps) {
        f.write(unsafe { str.rawData() })
        f.seek(SeekPosition.Begin(0))
    }
    var endTime = DateTime.now()
    f.close()
    remove(file, recursive: false)
    return endTime - startTime
}

func timeBenchmarkWriteString(num: Int64, reps: Int64) {
    var perTime = Float64((benchmarkWriteString(num, reps)).toNanoseconds()) / Float64(reps)
    println("BenchmarkWriteStringN${num}: ${perTime.format(".2")} ns/op")
}

main(): Int64 {
    for (i in 0..nums.size) {
        timeBenchmarkWriteString(nums[i], repeat[i])
    }
    return 0
}
