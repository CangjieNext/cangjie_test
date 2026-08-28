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
class testGetInstanceFunctions_StandardStructType_2 {
    @TestCase
    func TestCase_117(): Unit {
        // logger.info("testcase TestCase_117 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, Float32, Int8>>().getInstanceFunctions("classInstanceMemberFunction_118").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(StandardStructType<Float64, Float32, Int8>(), [], [114.514000f32])
            @Expect("assertion#3710: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [114.514000f32])
            @Expect("assertion#3711: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3712: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(StandardStructType<Float64, Float32, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3713: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3714: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [114.514000f32, 114.514000f64])
            @Expect("assertion#3715: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(StandardStructType<Float64, Float32, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3716: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(StandardStructType<Float64, Float32, Int8>(), [], [114.514000f32, 114.514000f64])
            @Expect("assertion#3717: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(StandardStructType<Float64, Float32, Int8>(), [], [()])
            @Expect("assertion#3718: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#3719: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply("hello", [], [114.514000f32])
            @Expect("assertion#3720: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3721: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3722: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(1i64, [], [114.514000f32, 114.514000f64])
            @Expect("assertion#3723: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#3724: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, Float32, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
            .apply(StandardStructType<Float64, Float32, Int8>(), [114.514000f32])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(1i64, [114.514000f32])
            @Expect("assertion#3725: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float64, Float32, Int8>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply("hello", [114.514000f32])
            @Expect("assertion#3726: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float64, Float32, Int8>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(StandardStructType<Float64, Float32, Int8>(), [])
            @Expect("assertion#3727: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3728: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply("hello", [])
            @Expect("assertion#3729: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(StandardStructType<Float64, Float32, Int8>(), [])
            @Expect("assertion#3730: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3731: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply("hello", [])
            @Expect("assertion#3732: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(StandardStructType<Float64, Float32, Int8>(), [114.514000f32, 114.514000f64])
            @Expect("assertion#3733: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(1i64, [114.514000f32, 114.514000f64])
            @Expect("assertion#3734: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply("hello", [114.514000f32, 114.514000f64])
            @Expect("assertion#3735: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(StandardStructType<Float64, Float32, Int8>(), [()])
            @Expect("assertion#3736: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3737: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3738: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_117 ends.")
    }
}
