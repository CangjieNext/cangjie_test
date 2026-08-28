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
class testGetStaticFunctions_StandardStructType_1 {
    @TestCase
    func TestCase_328(): Unit {
        // logger.info("testcase TestCase_328 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float32, Int32, Unit>>().getStaticFunctions("classStaticMemberFunction_111").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float32, Int32, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_111")[0i64]
            .apply(TypeInfo.of<StandardStructType<Float32, Int32, Unit>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_111")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#9672: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int32, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_111")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()],
                    [114.514000f64])
            @Expect("assertion#9673: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int32, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_111")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [114.514000f64])
            @Expect("assertion#9674: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_111")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#9675: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_111")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9676: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_111")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()], [114.514000f64])
            @Expect("assertion#9677: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int32, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_111")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#9678: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int32, Unit> got.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_111")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int32, Unit>>(), [])
            @Expect("assertion#9679: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_111")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9680: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_111")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int32, Unit>>(), [114.514000f64])
            @Expect("assertion#9681: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_111")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#9682: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_328 ends.")
    }
}
