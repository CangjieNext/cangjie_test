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
class testGetStaticFunctions_StandardStructType_9 {
    @TestCase
    func TestCase_367(): Unit {
        // logger.info("testcase TestCase_367 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, Unit, Bool>>().getStaticFunctions("classStaticMemberFunction_150").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Unit, Bool>>(), [],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#10435: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#10436: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10437: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Unit, Bool>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10438: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Unit, Bool>>(), [], [])
            @Expect("assertion#10439: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10440: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Unit, Bool>>(), [],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#10441: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#10442: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Unit, Bool>>(), [], [()])
            @Expect("assertion#10443: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10444: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt16, Unit, Bool>>()
            .getStaticFunctions("classStaticMemberFunction_150")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt16, Unit, Bool>>(),
                [GenericStructWith2TypeParameters<Int64, Int64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#10445: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Unit, Bool> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Unit, Bool>>(), [])
            @Expect("assertion#10446: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10447: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Unit, Bool> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Unit, Bool>>(), [])
            @Expect("assertion#10448: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10449: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Unit, Bool> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Unit, Bool>>(),
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#10450: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#10451: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Unit, Bool> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Unit, Bool>>(), [()])
            @Expect("assertion#10452: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10453: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Unit, Bool> got.")
        }
        // logger.info("testcase TestCase_367 ends.")
    }
}
