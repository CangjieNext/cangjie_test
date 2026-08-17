/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1 
// DEPENDENCE: dependency
// EXEC: %compiler %cmp_opt %compile_library dependency/*.cj -o libdependency.%library_suffix
// EXEC: %compiler %cmp_opt -L. -ldependency %f %cmp_utest_opt -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args  
package testsuite

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import std.reflect.*
import dependency.*

@Test
class testGetInstanceFunctions_StandardClassType_16 {
    @TestCase
    func TestCase_78(): Unit {
        // logger.info("testcase TestCase_78 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, Float32, UInt8>>().getInstanceFunctions("classInstanceMemberFunction_79").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float32, Float32, UInt8>>()
            .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
            .apply(StandardClassType<Float32, Float32, UInt8>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()],
                [GenericClassWith2TypeParameters<UInt8, UInt8>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#2423: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#2424: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2425: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(StandardClassType<Float32, Float32, UInt8>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2426: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#2427: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2428: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(StandardClassType<Float32, Float32, UInt8>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#2429: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2430: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#2431: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#2432: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(StandardClassType<Float32, Float32, UInt8>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#2433: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(StandardClassType<Float32, Float32, UInt8>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#2434: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#2435: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#2436: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(StandardClassType<Float32, Float32, UInt8>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#2437: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(StandardClassType<Float32, Float32, UInt8>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#2438: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(StandardClassType<Float32, Float32, UInt8>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2439: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(StandardClassType<Float32, Float32, UInt8>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#2440: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(StandardClassType<Float32, Float32, UInt8>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2441: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(StandardClassType<Float32, Float32, UInt8>(), [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#2442: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#2443: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#2444: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(StandardClassType<Float32, Float32, UInt8>(), [])
            @Expect("assertion#2445: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2446: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply("hello", [])
            @Expect("assertion#2447: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(StandardClassType<Float32, Float32, UInt8>(), [])
            @Expect("assertion#2448: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2449: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply("hello", [])
            @Expect("assertion#2450: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(StandardClassType<Float32, Float32, UInt8>(),
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#2451: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#2452: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#2453: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(StandardClassType<Float32, Float32, UInt8>(), [()])
            @Expect("assertion#2454: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2455: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2456: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_78 ends.")
    }
}
