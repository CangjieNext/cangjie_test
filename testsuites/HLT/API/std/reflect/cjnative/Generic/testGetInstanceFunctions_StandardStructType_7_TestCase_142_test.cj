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
class testGetInstanceFunctions_StandardStructType_7 {
    @TestCase
    func TestCase_142(): Unit {
        // logger.info("testcase TestCase_142 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, Int16, Bool>>().getInstanceFunctions("classInstanceMemberFunction_143").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(StandardStructType<Bool, Int16, Bool>(), [], [NonGenericStruct()])
            @Expect("assertion#4435: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#4436: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4437: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(StandardStructType<Bool, Int16, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4438: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4439: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4440: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(StandardStructType<Bool, Int16, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4441: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(StandardStructType<Bool, Int16, Bool>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4442: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(StandardStructType<Bool, Int16, Bool>(), [], [()])
            @Expect("assertion#4443: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4444: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply("hello", [], [NonGenericStruct()])
            @Expect("assertion#4445: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4446: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4447: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(1i64, [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4448: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4449: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Bool, Int16, Bool>>()
            .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
            .apply(StandardStructType<Bool, Int16, Bool>(), [NonGenericStruct()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#4450: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Bool, Int16, Bool>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#4451: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Bool, Int16, Bool>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(StandardStructType<Bool, Int16, Bool>(), [])
            @Expect("assertion#4452: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4453: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply("hello", [])
            @Expect("assertion#4454: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(StandardStructType<Bool, Int16, Bool>(), [])
            @Expect("assertion#4455: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4456: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply("hello", [])
            @Expect("assertion#4457: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(StandardStructType<Bool, Int16, Bool>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4458: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4459: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4460: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(StandardStructType<Bool, Int16, Bool>(), [()])
            @Expect("assertion#4461: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4462: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4463: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_142 ends.")
    }
}
