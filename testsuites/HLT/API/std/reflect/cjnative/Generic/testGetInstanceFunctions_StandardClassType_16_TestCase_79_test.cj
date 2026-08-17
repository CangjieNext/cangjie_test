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
    func TestCase_79(): Unit {
        // logger.info("testcase TestCase_79 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt8, Int8, Float64>>().getInstanceFunctions("classInstanceMemberFunction_80").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt8, Int8, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
            .apply(StandardClassType<UInt8, Int8, Float64>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                [GenericClassWith2TypeParameters<Float64, Float64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                    [GenericClassWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#2457: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#2458: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#2459: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(StandardClassType<UInt8, Int8, Float64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#2460: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#2461: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#2462: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(StandardClassType<UInt8, Int8, Float64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#2463: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2464: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                    [GenericClassWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#2465: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#2466: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(StandardClassType<UInt8, Int8, Float64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#2467: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(StandardClassType<UInt8, Int8, Float64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#2468: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#2469: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#2470: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(StandardClassType<UInt8, Int8, Float64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#2471: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(StandardClassType<UInt8, Int8, Float64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#2472: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(StandardClassType<UInt8, Int8, Float64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#2473: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(StandardClassType<UInt8, Int8, Float64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                    [GenericClassWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#2474: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(StandardClassType<UInt8, Int8, Float64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2475: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(StandardClassType<UInt8, Int8, Float64>(), [GenericClassWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#2476: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#2477: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#2478: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(StandardClassType<UInt8, Int8, Float64>(), [])
            @Expect("assertion#2479: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2480: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply("hello", [])
            @Expect("assertion#2481: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(StandardClassType<UInt8, Int8, Float64>(), [])
            @Expect("assertion#2482: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2483: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply("hello", [])
            @Expect("assertion#2484: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(StandardClassType<UInt8, Int8, Float64>(),
                    [GenericClassWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#2485: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#2486: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#2487: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(StandardClassType<UInt8, Int8, Float64>(), [()])
            @Expect("assertion#2488: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2489: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2490: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_79 ends.")
    }
}
