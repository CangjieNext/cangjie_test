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
class testGetInstanceFunctions_StandardStructType_1 {
    @TestCase
    func TestCase_110(): Unit {
        // logger.info("testcase TestCase_110 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int16, Int16, Float64>>().getInstanceFunctions("classInstanceMemberFunction_111").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int16, Int16, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
            .apply(StandardStructType<Int16, Int16, Float64>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()], [])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#3488: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#3489: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()], [114.514000f64])
            @Expect("assertion#3490: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply(StandardStructType<Int16, Int16, Float64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()],
                    [114.514000f64])
            @Expect("assertion#3491: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#3492: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply(StandardStructType<Int16, Int16, Float64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#3493: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply(StandardStructType<Int16, Int16, Float64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt64>()],
                    [114.514000f64])
            @Expect("assertion#3494: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#3495: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int16, Int16, Float64>\", but now it`s \"String\"")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#3496: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#3497: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#3498: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply(StandardStructType<Int16, Int16, Float64>(), [])
            @Expect("assertion#3499: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3500: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply("hello", [])
            @Expect("assertion#3501: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply(StandardStructType<Int16, Int16, Float64>(), [114.514000f64])
            @Expect("assertion#3502: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#3503: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_111")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#3504: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_110 ends.")
    }
}
