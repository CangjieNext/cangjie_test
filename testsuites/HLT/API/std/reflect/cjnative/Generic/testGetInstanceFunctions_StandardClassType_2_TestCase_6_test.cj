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
    func TestCase_6(): Unit {
        // logger.info("testcase TestCase_6 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Bool, Int64, Float64>>().getInstanceFunctions("classInstanceMemberFunction_7").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(StandardClassType<Bool, Int64, Float64>(), [], [()])
            @Expect("assertion#175: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#176: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#177: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(StandardClassType<Bool, Int64, Float64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#178: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#179: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [(), 114.514000f64])
            @Expect("assertion#180: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(StandardClassType<Bool, Int64, Float64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#181: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(StandardClassType<Bool, Int64, Float64>(), [], [(), 114.514000f64])
            @Expect("assertion#182: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(StandardClassType<Bool, Int64, Float64>(), [], [123i64])
            @Expect("assertion#183: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [123i64])
            @Expect("assertion#184: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#185: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#186: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#187: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(1i64, [], [(), 114.514000f64])
            @Expect("assertion#188: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply("hello", [], [123i64])
            @Expect("assertion#189: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Bool, Int64, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
            .apply(StandardClassType<Bool, Int64, Float64>(), [()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#190: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Bool, Int64, Float64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply("hello", [()])
            @Expect("assertion#191: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Bool, Int64, Float64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(StandardClassType<Bool, Int64, Float64>(), [])
            @Expect("assertion#192: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(1i64, [])
            @Expect("assertion#193: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply("hello", [])
            @Expect("assertion#194: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(StandardClassType<Bool, Int64, Float64>(), [])
            @Expect("assertion#195: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(1i64, [])
            @Expect("assertion#196: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply("hello", [])
            @Expect("assertion#197: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(StandardClassType<Bool, Int64, Float64>(), [(), 114.514000f64])
            @Expect("assertion#198: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(1i64, [(), 114.514000f64])
            @Expect("assertion#199: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply("hello", [(), 114.514000f64])
            @Expect("assertion#200: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(StandardClassType<Bool, Int64, Float64>(), [123i64])
            @Expect("assertion#201: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(1i64, [123i64])
            @Expect("assertion#202: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply("hello", [123i64])
            @Expect("assertion#203: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_6 ends.")
    }
}
