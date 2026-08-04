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
public class Test_ClassTypeInfo_Get_Set {
    func strategyBuilder_Instance(className: String) {
        @Strategy
        func strategy(): InstanceVariableInfo {
            return ClassTypeInfo.get("default." + className).getInstanceVariable("v1")
        }
        strategy
    }

    @Bench[info in strategyBuilder_Instance("class_02")]
    func Benchmark_ClassTypeInfo_getset_commontype_Instance_getValue(info: InstanceVariableInfo): Unit {
        blackBox(info.getValue(class_02()))
    }

    @Bench[info in strategyBuilder_Instance("class_05<Int64>")]
    func Benchmark_ClassTypeInfo_getset_generic_commontype_Instance_getValue(info: InstanceVariableInfo): Unit {
        blackBox(info.getValue(class_05<Int64>(-1)))
    }

    @Bench[info in strategyBuilder_Instance("class_02")]
    func Benchmark_ClassTypeInfo_getset_commontype_Instance_setValue(info: InstanceVariableInfo): Unit {
        blackBox(info.setValue(class_02(), 10))
    }

    @Bench[info in strategyBuilder_Instance("class_05<Int64>")]
    func Benchmark_ClassTypeInfo_getset_generic_commontype_Instance_setValue(info: InstanceVariableInfo): Unit {
        blackBox(info.setValue(class_05<Int64>(-1), 10))
    }

    func strategyBuilder_Static(className: String) {
        @Strategy
        func strategy(): StaticVariableInfo {
            return ClassTypeInfo.get("default." + className).getStaticVariable("v2")
        }
        strategy
    }

    @Bench[info in strategyBuilder_Static("class_02")]
    func Benchmark_ClassTypeInfo_getset_commontype_Static_getValue(info: StaticVariableInfo): Unit {
        blackBox(info.getValue())
    }

    @Bench[info in strategyBuilder_Static("class_05<Int64>")]
    func Benchmark_ClassTypeInfo_getset_generic_commontype_Static_getValue(info: StaticVariableInfo): Unit {
        blackBox(info.getValue())
    }

    @Bench[info in strategyBuilder_Static("class_02")]
    func Benchmark_ClassTypeInfo_getset_commontype_Static_setValue(info: StaticVariableInfo): Unit {
        blackBox(info.setValue("10"))
    }

    @Bench[info in strategyBuilder_Static("class_05<Int64>")]
    func Benchmark_ClassTypeInfo_getset_generic_commontype_Static_setValue(info: StaticVariableInfo): Unit {
        blackBox(info.setValue(10))
    }
}