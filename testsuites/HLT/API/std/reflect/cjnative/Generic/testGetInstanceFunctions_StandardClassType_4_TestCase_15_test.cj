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
class testGetInstanceFunctions_StandardClassType_4 {
    @TestCase
    func TestCase_15(): Unit {
        // logger.info("testcase TestCase_15 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Unit, UInt16, Float32>>().getInstanceFunctions("classInstanceMemberFunction_16").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(StandardClassType<Unit, UInt16, Float32>(), [], [NonGenericClass()])
            @Expect("assertion#436: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#437: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#438: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(StandardClassType<Unit, UInt16, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#439: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#440: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#441: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(StandardClassType<Unit, UInt16, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#442: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(StandardClassType<Unit, UInt16, Float32>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#443: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(StandardClassType<Unit, UInt16, Float32>(), [], [()])
            @Expect("assertion#444: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#445: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply("hello", [], [NonGenericClass()])
            @Expect("assertion#446: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#447: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#448: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(1i64, [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#449: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#450: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Unit, UInt16, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
            .apply(StandardClassType<Unit, UInt16, Float32>(), [NonGenericClass()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#451: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Unit, UInt16, Float32>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#452: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Unit, UInt16, Float32>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(StandardClassType<Unit, UInt16, Float32>(), [])
            @Expect("assertion#453: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(1i64, [])
            @Expect("assertion#454: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply("hello", [])
            @Expect("assertion#455: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(StandardClassType<Unit, UInt16, Float32>(), [])
            @Expect("assertion#456: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(1i64, [])
            @Expect("assertion#457: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply("hello", [])
            @Expect("assertion#458: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(StandardClassType<Unit, UInt16, Float32>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#459: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#460: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#461: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(StandardClassType<Unit, UInt16, Float32>(), [()])
            @Expect("assertion#462: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#463: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply("hello", [()])
            @Expect("assertion#464: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_15 ends.")
    }
}
