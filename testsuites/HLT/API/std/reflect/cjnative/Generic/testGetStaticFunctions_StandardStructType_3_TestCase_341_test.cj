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
class testGetStaticFunctions_StandardStructType_3 {
    @TestCase
    func TestCase_341(): Unit {
        // logger.info("testcase TestCase_341 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, Unit, Unit>>().getStaticFunctions("classStaticMemberFunction_124").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Unit>>(), [], [NonGenericClass()])
            @Expect("assertion#9941: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with 'genericTypeArgs'.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#9942: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with 'genericTypeArgs'.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#9943: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with 'genericTypeArgs'.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Unit>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9944: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with 'genericTypeArgs'.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Unit>>(), [], [])
            @Expect("assertion#9945: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with 'genericTypeArgs'.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9946: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with 'genericTypeArgs'.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Unit>>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9947: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with 'genericTypeArgs'.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9948: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with 'genericTypeArgs'.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Unit>>(), [], [()])
            @Expect("assertion#9949: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with 'genericTypeArgs'.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#9950: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with 'genericTypeArgs'.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, Unit, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_124")[0i64]
            .apply(TypeInfo.of<StandardStructType<Float64, Unit, Unit>>(), [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#9951: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Float64, Unit, Unit>'.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Unit>>(), [])
            @Expect("assertion#9952: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9953: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Float64, Unit, Unit>'.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Unit>>(), [])
            @Expect("assertion#9954: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9955: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Float64, Unit, Unit>'.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Unit>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9956: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9957: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Float64, Unit, Unit>'.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Unit>>(), [()])
            @Expect("assertion#9958: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch: expected 'dependency.NonGenericClass', got 'Unit'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9959: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Float64, Unit, Unit>'.")
        }
        // logger.info("testcase TestCase_341 ends.")
    }
}
