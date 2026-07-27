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

import stdx.encoding.json.stream.*
import std.io.*
import std.time.*
import std.convert.*

let reps = 1000000

func testWriteBool(w: JsonWriter, n: Int64) {
    w.startArray()
    for (_ in 0..n) {
        w.writeValue<Bool>(true)
    }
    w.endArray()
    w.flush()
}

func getWriter():JsonWriter {
    var out = ByteBuffer()
    return JsonWriter(out)
}

func timeBenchmarkJsonWriteBool() {
    var jw = getWriter()

    var startTime = DateTime.now()
    testWriteBool(jw, reps)
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps/10)

    println("BenchmarkJsonWriteBool_G10: " + perTime.format(".2") + " ns/op")
}

main(): Int64 {
    timeBenchmarkJsonWriteBool()
    return 0
}