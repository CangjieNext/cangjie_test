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
    func TestCase_139(): Unit {
        // logger.info("testcase TestCase_139 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, Int32, Int8>>().getInstanceFunctions("classInstanceMemberFunction_140").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [], [NonGenericStruct()])
            @Expect("assertion#4348: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#4349: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4350: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4351: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4352: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4353: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4354: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4355: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [], [()])
            @Expect("assertion#4356: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4357: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply("hello", [], [NonGenericStruct()])
            @Expect("assertion#4358: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4359: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4360: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(1i64, [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4361: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4362: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int32, Int32, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
            .apply(StandardStructType<Int32, Int32, Int8>(), [NonGenericStruct()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#4363: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int32, Int32, Int8>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#4364: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int32, Int32, Int8>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [])
            @Expect("assertion#4365: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4366: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply("hello", [])
            @Expect("assertion#4367: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [])
            @Expect("assertion#4368: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4369: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply("hello", [])
            @Expect("assertion#4370: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4371: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4372: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4373: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [()])
            @Expect("assertion#4374: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4375: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4376: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_139 ends.")
    }
}
