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
import std.collection.*
import std.random.*

let reps =[1000000, 1000000, 1000000, 1000000, 1000000, 1000000, 100000, 10000, 10000]
let string_size = [4, 8, 16, 64, 256, 1024, 4 * 1024, 16 * 1024, 128 * 1024]
let random = Random()

func buildString(length: Int64): String {
    var str = StringBuilder(length)
    var characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    for (i in 0..length) {
        var index = Int64(random.nextUInt64(62))
        str.append(characters[index..index+1])
    }
    return str.toString()
}

func getReader(n: Int64, length: Int64): JsonReader {
    var out = ByteBuffer()
    var w = JsonWriter(out)
    var str = buildString(length)
    w.startArray()
    for (_ in 0..n) {
        w.writeValue(str)
    }
    w.endArray()
    w.flush()
    return JsonReader(out)
}

func testReadStrings(r: JsonReader) {
    r.startArray()
    while (let Some(v) <- r.peek()) {
        match(v) {
            case JsonString => r.readValue<String>()
            case EndArray => r.endArray()
                                return
            case _ => r.skip()
        }
    }
}

func timeBenchmarkJsonReadString(rep: Int64, length: Int64) {
    var jr = getReader(rep, length)
    var startTime = DateTime.now()
    testReadStrings(jr)
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(rep/10)
    println("BenchmarkJsonReadString_G10_${length}: " + perTime.format(".2") + " ns/op")
}

main(): Int64 {
    for (i in 0..9) {
        timeBenchmarkJsonReadString(reps[i], string_size[i])
    }
    return 0
}