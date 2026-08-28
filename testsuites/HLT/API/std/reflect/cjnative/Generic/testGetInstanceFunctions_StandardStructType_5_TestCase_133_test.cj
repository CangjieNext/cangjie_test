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
    func TestCase_133(): Unit {
        // logger.info("testcase TestCase_133 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, UInt64, Float32>>().getInstanceFunctions("classInstanceMemberFunction_134").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(StandardStructType<Float64, UInt64, Float32>(), [],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#4174: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#4175: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4176: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(StandardStructType<Float64, UInt64, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4177: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4178: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#4179: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(StandardStructType<Float64, UInt64, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4180: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(StandardStructType<Float64, UInt64, Float32>(), [],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#4181: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(StandardStructType<Float64, UInt64, Float32>(), [], [()])
            @Expect("assertion#4182: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4183: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply("hello", [], [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#4184: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4185: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4186: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(1i64, [], [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#4187: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4188: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, UInt64, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
            .apply(StandardStructType<Float64, UInt64, Float32>(), [GenericClassWith2TypeParameters<Unit, Unit>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#4189: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float64, UInt64, Float32>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#4190: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float64, UInt64, Float32>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(StandardStructType<Float64, UInt64, Float32>(), [])
            @Expect("assertion#4191: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4192: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply("hello", [])
            @Expect("assertion#4193: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(StandardStructType<Float64, UInt64, Float32>(), [])
            @Expect("assertion#4194: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4195: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply("hello", [])
            @Expect("assertion#4196: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(StandardStructType<Float64, UInt64, Float32>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#4197: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#4198: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#4199: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(StandardStructType<Float64, UInt64, Float32>(), [()])
            @Expect("assertion#4200: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4201: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4202: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_133 ends.")
    }
}
