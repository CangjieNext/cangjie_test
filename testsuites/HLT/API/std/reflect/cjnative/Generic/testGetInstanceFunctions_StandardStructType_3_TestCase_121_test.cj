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
    func TestCase_121(): Unit {
        // logger.info("testcase TestCase_121 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, UInt32, Float32>>().getInstanceFunctions("classInstanceMemberFunction_122").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
                .apply(StandardStructType<Unit, UInt32, Float32>(), [], [NonGenericClass()])
            @Expect("assertion#3826: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#3827: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3828: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
                .apply(StandardStructType<Unit, UInt32, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3829: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3830: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3831: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
                .apply(StandardStructType<Unit, UInt32, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3832: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
                .apply(StandardStructType<Unit, UInt32, Float32>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3833: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
                .apply(StandardStructType<Unit, UInt32, Float32>(), [], [()])
            @Expect("assertion#3834: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#3835: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
                .apply("hello", [], [NonGenericClass()])
            @Expect("assertion#3836: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3837: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3838: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
                .apply(1i64, [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3839: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#3840: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Unit, UInt32, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
            .apply(StandardStructType<Unit, UInt32, Float32>(), [NonGenericClass()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#3841: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Unit, UInt32, Float32>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#3842: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Unit, UInt32, Float32>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
                .apply(StandardStructType<Unit, UInt32, Float32>(), [])
            @Expect("assertion#3843: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3844: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
                .apply("hello", [])
            @Expect("assertion#3845: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
                .apply(StandardStructType<Unit, UInt32, Float32>(), [])
            @Expect("assertion#3846: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3847: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
                .apply("hello", [])
            @Expect("assertion#3848: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
                .apply(StandardStructType<Unit, UInt32, Float32>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3849: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3850: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3851: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
                .apply(StandardStructType<Unit, UInt32, Float32>(), [()])
            @Expect("assertion#3852: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3853: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_122")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3854: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_121 ends.")
    }
}
