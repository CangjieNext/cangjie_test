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
// TIMEOUT: 1800

import std.io.*
import std.fs.*
import std.time.*
import std.convert.*
import std.posix.*


let nums: Array<Int64> =[64, 512, 4096, 32768, 262144, 2097152, 16777216]
let repeat: Array<Int64> =[1600000, 1600000, 1600000, 400000, 400000, 160000, 40000]
let nums_buffer: Array<Int64> =[256, 512, 1024, 2048]
let repeat_buffer: Array<Int64> =[640000, 1280000, 2000000, 4000000]

func getArray(len: Int64): Array<UInt8> {
    var array: Array<UInt8> = Array<UInt8>(len, repeat: 58)
    return array
}

func benchmarkWriteArray(num: Int64, reps: Int64): Duration {
    var array = getArray(num)
    var file = "BenchmarkWriteArray_n${num}.txt"
    var fs = File(file, Write)
    var startTime = DateTime.now()
    for (i in 0..reps) {
        fs.write(array)
        fs.seek(SeekPosition.Begin(0))
    }
    var endTime = DateTime.now()
    fs.close()
    remove(file, recursive: false)
    return endTime - startTime
}

func timeBenchmarkWriteArray(num: Int64, reps: Int64) {
    var perTime = Float64((benchmarkWriteArray(num, reps)).toNanoseconds()) / Float64(reps)
    println("BenchmarkWriteArrayN${num}: ${perTime.format(".2")} ns/op")
}

func benchmarkBufferWriteArray(num: Int64, reps: Int64): Duration {
    var array = getArray(num)
    var file = "BenchmarkBufferWriteArray_n${num}.txt"
    var fs = File(file, Write)
    var bufStream = BufferedOutputStream(fs)
    var flushCounter = 4096 / num
    var startTime = DateTime.now()
    for (i in 0..reps) {
        for (j in 0..flushCounter) {
            bufStream.write(array)
        }
		bufStream.flush()
    }
    var endTime = DateTime.now()
    fs.close()
    remove(file, recursive: false)
    return endTime - startTime
}

func timeBenchmarkBufferWriteArray(num: Int64, reps: Int64) {
    var perTime = Float64((benchmarkBufferWriteArray(num, reps)).toNanoseconds()) / Float64(reps)
    println("BenchmarkBufferWriteArrayN${num}: ${perTime.format(".2")} ns/op")
}

main(): Int64 {
    for (i in 0..nums.size) {
        timeBenchmarkWriteArray(nums[i], repeat[i])
    }
    for (i in 0..nums_buffer.size) {
        timeBenchmarkBufferWriteArray(nums_buffer[i], repeat_buffer[i])
    }
    return 0
}
