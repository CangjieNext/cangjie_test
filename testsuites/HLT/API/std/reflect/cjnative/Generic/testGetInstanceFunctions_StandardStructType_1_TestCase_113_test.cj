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
    func TestCase_113(): Unit {
        // logger.info("testcase TestCase_113 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float32, UInt64, Float32>>().getInstanceFunctions("classInstanceMemberFunction_114").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(StandardStructType<Float32, UInt64, Float32>(), [], [123i64])
            @Expect("assertion#3594: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [123i64])
            @Expect("assertion#3595: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3596: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(StandardStructType<Float32, UInt64, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3597: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3598: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [123i64, 114.514000f64])
            @Expect("assertion#3599: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(StandardStructType<Float32, UInt64, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3600: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(StandardStructType<Float32, UInt64, Float32>(), [], [123i64, 114.514000f64])
            @Expect("assertion#3601: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(StandardStructType<Float32, UInt64, Float32>(), [], [114.514000f64])
            @Expect("assertion#3602: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#3603: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply("hello", [], [123i64])
            @Expect("assertion#3604: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3605: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3606: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(1i64, [], [123i64, 114.514000f64])
            @Expect("assertion#3607: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply("hello", [], [114.514000f64])
            @Expect("assertion#3608: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float32, UInt64, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
            .apply(StandardStructType<Float32, UInt64, Float32>(), [123i64])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(1i64, [123i64])
            @Expect("assertion#3609: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float32, UInt64, Float32>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply("hello", [123i64])
            @Expect("assertion#3610: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float32, UInt64, Float32>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(StandardStructType<Float32, UInt64, Float32>(), [])
            @Expect("assertion#3611: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3612: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply("hello", [])
            @Expect("assertion#3613: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(StandardStructType<Float32, UInt64, Float32>(), [])
            @Expect("assertion#3614: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3615: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply("hello", [])
            @Expect("assertion#3616: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(StandardStructType<Float32, UInt64, Float32>(), [123i64, 114.514000f64])
            @Expect("assertion#3617: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(1i64, [123i64, 114.514000f64])
            @Expect("assertion#3618: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply("hello", [123i64, 114.514000f64])
            @Expect("assertion#3619: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(StandardStructType<Float32, UInt64, Float32>(), [114.514000f64])
            @Expect("assertion#3620: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#3621: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_114")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#3622: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_113 ends.")
    }
}
