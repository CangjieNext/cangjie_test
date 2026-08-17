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
class testGetInstanceFunctions_StandardStructType_6 {
    @TestCase
    func TestCase_138(): Unit {
        // logger.info("testcase TestCase_138 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, Int32, Int8>>().getInstanceFunctions("classInstanceMemberFunction_139").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(StandardStructType<Float64, Int32, Int8>(), [], [NonGenericStruct()])
            @Expect("assertion#4319: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#4320: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4321: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(StandardStructType<Float64, Int32, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4322: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4323: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4324: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(StandardStructType<Float64, Int32, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4325: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(StandardStructType<Float64, Int32, Int8>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4326: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(StandardStructType<Float64, Int32, Int8>(), [], [()])
            @Expect("assertion#4327: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4328: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply("hello", [], [NonGenericStruct()])
            @Expect("assertion#4329: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4330: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4331: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(1i64, [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4332: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4333: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, Int32, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
            .apply(StandardStructType<Float64, Int32, Int8>(), [NonGenericStruct()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#4334: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float64, Int32, Int8>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#4335: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float64, Int32, Int8>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(StandardStructType<Float64, Int32, Int8>(), [])
            @Expect("assertion#4336: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4337: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply("hello", [])
            @Expect("assertion#4338: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(StandardStructType<Float64, Int32, Int8>(), [])
            @Expect("assertion#4339: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4340: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply("hello", [])
            @Expect("assertion#4341: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(StandardStructType<Float64, Int32, Int8>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4342: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4343: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4344: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(StandardStructType<Float64, Int32, Int8>(), [()])
            @Expect("assertion#4345: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4346: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4347: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_138 ends.")
    }
}
