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
class testGetInstanceFunctions_StandardClassType_19 {
    @TestCase
    func TestCase_90(): Unit {
        // logger.info("testcase TestCase_90 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Unit, Float32, Int32>>().getInstanceFunctions("classInstanceMemberFunction_91").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Unit, Float32, Int32>>()
            .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
            .apply(StandardClassType<Unit, Float32, Int32>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [NonGenericStruct()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [NonGenericStruct()])
            @Expect("assertion#2831: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [NonGenericStruct()])
            @Expect("assertion#2832: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#2833: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(StandardClassType<Unit, Float32, Int32>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#2834: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2835: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#2836: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(StandardClassType<Unit, Float32, Int32>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2837: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2838: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2839: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2840: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(StandardClassType<Unit, Float32, Int32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2841: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(StandardClassType<Unit, Float32, Int32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#2842: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#2843: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#2844: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(StandardClassType<Unit, Float32, Int32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#2845: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(StandardClassType<Unit, Float32, Int32>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2846: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(StandardClassType<Unit, Float32, Int32>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#2847: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(StandardClassType<Unit, Float32, Int32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2848: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(StandardClassType<Unit, Float32, Int32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2849: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(StandardClassType<Unit, Float32, Int32>(), [NonGenericStruct()])
            @Expect("assertion#2850: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#2851: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#2852: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(StandardClassType<Unit, Float32, Int32>(), [])
            @Expect("assertion#2853: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2854: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply("hello", [])
            @Expect("assertion#2855: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(StandardClassType<Unit, Float32, Int32>(), [])
            @Expect("assertion#2856: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2857: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply("hello", [])
            @Expect("assertion#2858: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(StandardClassType<Unit, Float32, Int32>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2859: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2860: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2861: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(StandardClassType<Unit, Float32, Int32>(), [()])
            @Expect("assertion#2862: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2863: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2864: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_90 ends.")
    }
}
