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
    func TestCase_11(): Unit {
        // logger.info("testcase TestCase_11 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int8, Float32, Unit>>().getInstanceFunctions("classInstanceMemberFunction_12").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(StandardClassType<Int8, Float32, Unit>(), [], [NonGenericClass()])
            @Expect("assertion#320: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#321: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#322: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(StandardClassType<Int8, Float32, Unit>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#323: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#324: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#325: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(StandardClassType<Int8, Float32, Unit>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#326: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(StandardClassType<Int8, Float32, Unit>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#327: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(StandardClassType<Int8, Float32, Unit>(), [], [()])
            @Expect("assertion#328: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#329: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply("hello", [], [NonGenericClass()])
            @Expect("assertion#330: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#331: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#332: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(1i64, [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#333: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#334: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int8, Float32, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
            .apply(StandardClassType<Int8, Float32, Unit>(), [NonGenericClass()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#335: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int8, Float32, Unit>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#336: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int8, Float32, Unit>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(StandardClassType<Int8, Float32, Unit>(), [])
            @Expect("assertion#337: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(1i64, [])
            @Expect("assertion#338: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply("hello", [])
            @Expect("assertion#339: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(StandardClassType<Int8, Float32, Unit>(), [])
            @Expect("assertion#340: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(1i64, [])
            @Expect("assertion#341: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply("hello", [])
            @Expect("assertion#342: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(StandardClassType<Int8, Float32, Unit>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#343: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#344: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#345: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(StandardClassType<Int8, Float32, Unit>(), [()])
            @Expect("assertion#346: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#347: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply("hello", [()])
            @Expect("assertion#348: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_11 ends.")
    }
}
