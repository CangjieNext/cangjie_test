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
    func TestCase_127(): Unit {
        // logger.info("testcase TestCase_127 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, Int16, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_128").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(StandardStructType<Int64, Int16, UInt16>(), [], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#4000: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#4001: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4002: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(StandardStructType<Int64, Int16, UInt16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4003: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4004: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#4005: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(StandardStructType<Int64, Int16, UInt16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4006: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(StandardStructType<Int64, Int16, UInt16>(), [],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#4007: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(StandardStructType<Int64, Int16, UInt16>(), [], [()])
            @Expect("assertion#4008: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4009: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply("hello", [], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#4010: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4011: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4012: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(1i64, [], [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#4013: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4014: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int64, Int16, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
            .apply(StandardStructType<Int64, Int16, UInt16>(), [GenericClassWith1TypeParameters<Unit>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#4015: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int64, Int16, UInt16>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#4016: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int64, Int16, UInt16>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(StandardStructType<Int64, Int16, UInt16>(), [])
            @Expect("assertion#4017: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4018: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply("hello", [])
            @Expect("assertion#4019: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(StandardStructType<Int64, Int16, UInt16>(), [])
            @Expect("assertion#4020: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4021: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply("hello", [])
            @Expect("assertion#4022: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(StandardStructType<Int64, Int16, UInt16>(),
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#4023: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#4024: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#4025: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(StandardStructType<Int64, Int16, UInt16>(), [()])
            @Expect("assertion#4026: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4027: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4028: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_127 ends.")
    }
}
