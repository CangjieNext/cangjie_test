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
class testGetInstanceFunctions_StandardClassType_14 {
    @TestCase
    func TestCase_66(): Unit {
        // logger.info("testcase TestCase_66 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, UInt16, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_67").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt32, UInt16, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
            .apply(StandardClassType<UInt32, UInt16, UInt16>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()],
                [GenericClassWith1TypeParameters<Unit>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2015: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2016: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2017: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt16>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2018: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#2019: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2020: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt16>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2021: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2022: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2023: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int32>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2024: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2025: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#2026: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#2027: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#2028: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2029: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt16>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2030: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt16>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2031: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2032: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2033: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt16>(), [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2034: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2035: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2036: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt16>(), [])
            @Expect("assertion#2037: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2038: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply("hello", [])
            @Expect("assertion#2039: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt16>(), [])
            @Expect("assertion#2040: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2041: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply("hello", [])
            @Expect("assertion#2042: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt16>(),
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2043: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2044: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2045: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt16>(), [()])
            @Expect("assertion#2046: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2047: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2048: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_66 ends.")
    }
}
