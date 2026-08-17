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
class testGetInstanceFunctions_StandardClassType_1 {
    @TestCase
    func TestCase_4(): Unit {
        // logger.info("testcase TestCase_4 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, Int64, Unit>>().getInstanceFunctions("classInstanceMemberFunction_5").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(StandardClassType<UInt32, Int64, Unit>(), [], [123i64])
            @Expect("assertion#117: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [123i64])
            @Expect("assertion#118: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#119: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(StandardClassType<UInt32, Int64, Unit>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#120: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#121: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [123i64, 114.514000f64])
            @Expect("assertion#122: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(StandardClassType<UInt32, Int64, Unit>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#123: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(StandardClassType<UInt32, Int64, Unit>(), [], [123i64, 114.514000f64])
            @Expect("assertion#124: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(StandardClassType<UInt32, Int64, Unit>(), [], [114.514000f64])
            @Expect("assertion#125: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#126: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [], [123i64])
            @Expect("assertion#127: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#128: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#129: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [], [123i64, 114.514000f64])
            @Expect("assertion#130: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [], [114.514000f64])
            @Expect("assertion#131: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt32, Int64, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
            .apply(StandardClassType<UInt32, Int64, Unit>(), [123i64])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [123i64])
            @Expect("assertion#132: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt32, Int64, Unit>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [123i64])
            @Expect("assertion#133: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt32, Int64, Unit>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(StandardClassType<UInt32, Int64, Unit>(), [])
            @Expect("assertion#134: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [])
            @Expect("assertion#135: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [])
            @Expect("assertion#136: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(StandardClassType<UInt32, Int64, Unit>(), [])
            @Expect("assertion#137: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [])
            @Expect("assertion#138: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [])
            @Expect("assertion#139: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(StandardClassType<UInt32, Int64, Unit>(), [123i64, 114.514000f64])
            @Expect("assertion#140: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [123i64, 114.514000f64])
            @Expect("assertion#141: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [123i64, 114.514000f64])
            @Expect("assertion#142: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(StandardClassType<UInt32, Int64, Unit>(), [114.514000f64])
            @Expect("assertion#143: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#144: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#145: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_4 ends.")
    }
}
