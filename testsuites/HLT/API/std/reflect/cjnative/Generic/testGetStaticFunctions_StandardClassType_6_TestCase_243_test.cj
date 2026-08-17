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
class testGetStaticFunctions_StandardClassType_6 {
    @TestCase
    func TestCase_243(): Unit {
        // logger.info("testcase TestCase_243 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, UInt32, Int16>>().getStaticFunctions("classStaticMemberFunction_26").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int16>>(), [],
                    [GenericClassWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#7439: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#7440: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7441: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7442: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int16>>(), [], [])
            @Expect("assertion#7443: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7444: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int16>>(), [],
                    [GenericClassWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#7445: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#7446: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int16>>(), [], [()])
            @Expect("assertion#7447: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7448: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt32, UInt32, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_26")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int16>>(),
                [GenericClassWith2TypeParameters<UInt32, UInt32>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#7449: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt32, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int16>>(), [])
            @Expect("assertion#7450: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7451: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt32, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int16>>(), [])
            @Expect("assertion#7452: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7453: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt32, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int16>>(),
                    [GenericClassWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#7454: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#7455: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt32, Int16> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int16>>(), [()])
            @Expect("assertion#7456: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7457: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt32, Int16> got.")
        }
        // logger.info("testcase TestCase_243 ends.")
    }
}
