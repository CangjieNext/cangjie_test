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
class testGetInstanceFunctions_StandardClassType_20 {
    @TestCase
    func TestCase_95(): Unit {
        // logger.info("testcase TestCase_95 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, UInt8, Float32>>().getInstanceFunctions("classInstanceMemberFunction_96").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int64, UInt8, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
            .apply(StandardClassType<Int64, UInt8, Float32>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()],
                [GenericStructWith1TypeParameters<UInt8>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#3001: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()],
                    [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#3002: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#3003: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(StandardClassType<Int64, UInt8, Float32>(), [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#3004: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply("hello",
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#3005: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#3006: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(StandardClassType<Int64, UInt8, Float32>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#3007: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#3008: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#3009: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()],
                    [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#3010: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(StandardClassType<Int64, UInt8, Float32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#3011: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(StandardClassType<Int64, UInt8, Float32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#3012: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#3013: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#3014: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(StandardClassType<Int64, UInt8, Float32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#3015: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(StandardClassType<Int64, UInt8, Float32>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#3016: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(StandardClassType<Int64, UInt8, Float32>(), [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#3017: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(StandardClassType<Int64, UInt8, Float32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#3018: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(StandardClassType<Int64, UInt8, Float32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#3019: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(StandardClassType<Int64, UInt8, Float32>(), [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#3020: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#3021: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#3022: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(StandardClassType<Int64, UInt8, Float32>(), [])
            @Expect("assertion#3023: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3024: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply("hello", [])
            @Expect("assertion#3025: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(StandardClassType<Int64, UInt8, Float32>(), [])
            @Expect("assertion#3026: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3027: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply("hello", [])
            @Expect("assertion#3028: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(StandardClassType<Int64, UInt8, Float32>(),
                    [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#3029: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#3030: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#3031: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(StandardClassType<Int64, UInt8, Float32>(), [()])
            @Expect("assertion#3032: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3033: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3034: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_95 ends.")
    }
}
