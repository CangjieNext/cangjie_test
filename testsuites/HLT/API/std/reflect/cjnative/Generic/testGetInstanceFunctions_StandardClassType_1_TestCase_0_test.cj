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
    func TestCase_0(): Unit {
        // logger.info("testcase TestCase_0 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, Float32, UInt8>>().getInstanceFunctions("classInstanceMemberFunction_1").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply(StandardClassType<Int64, Float32, UInt8>(), [], [])
            @Expect("assertion#0: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply(1i64, [], [114.514000f64])
            @Expect("assertion#2: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply(StandardClassType<Int64, Float32, UInt8>(), [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#3: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#5: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int64, Float32, UInt8>>()
            .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
            .apply(StandardClassType<Int64, Float32, UInt8>(), [])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int64, Float32, UInt8>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply("hello", [])
            @Expect("assertion#7: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int64, Float32, UInt8>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply(StandardClassType<Int64, Float32, UInt8>(), [114.514000f64])
            @Expect("assertion#8: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#9: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#10: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_0 ends.")
    }
}
