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
class testGetInstanceFunctions_StandardClassType_3 {
    @TestCase
    func TestCase_12(): Unit {
        // logger.info("testcase TestCase_12 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, Float64, Int32>>().getInstanceFunctions("classInstanceMemberFunction_13").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(StandardClassType<Int32, Float64, Int32>(), [], [NonGenericClass()])
            @Expect("assertion#349: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#350: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#351: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(StandardClassType<Int32, Float64, Int32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#352: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#353: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#354: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(StandardClassType<Int32, Float64, Int32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#355: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(StandardClassType<Int32, Float64, Int32>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#356: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(StandardClassType<Int32, Float64, Int32>(), [], [()])
            @Expect("assertion#357: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#358: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply("hello", [], [NonGenericClass()])
            @Expect("assertion#359: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#360: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#361: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(1i64, [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#362: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#363: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int32, Float64, Int32>>()
            .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
            .apply(StandardClassType<Int32, Float64, Int32>(), [NonGenericClass()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#364: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int32, Float64, Int32>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#365: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int32, Float64, Int32>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(StandardClassType<Int32, Float64, Int32>(), [])
            @Expect("assertion#366: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(1i64, [])
            @Expect("assertion#367: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply("hello", [])
            @Expect("assertion#368: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(StandardClassType<Int32, Float64, Int32>(), [])
            @Expect("assertion#369: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(1i64, [])
            @Expect("assertion#370: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply("hello", [])
            @Expect("assertion#371: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(StandardClassType<Int32, Float64, Int32>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#372: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#373: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#374: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(StandardClassType<Int32, Float64, Int32>(), [()])
            @Expect("assertion#375: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#376: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply("hello", [()])
            @Expect("assertion#377: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_12 ends.")
    }
}
