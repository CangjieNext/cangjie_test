/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %import-cangjie-stdx -O2 %overflow_wrapping --no-sub-pkg %cmp_utest_opt -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run_stdx %output %run_utest_opt %run_args --bench --no-color

import stdx.encoding.json.stream.*
import std.io.*
import std.time.*
import std.collection.*
import std.random.*
import std.unittest.*

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

func repFor(len: Int64): Int64 {
    if (len <= 1024) {
        1000000
    } else if (len == 4096) {
        100000
    } else {
        10000
    }
}

func testWriteStrings(w: JsonWriter, n: Int64, str: String) {
    w.startArray()
    for (_ in 0..n) {
        w.writeValue(str)
    }
    w.endArray()
    w.flush()
}

func getWriter(): JsonWriter {
    var out = ByteBuffer()
    return JsonWriter(out)
}

@Test
@Configure[minDuration: Duration.second * 3]
@Configure[warmup: Duration.second]
@Measure[TimeNow(Nanos)]
public class Test_Json_Write_String {

    @Strategy[len in [4, 8, 16, 64, 256, 1024, 4096, 16384, 131072]]
    func writerData(len: Int64): GenerateEachInputProvider<(JsonWriter, String, Int64)> {
        GenerateEachInputProvider { => (getWriter(), buildString(len), repFor(len)) }
    }

    @Bench[data in writerData]
    func BenchmarkJsonWriteString_G10(data: (JsonWriter, String, Int64)): Unit {
        testWriteStrings(data[0], data[2], data[1])
    }
}