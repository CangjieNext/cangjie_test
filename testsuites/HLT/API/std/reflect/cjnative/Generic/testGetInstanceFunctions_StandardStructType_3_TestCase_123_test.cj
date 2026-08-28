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
class testGetInstanceFunctions_StandardStructType_3 {
    @TestCase
    func TestCase_123(): Unit {
        // logger.info("testcase TestCase_123 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, UInt64, Bool>>().getInstanceFunctions("classInstanceMemberFunction_124").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
                .apply(StandardStructType<Float64, UInt64, Bool>(), [], [NonGenericClass()])
            @Expect("assertion#3884: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#3885: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3886: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
                .apply(StandardStructType<Float64, UInt64, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3887: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3888: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3889: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
                .apply(StandardStructType<Float64, UInt64, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3890: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
                .apply(StandardStructType<Float64, UInt64, Bool>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3891: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
                .apply(StandardStructType<Float64, UInt64, Bool>(), [], [()])
            @Expect("assertion#3892: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#3893: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
                .apply("hello", [], [NonGenericClass()])
            @Expect("assertion#3894: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3895: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3896: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
                .apply(1i64, [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3897: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#3898: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, UInt64, Bool>>()
            .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
            .apply(StandardStructType<Float64, UInt64, Bool>(), [NonGenericClass()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#3899: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float64, UInt64, Bool>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#3900: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float64, UInt64, Bool>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
                .apply(StandardStructType<Float64, UInt64, Bool>(), [])
            @Expect("assertion#3901: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3902: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
                .apply("hello", [])
            @Expect("assertion#3903: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
                .apply(StandardStructType<Float64, UInt64, Bool>(), [])
            @Expect("assertion#3904: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3905: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
                .apply("hello", [])
            @Expect("assertion#3906: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
                .apply(StandardStructType<Float64, UInt64, Bool>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3907: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3908: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3909: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
                .apply(StandardStructType<Float64, UInt64, Bool>(), [()])
            @Expect("assertion#3910: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3911: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_124")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3912: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_123 ends.")
    }
}
