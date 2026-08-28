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
class testGetStaticFunctions_StandardStructType_2 {
    @TestCase
    func TestCase_334(): Unit {
        // logger.info("testcase TestCase_334 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int8, Float32, UInt32>>().getStaticFunctions("classStaticMemberFunction_117").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Float32, UInt32>>(), [], [1i8])
            @Expect("assertion#9808: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [1i8])
            @Expect("assertion#9809: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#9810: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Float32, UInt32>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9811: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Float32, UInt32>>(), [], [])
            @Expect("assertion#9812: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9813: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Float32, UInt32>>(), [], [1i8, 114.514000f64])
            @Expect("assertion#9814: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [1i8, 114.514000f64])
            @Expect("assertion#9815: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Float32, UInt32>>(), [], [114.514000f64])
            @Expect("assertion#9816: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#9817: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int8, Float32, UInt32>>()
            .getStaticFunctions("classStaticMemberFunction_117")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int8, Float32, UInt32>>(), [1i8])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i8])
            @Expect("assertion#9818: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Float32, UInt32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Float32, UInt32>>(), [])
            @Expect("assertion#9819: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9820: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Float32, UInt32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Float32, UInt32>>(), [])
            @Expect("assertion#9821: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9822: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Float32, UInt32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Float32, UInt32>>(), [1i8, 114.514000f64])
            @Expect("assertion#9823: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i8, 114.514000f64])
            @Expect("assertion#9824: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Float32, UInt32> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Float32, UInt32>>(), [114.514000f64])
            @Expect("assertion#9825: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#9826: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Float32, UInt32> got.")
        }
        // logger.info("testcase TestCase_334 ends.")
    }
}
