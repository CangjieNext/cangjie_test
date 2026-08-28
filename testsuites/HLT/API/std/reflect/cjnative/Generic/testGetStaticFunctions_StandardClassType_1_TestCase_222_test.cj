/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
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
class testGetStaticFunctions_StandardClassType_1 {
    @TestCase
    func TestCase_222(): Unit {
        // logger.info("testcase TestCase_222 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float64, Int64, Int64>>().getStaticFunctions("classStaticMemberFunction_5").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, Int64, Int64>>(), [], [123i64])
            @Expect("assertion#7040: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [123i64])
            @Expect("assertion#7041: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7042: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, Int64, Int64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7043: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, Int64, Int64>>(), [], [])
            @Expect("assertion#7044: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7045: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, Int64, Int64>>(), [], [123i64, 114.514000f64])
            @Expect("assertion#7046: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [123i64, 114.514000f64])
            @Expect("assertion#7047: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, Int64, Int64>>(), [], [114.514000f64])
            @Expect("assertion#7048: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#7049: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float64, Int64, Int64>>()
            .getStaticFunctions("classStaticMemberFunction_5")[0i64]
            .apply(TypeInfo.of<StandardClassType<Float64, Int64, Int64>>(), [123i64])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64])
            @Expect("assertion#7050: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, Int64, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, Int64, Int64>>(), [])
            @Expect("assertion#7051: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7052: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, Int64, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, Int64, Int64>>(), [])
            @Expect("assertion#7053: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7054: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, Int64, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, Int64, Int64>>(), [123i64, 114.514000f64])
            @Expect("assertion#7055: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64, 114.514000f64])
            @Expect("assertion#7056: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, Int64, Int64> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, Int64, Int64>>(), [114.514000f64])
            @Expect("assertion#7057: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#7058: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, Int64, Int64> got.")
        }
        // logger.info("testcase TestCase_222 ends.")
    }
}
