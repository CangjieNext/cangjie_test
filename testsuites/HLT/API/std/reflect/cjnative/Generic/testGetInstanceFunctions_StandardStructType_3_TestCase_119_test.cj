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
    func TestCase_119(): Unit {
        // logger.info("testcase TestCase_119 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, Bool, Bool>>().getInstanceFunctions("classInstanceMemberFunction_120").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
                .apply(StandardStructType<Unit, Bool, Bool>(), [], [NonGenericClass()])
            @Expect("assertion#3768: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#3769: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3770: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
                .apply(StandardStructType<Unit, Bool, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3771: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3772: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3773: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
                .apply(StandardStructType<Unit, Bool, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3774: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
                .apply(StandardStructType<Unit, Bool, Bool>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3775: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
                .apply(StandardStructType<Unit, Bool, Bool>(), [], [()])
            @Expect("assertion#3776: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#3777: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
                .apply("hello", [], [NonGenericClass()])
            @Expect("assertion#3778: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3779: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3780: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
                .apply(1i64, [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3781: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#3782: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Unit, Bool, Bool>>()
            .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
            .apply(StandardStructType<Unit, Bool, Bool>(), [NonGenericClass()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#3783: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Unit, Bool, Bool>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#3784: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Unit, Bool, Bool>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
                .apply(StandardStructType<Unit, Bool, Bool>(), [])
            @Expect("assertion#3785: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3786: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
                .apply("hello", [])
            @Expect("assertion#3787: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
                .apply(StandardStructType<Unit, Bool, Bool>(), [])
            @Expect("assertion#3788: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3789: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
                .apply("hello", [])
            @Expect("assertion#3790: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
                .apply(StandardStructType<Unit, Bool, Bool>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3791: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3792: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3793: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
                .apply(StandardStructType<Unit, Bool, Bool>(), [()])
            @Expect("assertion#3794: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3795: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_120")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3796: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_119 ends.")
    }
}
