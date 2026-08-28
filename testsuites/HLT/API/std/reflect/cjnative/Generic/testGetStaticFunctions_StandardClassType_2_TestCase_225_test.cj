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
class testGetStaticFunctions_StandardClassType_2 {
    @TestCase
    func TestCase_225(): Unit {
        // logger.info("testcase TestCase_225 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int8, Int16, Int64>>().getStaticFunctions("classStaticMemberFunction_8").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Int16, Int64>>(), [], [1i8])
            @Expect("assertion#7097: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [1i8])
            @Expect("assertion#7098: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7099: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Int16, Int64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7100: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Int16, Int64>>(), [], [])
            @Expect("assertion#7101: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7102: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Int16, Int64>>(), [], [1i8, 114.514000f64])
            @Expect("assertion#7103: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [1i8, 114.514000f64])
            @Expect("assertion#7104: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Int16, Int64>>(), [], [114.514000f64])
            @Expect("assertion#7105: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#7106: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int8, Int16, Int64>>()
            .getStaticFunctions("classStaticMemberFunction_8")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int8, Int16, Int64>>(), [1i8])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i8])
            @Expect("assertion#7107: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, Int16, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Int16, Int64>>(), [])
            @Expect("assertion#7108: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7109: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, Int16, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Int16, Int64>>(), [])
            @Expect("assertion#7110: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7111: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, Int16, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Int16, Int64>>(), [1i8, 114.514000f64])
            @Expect("assertion#7112: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i8, 114.514000f64])
            @Expect("assertion#7113: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, Int16, Int64> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Int16, Int64>>(), [114.514000f64])
            @Expect("assertion#7114: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_8")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#7115: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, Int16, Int64> got.")
        }
        // logger.info("testcase TestCase_225 ends.")
    }
}
