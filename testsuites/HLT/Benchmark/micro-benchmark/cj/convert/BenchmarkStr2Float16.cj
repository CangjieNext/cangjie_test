/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt -O2 %overflow_wrapping --no-sub-pkg %cmp_utest_opt -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run %run_opt %output %run_utest_opt %run_args --bench --no-color

import std.convert.*
import std.io.*
import std.collection.*
import std.runtime.*

func setUp(num: Int64): ArrayList<String> {
    var floatArr = ArrayList<String>()
    for (i in 0..num) {
        let str = i.toString() + "." + i.toString()
        floatArr.add(str)
    }
    return floatArr
}

@Test
@Configure[minDuration: Duration.second * 3]
@Configure[warmup: Duration.second]
@Measure[TimeNow(Nanos)]
public class Test_Str2Float16 {

    @Strategy[len in [4096, 512, 64, 8]]
    func floatArray(len: Int64): ArrayList<String> {
        setUp(len)
    }

    @Bench[data in floatArray]
    func BenchmarkStr2Float16(data: ArrayList<String>): Unit {
        for (i in data) {
            blackBox(Float16.parse(i))
        }
    }
}