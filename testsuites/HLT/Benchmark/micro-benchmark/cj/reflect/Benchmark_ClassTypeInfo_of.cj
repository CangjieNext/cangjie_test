/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: ./benchmark_classes.cj
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping --no-sub-pkg %cmp_utest_opt -Woff=all %f benchmark_classes.cj -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run %run_opt %output %run_utest_opt %run_args --bench --no-color

import std.collection.*
import std.reflect.*
import std.runtime.*

@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class Test_ClassTypeInfo_Of {
    @Bench
    func Benchmark_ClassTypeInfo_of_basetype(): Unit {
        blackBox(ClassTypeInfo.of(class_01()))
    }

    @Bench
    func Benchmark_ClassTypeInfo_of_commontype(): Unit {
        blackBox(ClassTypeInfo.of(class_02()))
    }

    @Bench
    func Benchmark_ClassTypeInfo_of_inherittype(): Unit {
        blackBox(ClassTypeInfo.of(class_03()))
    }

    @Bench
    func Benchmark_ClassTypeInfo_of_generic_basetype(): Unit {
        blackBox(ClassTypeInfo.of(class_04<Int64>()))
    }

    @Bench
    func Benchmark_ClassTypeInfo_of_generic_commontype(): Unit {
        blackBox(ClassTypeInfo.of(class_05<Int64>(10)))
    }
}