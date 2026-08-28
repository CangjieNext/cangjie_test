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
class testGetInstanceFunctions_StandardStructType_4 {
    @TestCase
    func TestCase_128(): Unit {
        // logger.info("testcase TestCase_128 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float32, UInt32, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_129").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [], [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#4029: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#4030: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4031: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4032: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4033: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#4034: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4035: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [],
                    [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#4036: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [], [()])
            @Expect("assertion#4037: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4038: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply("hello", [], [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#4039: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4040: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4041: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(1i64, [], [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#4042: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4043: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float32, UInt32, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
            .apply(StandardStructType<Float32, UInt32, UInt64>(), [GenericClassWith1TypeParameters<Float32>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#4044: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float32, UInt32, UInt64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#4045: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float32, UInt32, UInt64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [])
            @Expect("assertion#4046: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4047: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply("hello", [])
            @Expect("assertion#4048: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [])
            @Expect("assertion#4049: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4050: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply("hello", [])
            @Expect("assertion#4051: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(),
                    [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#4052: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#4053: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#4054: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [()])
            @Expect("assertion#4055: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4056: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4057: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_128 ends.")
    }
}
