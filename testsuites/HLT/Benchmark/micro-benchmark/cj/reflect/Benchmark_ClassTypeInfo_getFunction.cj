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
public class Test_ClassTypeInfo_GetFunction {
    func strategyBuilder(className: String) {
        @Strategy
        func strategy(): ClassTypeInfo {
            return ClassTypeInfo.get("default." + className)
        }
        strategy
    }

    static let typeInfo: TypeInfo = TypeInfo.of(0)

    @Bench[info in strategyBuilder("class_02")]
    func Benchmark_ClassTypeInfo_getFunction_commontype_Instance(info: ClassTypeInfo): Unit {
        blackBox(info.getInstanceFunction("foo1", []))
    }

    @Bench[info in strategyBuilder("class_03")]
    func Benchmark_ClassTypeInfo_getFunction_inherittype_Instance(info: ClassTypeInfo): Unit {
        blackBox(info.getInstanceFunction("foo1", []))
    }

    @Bench[info in strategyBuilder("class_05<Int64>")]
    func Benchmark_ClassTypeInfo_getFunction_generic_commontype_Instance(info: ClassTypeInfo): Unit {
        blackBox(info.getInstanceFunction("foo1", []))
    }

    @Bench[info in strategyBuilder("class_02")]
    func Benchmark_ClassTypeInfo_getFunction_commontype_Static(info: ClassTypeInfo): Unit {
        blackBox(info.getStaticFunction("foo2", []))
    }

    @Bench[info in strategyBuilder("class_03")]
    func Benchmark_ClassTypeInfo_getFunction_inherittype_Static(info: ClassTypeInfo): Unit {
        blackBox(info.getStaticFunction("foo2", []))
    }

    @Bench[info in strategyBuilder("class_05<Int64>")]
    func Benchmark_ClassTypeInfo_getFunction_generic_commontype_Static(info: ClassTypeInfo): Unit {
        blackBox(info.getStaticFunction("foo2", [typeInfo]))
    }
}