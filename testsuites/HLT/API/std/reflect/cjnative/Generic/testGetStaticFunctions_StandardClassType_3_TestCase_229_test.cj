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
    func TestCase_229(): Unit {
        // logger.info("testcase TestCase_229 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, UInt32, Int16>>().getStaticFunctions("classStaticMemberFunction_12").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Int16>>(), [], [NonGenericClass()])
            @Expect("assertion#7173: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#7174: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7175: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Int16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7176: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Int16>>(), [], [])
            @Expect("assertion#7177: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7178: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Int16>>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7179: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7180: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Int16>>(), [], [()])
            @Expect("assertion#7181: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7182: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int64, UInt32, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_12")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Int16>>(), [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#7183: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt32, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Int16>>(), [])
            @Expect("assertion#7184: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7185: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt32, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Int16>>(), [])
            @Expect("assertion#7186: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7187: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt32, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Int16>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7188: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7189: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt32, Int16> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Int16>>(), [()])
            @Expect("assertion#7190: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7191: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt32, Int16> got.")
        }
        // logger.info("testcase TestCase_229 ends.")
    }
}
