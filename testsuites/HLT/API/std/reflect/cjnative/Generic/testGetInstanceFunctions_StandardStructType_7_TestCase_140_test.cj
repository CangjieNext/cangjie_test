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
    func TestCase_140(): Unit {
        // logger.info("testcase TestCase_140 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, Int32, Int8>>().getInstanceFunctions("classInstanceMemberFunction_141").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [], [NonGenericStruct()])
            @Expect("assertion#4377: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#4378: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4379: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4380: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4381: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4382: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4383: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4384: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [], [()])
            @Expect("assertion#4385: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4386: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply("hello", [], [NonGenericStruct()])
            @Expect("assertion#4387: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4388: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4389: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(1i64, [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4390: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4391: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int32, Int32, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
            .apply(StandardStructType<Int32, Int32, Int8>(), [NonGenericStruct()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#4392: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int32, Int32, Int8>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#4393: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int32, Int32, Int8>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [])
            @Expect("assertion#4394: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4395: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply("hello", [])
            @Expect("assertion#4396: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [])
            @Expect("assertion#4397: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4398: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply("hello", [])
            @Expect("assertion#4399: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4400: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4401: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4402: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [()])
            @Expect("assertion#4403: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4404: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4405: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_140 ends.")
    }
}
