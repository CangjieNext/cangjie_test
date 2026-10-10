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

import stdx.encoding.json.*
import std.fs.*
import std.time.*
import std.convert.*
import std.io.*
import std.runtime.*

let dataPath = "../../script/data/json/"
let tags = ["n8d1", "n8d2", "n8d4", "n8d8", "n64d1", "n64d2", "n64d4", "n64d8", "n512d1", "n512d2", "n512d4"]

func setUp(f: String): String {
    var fs = File(f, Read)
    var data = String.fromUtf8(readToEnd(fs))
    fs.close()
    return data
}

@Test
@Configure[minDuration: Duration.second * 3]
@Configure[warmup: Duration.second]
@Measure[TimeNow(Nanos)]
public class Test_Str2JsonValue {

    @Strategy[tag in ["n8d1", "n8d2", "n8d4", "n8d8", "n64d1", "n64d2", "n64d4", "n64d8", "n512d1", "n512d2", "n512d4"]]
    func jsonData(tag: String): String {
        setUp(dataPath + tag + ".json")
    }

    @Bench[data in jsonData]
    func BenchmarkStr2JsonValue(data: String): Unit {
        blackBox(JsonValue.fromStr(data))
    }
}