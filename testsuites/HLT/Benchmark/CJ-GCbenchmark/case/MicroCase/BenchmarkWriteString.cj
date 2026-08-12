/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %optimization_level_2 --no-sub-pkg %f -o %output
// RUN-EXEC: %export cjHeapSize=512mb && %run_stdx %output %run_args 2>&1 | compare %f
// ASSERT: scan ms

import stdx.encoding.json.stream.*
import std.io.*
import std.time.*
import std.convert.*
import std.collection.*
import std.sync.*

let reps =[100000, 10000, 10000]
let paramValues =[16, 64, 256]

func buildList(): ArrayList<String> {
    return ArrayList<String>(["a", "B", "c", "D"])
}

func buildString(length: Int64): String {
    var str = StringBuilder(length)
    var list = buildList()
    for (i in 0..length) {
        str.append(list[i % list.size])
    }
    return str.toString()
}

func testWriteStrings(w: JsonWriter, n: Int64, str: String) {
    w.startArray()
    for (_ in 0..n) {
        w.writeValue(str)
    }
    w.endArray()
    w.flush()
}

func getWriter():JsonWriter {
    var out = ByteBuffer()
    return JsonWriter(out)
}

func timeBenchmarkJsonWriteString(size: Int64, n: Int64) {
    var jw = getWriter()
    var str = buildString(size)
    testWriteStrings(jw, n, str)
}

main(): Int64 {
    var startTime = DateTime.now()
    for (i in 0..3) {
        sleep(Duration.second)
        timeBenchmarkJsonWriteString(paramValues[i], reps[i])
    }
    var perTime = Float64((DateTime.now() - startTime).toNanoseconds())
    println("BenchmarkWriteString: ms = ${perTime / 1000000.0}")
    return 0
}