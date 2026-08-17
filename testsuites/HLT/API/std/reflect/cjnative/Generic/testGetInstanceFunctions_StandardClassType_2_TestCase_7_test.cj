/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0 
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
class testGetInstanceFunctions_StandardClassType_2 {
    @TestCase
    func TestCase_7(): Unit {
        // logger.info("testcase TestCase_7 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Int32, Bool>>().getInstanceFunctions("classInstanceMemberFunction_8").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(StandardClassType<UInt64, Int32, Bool>(), [], [123u64])
            @Expect("assertion#204: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [123u64])
            @Expect("assertion#205: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#206: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(StandardClassType<UInt64, Int32, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#207: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#208: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [123u64, 114.514000f64])
            @Expect("assertion#209: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(StandardClassType<UInt64, Int32, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#210: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(StandardClassType<UInt64, Int32, Bool>(), [], [123u64, 114.514000f64])
            @Expect("assertion#211: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(StandardClassType<UInt64, Int32, Bool>(), [], [114.514000f64])
            @Expect("assertion#212: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#213: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply("hello", [], [123u64])
            @Expect("assertion#214: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#215: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#216: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(1i64, [], [123u64, 114.514000f64])
            @Expect("assertion#217: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply("hello", [], [114.514000f64])
            @Expect("assertion#218: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt64, Int32, Bool>>()
            .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
            .apply(StandardClassType<UInt64, Int32, Bool>(), [123u64])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(1i64, [123u64])
            @Expect("assertion#219: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt64, Int32, Bool>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply("hello", [123u64])
            @Expect("assertion#220: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt64, Int32, Bool>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(StandardClassType<UInt64, Int32, Bool>(), [])
            @Expect("assertion#221: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(1i64, [])
            @Expect("assertion#222: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply("hello", [])
            @Expect("assertion#223: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(StandardClassType<UInt64, Int32, Bool>(), [])
            @Expect("assertion#224: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(1i64, [])
            @Expect("assertion#225: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply("hello", [])
            @Expect("assertion#226: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(StandardClassType<UInt64, Int32, Bool>(), [123u64, 114.514000f64])
            @Expect("assertion#227: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(1i64, [123u64, 114.514000f64])
            @Expect("assertion#228: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply("hello", [123u64, 114.514000f64])
            @Expect("assertion#229: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(StandardClassType<UInt64, Int32, Bool>(), [114.514000f64])
            @Expect("assertion#230: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#231: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#232: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_7 ends.")
    }
}
