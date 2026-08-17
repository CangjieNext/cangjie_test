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
class testGetInstanceFunctions_StandardStructType_1 {
    @TestCase
    func TestCase_109(): Unit {
        // logger.info("testcase TestCase_109 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, Unit, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_110").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_110")[0i64]
                .apply(StandardStructType<Bool, Unit, UInt64>(), [], [])
            @Expect("assertion#3477: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_110")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3478: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_110")[0i64]
                .apply(1i64, [], [114.514000f64])
            @Expect("assertion#3479: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_110")[0i64]
                .apply(StandardStructType<Bool, Unit, UInt64>(), [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#3480: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_110")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3481: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_110")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#3482: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Bool, Unit, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_110")[0i64]
            .apply(StandardStructType<Bool, Unit, UInt64>(), [])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_110")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3483: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Bool, Unit, UInt64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_110")[0i64]
                .apply("hello", [])
            @Expect("assertion#3484: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Bool, Unit, UInt64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_110")[0i64]
                .apply(StandardStructType<Bool, Unit, UInt64>(), [114.514000f64])
            @Expect("assertion#3485: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_110")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#3486: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_110")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#3487: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_109 ends.")
    }
}
