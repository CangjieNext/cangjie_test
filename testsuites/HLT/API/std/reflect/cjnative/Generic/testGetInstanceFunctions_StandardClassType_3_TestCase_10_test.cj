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
class testGetInstanceFunctions_StandardClassType_3 {
    @TestCase
    func TestCase_10(): Unit {
        // logger.info("testcase TestCase_10 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Unit, UInt16, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_11").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt64>(), [], [NonGenericClass()])
            @Expect("assertion#291: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#292: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#293: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#294: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#295: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#296: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#297: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt64>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#298: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt64>(), [], [()])
            @Expect("assertion#299: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#300: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply("hello", [], [NonGenericClass()])
            @Expect("assertion#301: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#302: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#303: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(1i64, [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#304: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#305: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Unit, UInt16, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
            .apply(StandardClassType<Unit, UInt16, UInt64>(), [NonGenericClass()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#306: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Unit, UInt16, UInt64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#307: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Unit, UInt16, UInt64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt64>(), [])
            @Expect("assertion#308: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(1i64, [])
            @Expect("assertion#309: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply("hello", [])
            @Expect("assertion#310: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt64>(), [])
            @Expect("assertion#311: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(1i64, [])
            @Expect("assertion#312: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply("hello", [])
            @Expect("assertion#313: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#314: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#315: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#316: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt64>(), [()])
            @Expect("assertion#317: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#318: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply("hello", [()])
            @Expect("assertion#319: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_10 ends.")
    }
}
