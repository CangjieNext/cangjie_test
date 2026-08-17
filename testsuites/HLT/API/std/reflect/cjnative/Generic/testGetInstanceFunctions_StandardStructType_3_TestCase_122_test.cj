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
class testGetInstanceFunctions_StandardStructType_3 {
    @TestCase
    func TestCase_122(): Unit {
        // logger.info("testcase TestCase_122 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, Int64, Bool>>().getInstanceFunctions("classInstanceMemberFunction_123").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
                .apply(StandardStructType<UInt16, Int64, Bool>(), [], [NonGenericClass()])
            @Expect("assertion#3855: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#3856: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3857: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
                .apply(StandardStructType<UInt16, Int64, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3858: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3859: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3860: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
                .apply(StandardStructType<UInt16, Int64, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3861: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
                .apply(StandardStructType<UInt16, Int64, Bool>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3862: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
                .apply(StandardStructType<UInt16, Int64, Bool>(), [], [()])
            @Expect("assertion#3863: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#3864: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
                .apply("hello", [], [NonGenericClass()])
            @Expect("assertion#3865: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3866: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3867: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
                .apply(1i64, [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3868: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#3869: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt16, Int64, Bool>>()
            .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
            .apply(StandardStructType<UInt16, Int64, Bool>(), [NonGenericClass()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#3870: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt16, Int64, Bool>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#3871: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt16, Int64, Bool>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
                .apply(StandardStructType<UInt16, Int64, Bool>(), [])
            @Expect("assertion#3872: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3873: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
                .apply("hello", [])
            @Expect("assertion#3874: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
                .apply(StandardStructType<UInt16, Int64, Bool>(), [])
            @Expect("assertion#3875: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3876: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
                .apply("hello", [])
            @Expect("assertion#3877: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
                .apply(StandardStructType<UInt16, Int64, Bool>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3878: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3879: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3880: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
                .apply(StandardStructType<UInt16, Int64, Bool>(), [()])
            @Expect("assertion#3881: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3882: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_123")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3883: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_122 ends.")
    }
}
