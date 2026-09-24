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
import std.sync.*
import std.time.*
import std.runtime.*
import std.unittest.*

@Test
@Configure[minDuration: Duration.second * 3]
@Configure[warmup: Duration.second]
@Measure[TimeNow(Nanos)]
public class Test_AtomicAddInt32 {

    @Strategy
    func atomicData(): GenerateEachInputProvider<AtomicInt32> {
        GenerateEachInputProvider { => AtomicInt32(0) }
    }

    @Bench[data in atomicData]
    func BenchmarkAtomicAddInt32(data: AtomicInt32): Unit {
        blackBox(data.fetchAdd(1))
    }
}
