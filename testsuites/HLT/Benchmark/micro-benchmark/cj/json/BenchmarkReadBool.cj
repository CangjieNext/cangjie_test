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

func getReader():JsonReader {
    var out = ByteBuffer()
    var w = JsonWriter(out)
    w.startArray()
    for (_ in 0..reps) {
        w.writeValue<Bool>(false)
    }
    w.endArray()
    w.flush()
    return JsonReader(out)
}

func testReadBool(r: JsonReader) {
    r.startArray()
    while (let Some(v) <- r.peek()) {
        match(v) {
            case JsonBool => r.readValue<Bool>()
            case EndArray => r.endArray()
                                return
            case _ => r.skip()
        }
    }
}

func timeBenchmarkJsonReadBool() {
    var jw = getReader()

    var startTime = DateTime.now()
    testReadBool(jw)
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps/10)

    println("BenchmarkJsonReadBool_G10: " + perTime.format(".2") + " ns/op")
}

main(): Int64 {
    timeBenchmarkJsonReadBool()
    return 0
}