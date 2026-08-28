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
class testGetInstanceFunctions_StandardStructType_11 {
    @TestCase
    func TestCase_159(): Unit {
        // logger.info("testcase TestCase_159 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, Int64, UInt8>>().getInstanceFunctions("classInstanceMemberFunction_160").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt8, Int64, UInt8>>()
            .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
            .apply(StandardStructType<UInt8, Int64, UInt8>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [123i64])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [123i64])
            @Expect("assertion#4948: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [123i64])
            @Expect("assertion#4949: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#4950: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(StandardStructType<UInt8, Int64, UInt8>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#4951: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#4952: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#4953: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(StandardStructType<UInt8, Int64, UInt8>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#4954: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#4955: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [123i64, 114.514000f64])
            @Expect("assertion#4956: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [123i64, 114.514000f64])
            @Expect("assertion#4957: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(StandardStructType<UInt8, Int64, UInt8>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [123i64, 114.514000f64])
            @Expect("assertion#4958: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(StandardStructType<UInt8, Int64, UInt8>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [114.514000f64])
            @Expect("assertion#4959: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [114.514000f64])
            @Expect("assertion#4960: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [114.514000f64])
            @Expect("assertion#4961: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(StandardStructType<UInt8, Int64, UInt8>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [123i64])
            @Expect("assertion#4962: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(StandardStructType<UInt8, Int64, UInt8>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#4963: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(StandardStructType<UInt8, Int64, UInt8>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#4964: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(StandardStructType<UInt8, Int64, UInt8>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [123i64, 114.514000f64])
            @Expect("assertion#4965: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(StandardStructType<UInt8, Int64, UInt8>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#4966: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(StandardStructType<UInt8, Int64, UInt8>(), [123i64])
            @Expect("assertion#4967: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(1i64, [123i64])
            @Expect("assertion#4968: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply("hello", [123i64])
            @Expect("assertion#4969: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(StandardStructType<UInt8, Int64, UInt8>(), [])
            @Expect("assertion#4970: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4971: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply("hello", [])
            @Expect("assertion#4972: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(StandardStructType<UInt8, Int64, UInt8>(), [])
            @Expect("assertion#4973: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4974: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply("hello", [])
            @Expect("assertion#4975: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(StandardStructType<UInt8, Int64, UInt8>(), [123i64, 114.514000f64])
            @Expect("assertion#4976: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(1i64, [123i64, 114.514000f64])
            @Expect("assertion#4977: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply("hello", [123i64, 114.514000f64])
            @Expect("assertion#4978: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(StandardStructType<UInt8, Int64, UInt8>(), [114.514000f64])
            @Expect("assertion#4979: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#4980: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#4981: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_159 ends.")
    }
}
