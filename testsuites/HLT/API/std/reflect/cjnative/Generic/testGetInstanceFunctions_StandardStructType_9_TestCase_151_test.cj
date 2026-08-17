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
class testGetInstanceFunctions_StandardStructType_9 {
    @TestCase
    func TestCase_151(): Unit {
        // logger.info("testcase TestCase_151 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, Int32, Float64>>().getInstanceFunctions("classInstanceMemberFunction_152").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(StandardStructType<Int64, Int32, Float64>(), [], [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#4696: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#4697: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4698: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(StandardStructType<Int64, Int32, Float64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4699: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4700: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#4701: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(StandardStructType<Int64, Int32, Float64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4702: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(StandardStructType<Int64, Int32, Float64>(), [],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#4703: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(StandardStructType<Int64, Int32, Float64>(), [], [()])
            @Expect("assertion#4704: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4705: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply("hello", [], [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#4706: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4707: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4708: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(1i64, [], [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#4709: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4710: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int64, Int32, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
            .apply(StandardStructType<Int64, Int32, Float64>(), [GenericStructWith2TypeParameters<Unit, Unit>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#4711: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int64, Int32, Float64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#4712: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int64, Int32, Float64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(StandardStructType<Int64, Int32, Float64>(), [])
            @Expect("assertion#4713: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4714: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply("hello", [])
            @Expect("assertion#4715: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(StandardStructType<Int64, Int32, Float64>(), [])
            @Expect("assertion#4716: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4717: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply("hello", [])
            @Expect("assertion#4718: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(StandardStructType<Int64, Int32, Float64>(),
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#4719: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#4720: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#4721: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(StandardStructType<Int64, Int32, Float64>(), [()])
            @Expect("assertion#4722: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4723: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4724: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_151 ends.")
    }
}
