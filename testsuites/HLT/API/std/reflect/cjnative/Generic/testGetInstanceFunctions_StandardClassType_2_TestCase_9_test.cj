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
    func TestCase_9(): Unit {
        // logger.info("testcase TestCase_9 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Bool, Int32, Float64>>().getInstanceFunctions("classInstanceMemberFunction_10").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(StandardClassType<Bool, Int32, Float64>(), [], [114.514000f64])
            @Expect("assertion#262: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#263: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#264: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(StandardClassType<Bool, Int32, Float64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#265: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#266: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [114.514000f64, 114.514000f64])
            @Expect("assertion#267: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(StandardClassType<Bool, Int32, Float64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#268: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(StandardClassType<Bool, Int32, Float64>(), [], [114.514000f64, 114.514000f64])
            @Expect("assertion#269: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(StandardClassType<Bool, Int32, Float64>(), [], [()])
            @Expect("assertion#270: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#271: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply("hello", [], [114.514000f64])
            @Expect("assertion#272: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#273: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#274: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(1i64, [], [114.514000f64, 114.514000f64])
            @Expect("assertion#275: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#276: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Bool, Int32, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
            .apply(StandardClassType<Bool, Int32, Float64>(), [114.514000f64])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#277: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Bool, Int32, Float64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#278: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Bool, Int32, Float64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(StandardClassType<Bool, Int32, Float64>(), [])
            @Expect("assertion#279: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(1i64, [])
            @Expect("assertion#280: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply("hello", [])
            @Expect("assertion#281: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(StandardClassType<Bool, Int32, Float64>(), [])
            @Expect("assertion#282: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(1i64, [])
            @Expect("assertion#283: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply("hello", [])
            @Expect("assertion#284: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(StandardClassType<Bool, Int32, Float64>(), [114.514000f64, 114.514000f64])
            @Expect("assertion#285: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(1i64, [114.514000f64, 114.514000f64])
            @Expect("assertion#286: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply("hello", [114.514000f64, 114.514000f64])
            @Expect("assertion#287: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(StandardClassType<Bool, Int32, Float64>(), [()])
            @Expect("assertion#288: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#289: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply("hello", [()])
            @Expect("assertion#290: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_9 ends.")
    }
}
