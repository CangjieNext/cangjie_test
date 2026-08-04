/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: ../../script/data/io/
// EXEC: cp io/*  ./
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping --no-sub-pkg -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run %run_opt %output %run_utest_opt %run_args


import std.fs.File
import std.io.ByteBuffer
import std.io.InputStream
import std.io.OutputStream
import std.io.StringReader
import std.io.SeekPosition
import std.time.DateTime
import std.convert.*

var filenames = ["galsworthy", "guanzhongluo", "tolstoy"]

func count_by_1(inputStream : InputStream): (Int64, String) {
    let input = StringReader(inputStream)
    var count = 0
    while (input.read().isSome()) {
        count++
    }
    return (count, "count_by_1")
}

func count_all(inputStream : InputStream): (Int64, String) {
    let input = StringReader(inputStream)
    let content = input.readToEnd()
    return (content.size, "count_all")
}

func count_lines(inputStream : InputStream): (Int64, String) {
    let input = StringReader(inputStream)
    var count = 0
    while (true) {
        match (input.readln()) {
            case None => break
            case Some(s) => count += s.size
        }
    }
    return (count, "count_lines")
}

func test(name: String, count_fun: (InputStream) -> (Int64, String), N: Int64): Unit {
    let arr = File.readFrom(name + ".txt")
    let inputStream = ByteBuffer()
    inputStream.write(arr)
    let time0 = DateTime.now()
    var len = 0
    var mode = ""
    for (_ in 0..N) {
        inputStream.seek(Begin(0))
        (len, mode) = count_fun(inputStream)
    }
    let time1 = DateTime.now()
    let time = time1 - time0
    let perTime = Float64 (time.toNanoseconds()) / Float64 (N)
    println("BenchmarkReadUTF8_${mode}_${name}: ${perTime.format(".2")} ns/op")
}

main() {
    let N = 100
    for (name in filenames) {
        test(name, count_by_1, N)
        test(name, count_all, N)
        test(name, count_lines, N)
    }
}
