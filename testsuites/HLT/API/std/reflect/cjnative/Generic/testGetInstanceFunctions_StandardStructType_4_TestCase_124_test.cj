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
class testGetInstanceFunctions_StandardStructType_4 {
    @TestCase
    func TestCase_124(): Unit {
        // logger.info("testcase TestCase_124 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, Int8, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_125").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt64>(), [], [NonGenericClass()])
            @Expect("assertion#3913: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#3914: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3915: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3916: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3917: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3918: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3919: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt64>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3920: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt64>(), [], [()])
            @Expect("assertion#3921: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#3922: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply("hello", [], [NonGenericClass()])
            @Expect("assertion#3923: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3924: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3925: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(1i64, [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3926: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#3927: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int32, Int8, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
            .apply(StandardStructType<Int32, Int8, UInt64>(), [NonGenericClass()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#3928: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int32, Int8, UInt64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#3929: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int32, Int8, UInt64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt64>(), [])
            @Expect("assertion#3930: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3931: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply("hello", [])
            @Expect("assertion#3932: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt64>(), [])
            @Expect("assertion#3933: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3934: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply("hello", [])
            @Expect("assertion#3935: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3936: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3937: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3938: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt64>(), [()])
            @Expect("assertion#3939: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3940: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3941: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_124 ends.")
    }
}
