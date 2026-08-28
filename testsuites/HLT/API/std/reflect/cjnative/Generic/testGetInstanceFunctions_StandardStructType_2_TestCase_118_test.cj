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
class testGetInstanceFunctions_StandardStructType_2 {
    @TestCase
    func TestCase_118(): Unit {
        // logger.info("testcase TestCase_118 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, Int8, Unit>>().getInstanceFunctions("classInstanceMemberFunction_119").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(StandardStructType<UInt16, Int8, Unit>(), [], [()])
            @Expect("assertion#3739: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#3740: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3741: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(StandardStructType<UInt16, Int8, Unit>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3742: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3743: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [(), 114.514000f64])
            @Expect("assertion#3744: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(StandardStructType<UInt16, Int8, Unit>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3745: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(StandardStructType<UInt16, Int8, Unit>(), [], [(), 114.514000f64])
            @Expect("assertion#3746: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(StandardStructType<UInt16, Int8, Unit>(), [], [123i64])
            @Expect("assertion#3747: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [123i64])
            @Expect("assertion#3748: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#3749: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3750: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3751: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(1i64, [], [(), 114.514000f64])
            @Expect("assertion#3752: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply("hello", [], [123i64])
            @Expect("assertion#3753: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt16, Int8, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
            .apply(StandardStructType<UInt16, Int8, Unit>(), [()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3754: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt16, Int8, Unit>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3755: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt16, Int8, Unit>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(StandardStructType<UInt16, Int8, Unit>(), [])
            @Expect("assertion#3756: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3757: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply("hello", [])
            @Expect("assertion#3758: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(StandardStructType<UInt16, Int8, Unit>(), [])
            @Expect("assertion#3759: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3760: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply("hello", [])
            @Expect("assertion#3761: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(StandardStructType<UInt16, Int8, Unit>(), [(), 114.514000f64])
            @Expect("assertion#3762: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(1i64, [(), 114.514000f64])
            @Expect("assertion#3763: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply("hello", [(), 114.514000f64])
            @Expect("assertion#3764: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(StandardStructType<UInt16, Int8, Unit>(), [123i64])
            @Expect("assertion#3765: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(1i64, [123i64])
            @Expect("assertion#3766: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply("hello", [123i64])
            @Expect("assertion#3767: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_118 ends.")
    }
}
