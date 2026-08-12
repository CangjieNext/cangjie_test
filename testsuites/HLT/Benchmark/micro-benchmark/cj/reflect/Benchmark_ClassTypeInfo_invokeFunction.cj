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
public class Test_ClassTypeInfo_InvokeFunction {
    func strategyBuilder_Instance(className: String) {
        @Strategy
        func strategy(): InstanceFunctionInfo {
            return ClassTypeInfo.get("default." + className).getInstanceFunction("foo1")
        }
        strategy
    }

    static let typeInfo: TypeInfo = TypeInfo.of(0)
    static let typeInfo_02: TypeInfo = TypeInfo.of(class_02())
    static let typeInfo_03: TypeInfo = TypeInfo.of(class_03())
    static let typeInfo_05: TypeInfo = TypeInfo.of(class_05<Int64>(10))

    @Bench[info in strategyBuilder_Instance("class_02")]
    func Benchmark_ClassTypeInfo_invokeFunction_commontype_Instance_apply(info: InstanceFunctionInfo): Unit {
        blackBox(info.apply(class_02(), []))
    }

    @Bench[info in strategyBuilder_Instance("class_03")]
    func Benchmark_ClassTypeInfo_invokeFunction_inherittype_Instance_apply(info: InstanceFunctionInfo): Unit {
        blackBox(info.apply(class_03(), []))
    }

    @Bench[info in strategyBuilder_Instance("class_05<Int64>")]
    func Benchmark_ClassTypeInfo_invokeFunction_generic_commontype_Instance_apply(info: InstanceFunctionInfo): Unit {
        blackBox(info.apply(class_05<Int64>(-1), []))
    }

    func strategyBuilder_Static(className: String) {
        @Strategy
        func strategy(): StaticFunctionInfo {
            return ClassTypeInfo.get("default." + className).getStaticFunction("foo2")
        }
        strategy
    }

    func strategyBuilder_Static_Generics(className: String) {
        @Strategy
        func strategy(): StaticFunctionInfo {
            return ClassTypeInfo.get("default." + className).getStaticFunction("foo2", typeInfo)
        }
        strategy
    }

    @Bench[info in strategyBuilder_Static("class_02")]
    func Benchmark_ClassTypeInfo_invokeFunction_commontype_Static_apply(info: StaticFunctionInfo): Unit {
        blackBox(info.apply(typeInfo_02, []))
    }

    @Bench[info in strategyBuilder_Static("class_03")]
    func Benchmark_ClassTypeInfo_invokeFunction_inherittype_Static_apply(info: StaticFunctionInfo): Unit {
        blackBox(info.apply(typeInfo_03, []))
    }

    @Bench[info in strategyBuilder_Static_Generics("class_05<Int64>")]
    func Benchmark_ClassTypeInfo_invokeFunction_generic_commontype_Static_apply(info: StaticFunctionInfo): Unit {
        blackBox(info.apply(typeInfo_05, [10]))
    }
}