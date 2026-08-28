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
class testGetInstanceFunctions_StandardStructType_5 {
    @TestCase
    func TestCase_129(): Unit {
        // logger.info("testcase TestCase_129 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, UInt32, Float32>>().getInstanceFunctions("classInstanceMemberFunction_130").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(StandardStructType<UInt8, UInt32, Float32>(), [], [GenericClassWith1TypeParameters<UInt32>()])
            @Expect("assertion#4058: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<UInt32>()])
            @Expect("assertion#4059: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4060: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(StandardStructType<UInt8, UInt32, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4061: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4062: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#4063: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(StandardStructType<UInt8, UInt32, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4064: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(StandardStructType<UInt8, UInt32, Float32>(), [],
                    [GenericClassWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#4065: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(StandardStructType<UInt8, UInt32, Float32>(), [], [()])
            @Expect("assertion#4066: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4067: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply("hello", [], [GenericClassWith1TypeParameters<UInt32>()])
            @Expect("assertion#4068: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4069: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4070: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(1i64, [], [GenericClassWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#4071: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4072: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt8, UInt32, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
            .apply(StandardStructType<UInt8, UInt32, Float32>(), [GenericClassWith1TypeParameters<UInt32>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<UInt32>()])
            @Expect("assertion#4073: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt8, UInt32, Float32>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<UInt32>()])
            @Expect("assertion#4074: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt8, UInt32, Float32>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(StandardStructType<UInt8, UInt32, Float32>(), [])
            @Expect("assertion#4075: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4076: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply("hello", [])
            @Expect("assertion#4077: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(StandardStructType<UInt8, UInt32, Float32>(), [])
            @Expect("assertion#4078: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4079: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply("hello", [])
            @Expect("assertion#4080: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(StandardStructType<UInt8, UInt32, Float32>(),
                    [GenericClassWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#4081: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#4082: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#4083: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(StandardStructType<UInt8, UInt32, Float32>(), [()])
            @Expect("assertion#4084: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4085: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4086: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_129 ends.")
    }
}
