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
class testGetInstanceFunctions_StandardStructType_10 {
    @TestCase
    func TestCase_158(): Unit {
        // logger.info("testcase TestCase_158 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, Int64, Int64>>().getInstanceFunctions("classInstanceMemberFunction_159").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int64, Int64, Int64>>()
            .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
            .apply(StandardStructType<Int64, Int64, Int64>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [123i64])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [123i64])
            @Expect("assertion#4914: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Unit>()], [123i64])
            @Expect("assertion#4915: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#4916: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(StandardStructType<Int64, Int64, Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#4917: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#4918: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#4919: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(StandardStructType<Int64, Int64, Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#4920: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#4921: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [123i64, 114.514000f64])
            @Expect("assertion#4922: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Unit>()], [123i64, 114.514000f64])
            @Expect("assertion#4923: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(StandardStructType<Int64, Int64, Int64>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [123i64, 114.514000f64])
            @Expect("assertion#4924: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(StandardStructType<Int64, Int64, Int64>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [114.514000f64])
            @Expect("assertion#4925: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [114.514000f64])
            @Expect("assertion#4926: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Unit>()], [114.514000f64])
            @Expect("assertion#4927: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(StandardStructType<Int64, Int64, Int64>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [123i64])
            @Expect("assertion#4928: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(StandardStructType<Int64, Int64, Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#4929: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(StandardStructType<Int64, Int64, Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#4930: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(StandardStructType<Int64, Int64, Int64>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [123i64, 114.514000f64])
            @Expect("assertion#4931: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(StandardStructType<Int64, Int64, Int64>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#4932: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(StandardStructType<Int64, Int64, Int64>(), [123i64])
            @Expect("assertion#4933: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(1i64, [123i64])
            @Expect("assertion#4934: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply("hello", [123i64])
            @Expect("assertion#4935: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(StandardStructType<Int64, Int64, Int64>(), [])
            @Expect("assertion#4936: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4937: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply("hello", [])
            @Expect("assertion#4938: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(StandardStructType<Int64, Int64, Int64>(), [])
            @Expect("assertion#4939: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4940: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply("hello", [])
            @Expect("assertion#4941: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(StandardStructType<Int64, Int64, Int64>(), [123i64, 114.514000f64])
            @Expect("assertion#4942: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(1i64, [123i64, 114.514000f64])
            @Expect("assertion#4943: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply("hello", [123i64, 114.514000f64])
            @Expect("assertion#4944: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(StandardStructType<Int64, Int64, Int64>(), [114.514000f64])
            @Expect("assertion#4945: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#4946: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#4947: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_158 ends.")
    }
}
