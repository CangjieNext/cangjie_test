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
class testGetInstanceFunctions_StandardStructType_16 {
    @TestCase
    func TestCase_186(): Unit {
        // logger.info("testcase TestCase_186 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int16, Int64, UInt8>>().getInstanceFunctions("classInstanceMemberFunction_187").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int16, Int64, UInt8>>()
            .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
            .apply(StandardStructType<Int16, Int64, UInt8>(),
                [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                [GenericClassWith2TypeParameters<Int64, Int64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#5866: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#5867: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#5868: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(StandardStructType<Int16, Int64, UInt8>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#5869: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5870: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#5871: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(StandardStructType<Int16, Int64, UInt8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5872: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5873: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#5874: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#5875: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(StandardStructType<Int16, Int64, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#5876: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(StandardStructType<Int16, Int64, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#5877: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#5878: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#5879: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(StandardStructType<Int16, Int64, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#5880: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(StandardStructType<Int16, Int64, UInt8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5881: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(StandardStructType<Int16, Int64, UInt8>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#5882: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(StandardStructType<Int16, Int64, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#5883: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(StandardStructType<Int16, Int64, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5884: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(StandardStructType<Int16, Int64, UInt8>(), [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#5885: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#5886: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#5887: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(StandardStructType<Int16, Int64, UInt8>(), [])
            @Expect("assertion#5888: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5889: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply("hello", [])
            @Expect("assertion#5890: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(StandardStructType<Int16, Int64, UInt8>(), [])
            @Expect("assertion#5891: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5892: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply("hello", [])
            @Expect("assertion#5893: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(StandardStructType<Int16, Int64, UInt8>(),
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#5894: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#5895: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#5896: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(StandardStructType<Int16, Int64, UInt8>(), [()])
            @Expect("assertion#5897: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5898: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_187")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5899: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_186 ends.")
    }
}
