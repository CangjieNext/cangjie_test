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
    func TestCase_333(): Unit {
        // logger.info("testcase TestCase_333 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, Bool, Float64>>().getStaticFunctions("classStaticMemberFunction_116").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float64>>(), [], [()])
            @Expect("assertion#9789: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#9790: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#9791: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9792: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float64>>(), [], [])
            @Expect("assertion#9793: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9794: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float64>>(), [], [(), 114.514000f64])
            @Expect("assertion#9795: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [(), 114.514000f64])
            @Expect("assertion#9796: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float64>>(), [], [123i64])
            @Expect("assertion#9797: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [123i64])
            @Expect("assertion#9798: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt16, Bool, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_116")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float64>>(), [()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9799: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Bool, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float64>>(), [])
            @Expect("assertion#9800: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9801: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Bool, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float64>>(), [])
            @Expect("assertion#9802: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9803: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Bool, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float64>>(), [(), 114.514000f64])
            @Expect("assertion#9804: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<Int64>(), [(), 114.514000f64])
            @Expect("assertion#9805: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Bool, Float64> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float64>>(), [123i64])
            @Expect("assertion#9806: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64])
            @Expect("assertion#9807: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Bool, Float64> got.")
        }
        // logger.info("testcase TestCase_333 ends.")
    }
}
