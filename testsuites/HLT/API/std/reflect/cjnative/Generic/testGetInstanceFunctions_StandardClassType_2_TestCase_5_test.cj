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
    func TestCase_5(): Unit {
        // logger.info("testcase TestCase_5 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int8, Float32, UInt32>>().getInstanceFunctions("classInstanceMemberFunction_6").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(StandardClassType<Int8, Float32, UInt32>(), [], [true])
            @Expect("assertion#146: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [true])
            @Expect("assertion#147: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#148: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(StandardClassType<Int8, Float32, UInt32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#149: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#150: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [true, 114.514000f64])
            @Expect("assertion#151: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(StandardClassType<Int8, Float32, UInt32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#152: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(StandardClassType<Int8, Float32, UInt32>(), [], [true, 114.514000f64])
            @Expect("assertion#153: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(StandardClassType<Int8, Float32, UInt32>(), [], [()])
            @Expect("assertion#154: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#155: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply("hello", [], [true])
            @Expect("assertion#156: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#157: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#158: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(1i64, [], [true, 114.514000f64])
            @Expect("assertion#159: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#160: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int8, Float32, UInt32>>()
            .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
            .apply(StandardClassType<Int8, Float32, UInt32>(), [true])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(1i64, [true])
            @Expect("assertion#161: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int8, Float32, UInt32>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply("hello", [true])
            @Expect("assertion#162: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int8, Float32, UInt32>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(StandardClassType<Int8, Float32, UInt32>(), [])
            @Expect("assertion#163: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(1i64, [])
            @Expect("assertion#164: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply("hello", [])
            @Expect("assertion#165: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(StandardClassType<Int8, Float32, UInt32>(), [])
            @Expect("assertion#166: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(1i64, [])
            @Expect("assertion#167: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply("hello", [])
            @Expect("assertion#168: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(StandardClassType<Int8, Float32, UInt32>(), [true, 114.514000f64])
            @Expect("assertion#169: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(1i64, [true, 114.514000f64])
            @Expect("assertion#170: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply("hello", [true, 114.514000f64])
            @Expect("assertion#171: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(StandardClassType<Int8, Float32, UInt32>(), [()])
            @Expect("assertion#172: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#173: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply("hello", [()])
            @Expect("assertion#174: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_5 ends.")
    }
}
