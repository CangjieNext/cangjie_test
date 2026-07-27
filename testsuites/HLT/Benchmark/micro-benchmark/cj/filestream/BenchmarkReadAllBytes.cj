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
let repeat: Array<Int64> =[15000, 15000, 12000, 10000, 7000, 3500, 800]
let numsBuffer: Array<Int64> =[256, 512, 1024, 2048]
let repeatBuffer: Array<Int64> =[5120000, 5120000, 2560000, 1280000]

func creatFile(name: String, num: Int64) {
    var array: Array<UInt8> = Array<UInt8>(num, repeat: 58)
	File.writeTo(name ,array)
    return
}

func benchmarkReadAllBytes(num: Int64, reps: Int64): Duration {
    var file = "BenchmarkReadAllBytes_n${num}.txt"
    creatFile(file, num)
    var f: File = File(file, Read)
    var startTime = DateTime.now()
    for (i in 0..reps) {
        f.seek(SeekPosition.Begin(0))
        readToEnd(f)
    }
    var endTime = DateTime.now()
    f.close()
    remove(file, recursive: false)
    return endTime - startTime
}

func timeBenchmarkReadAllBytes(num: Int64, reps: Int64) {
    var perTime = Float64((benchmarkReadAllBytes(num, reps)).toNanoseconds()) / Float64(reps)
    println("BenchmarkReadAllBytesN${num}: ${perTime.format(".2")} ns/op")
}

func benchmarkBufferRead(num: Int64, reps: Int64): Duration {
    let bufferSize = 4096
    var flushTimes = bufferSize / num
    var name = "temp.txt"
    creatFile(name, bufferSize)
    var array: Array<UInt8> = Array<UInt8>(num, repeat: 0)
    var f: File = File(name, Read)
    var bufferFs: BufferedInputStream<File> = BufferedInputStream(f)

    var startTime = DateTime.now()
    for (i in 0..reps) {
        for (j in 0..flushTimes) {
            bufferFs.read(array)
        }
        f.seek(SeekPosition.Begin(0))
    }
    var endTime = DateTime.now()
    f.close()
    remove(name, recursive: false)
    return endTime - startTime
}

func timeBenchmarkBufferRead(num: Int64, reps: Int64) {
    var perTime = Float64((benchmarkBufferRead(num, reps)).toNanoseconds()) / Float64(reps)
    println("BenchmarkBufferReadN${num}: ${perTime.format(".2")} ns/op")
}

main(): Int64 {
    for (i in 0..nums.size) {
        timeBenchmarkReadAllBytes(nums[i], repeat[i])
    }
    for (i in 0..numsBuffer.size) {
        timeBenchmarkBufferRead(numsBuffer[i], repeatBuffer[i])
    }
    return 0
}
