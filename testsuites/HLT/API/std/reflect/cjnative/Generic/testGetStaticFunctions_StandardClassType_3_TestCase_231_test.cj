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
class testGetStaticFunctions_StandardClassType_3 {
    @TestCase
    func TestCase_231(): Unit {
        // logger.info("testcase TestCase_231 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, Float32, UInt16>>().getStaticFunctions("classStaticMemberFunction_14").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, UInt16>>(), [], [NonGenericClass()])
            @Expect("assertion#7211: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#7212: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7213: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, UInt16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7214: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, UInt16>>(), [], [])
            @Expect("assertion#7215: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7216: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, UInt16>>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7217: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7218: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, UInt16>>(), [], [()])
            @Expect("assertion#7219: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7220: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float32, Float32, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_14")[0i64]
            .apply(TypeInfo.of<StandardClassType<Float32, Float32, UInt16>>(), [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#7221: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Float32, UInt16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, UInt16>>(), [])
            @Expect("assertion#7222: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7223: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Float32, UInt16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, UInt16>>(), [])
            @Expect("assertion#7224: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7225: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Float32, UInt16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, UInt16>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7226: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7227: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Float32, UInt16> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, UInt16>>(), [()])
            @Expect("assertion#7228: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7229: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Float32, UInt16> got.")
        }
        // logger.info("testcase TestCase_231 ends.")
    }
}
