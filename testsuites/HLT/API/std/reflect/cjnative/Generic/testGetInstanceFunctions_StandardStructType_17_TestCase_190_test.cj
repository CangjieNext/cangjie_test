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
class testGetInstanceFunctions_StandardStructType_17 {
    @TestCase
    func TestCase_190(): Unit {
        // logger.info("testcase TestCase_190 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float32, UInt32, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_191").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float32, UInt32, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
            .apply(StandardStructType<Float32, UInt32, UInt64>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()],
                [GenericClassWith2TypeParameters<Int16, Int16>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#6002: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#6003: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6004: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6005: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6006: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6007: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#6008: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6009: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#6010: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#6011: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#6012: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#6013: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#6014: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#6015: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#6016: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#6017: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6018: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#6019: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6020: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#6021: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#6022: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#6023: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [])
            @Expect("assertion#6024: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6025: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply("hello", [])
            @Expect("assertion#6026: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [])
            @Expect("assertion#6027: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6028: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply("hello", [])
            @Expect("assertion#6029: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(),
                    [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#6030: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#6031: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#6032: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [()])
            @Expect("assertion#6033: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6034: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6035: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_190 ends.")
    }
}
