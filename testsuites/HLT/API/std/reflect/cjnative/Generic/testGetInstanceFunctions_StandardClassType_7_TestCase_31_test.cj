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
class testGetInstanceFunctions_StandardClassType_7 {
    @TestCase
    func TestCase_31(): Unit {
        // logger.info("testcase TestCase_31 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, Float32, Float64>>().getInstanceFunctions("classInstanceMemberFunction_32").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(StandardClassType<Int64, Float32, Float64>(), [], [NonGenericStruct()])
            @Expect("assertion#900: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#901: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#902: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(StandardClassType<Int64, Float32, Float64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#903: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#904: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#905: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(StandardClassType<Int64, Float32, Float64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#906: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(StandardClassType<Int64, Float32, Float64>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#907: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(StandardClassType<Int64, Float32, Float64>(), [], [()])
            @Expect("assertion#908: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#909: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply("hello", [], [NonGenericStruct()])
            @Expect("assertion#910: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#911: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#912: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(1i64, [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#913: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#914: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int64, Float32, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
            .apply(StandardClassType<Int64, Float32, Float64>(), [NonGenericStruct()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#915: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int64, Float32, Float64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#916: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int64, Float32, Float64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(StandardClassType<Int64, Float32, Float64>(), [])
            @Expect("assertion#917: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(1i64, [])
            @Expect("assertion#918: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply("hello", [])
            @Expect("assertion#919: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(StandardClassType<Int64, Float32, Float64>(), [])
            @Expect("assertion#920: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(1i64, [])
            @Expect("assertion#921: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply("hello", [])
            @Expect("assertion#922: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(StandardClassType<Int64, Float32, Float64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#923: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#924: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#925: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(StandardClassType<Int64, Float32, Float64>(), [()])
            @Expect("assertion#926: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#927: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply("hello", [()])
            @Expect("assertion#928: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_31 ends.")
    }
}
