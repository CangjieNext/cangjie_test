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
class testGetInstanceFunctions_StandardClassType_15 {
    @TestCase
    func TestCase_74(): Unit {
        // logger.info("testcase TestCase_74 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int8, UInt64, Float64>>().getInstanceFunctions("classInstanceMemberFunction_75").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int8, UInt64, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
            .apply(StandardClassType<Int8, UInt64, Float64>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()],
                [GenericClassWith2TypeParameters<Bool, Bool>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#2287: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#2288: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2289: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(StandardClassType<Int8, UInt64, Float64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2290: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#2291: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2292: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(StandardClassType<Int8, UInt64, Float64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#2293: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2294: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#2295: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#2296: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(StandardClassType<Int8, UInt64, Float64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#2297: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(StandardClassType<Int8, UInt64, Float64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#2298: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#2299: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#2300: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(StandardClassType<Int8, UInt64, Float64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#2301: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(StandardClassType<Int8, UInt64, Float64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#2302: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(StandardClassType<Int8, UInt64, Float64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2303: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(StandardClassType<Int8, UInt64, Float64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#2304: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(StandardClassType<Int8, UInt64, Float64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2305: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(StandardClassType<Int8, UInt64, Float64>(), [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#2306: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#2307: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#2308: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(StandardClassType<Int8, UInt64, Float64>(), [])
            @Expect("assertion#2309: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2310: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply("hello", [])
            @Expect("assertion#2311: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(StandardClassType<Int8, UInt64, Float64>(), [])
            @Expect("assertion#2312: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2313: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply("hello", [])
            @Expect("assertion#2314: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(StandardClassType<Int8, UInt64, Float64>(),
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#2315: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#2316: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#2317: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(StandardClassType<Int8, UInt64, Float64>(), [()])
            @Expect("assertion#2318: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2319: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2320: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_74 ends.")
    }
}
