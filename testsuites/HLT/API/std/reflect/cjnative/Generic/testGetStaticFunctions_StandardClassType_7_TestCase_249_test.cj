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
class testGetStaticFunctions_StandardClassType_7 {
    @TestCase
    func TestCase_249(): Unit {
        // logger.info("testcase TestCase_249 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int8, Unit, Bool>>().getStaticFunctions("classStaticMemberFunction_32").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Unit, Bool>>(), [], [NonGenericStruct()])
            @Expect("assertion#7553: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#7554: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7555: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Unit, Bool>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7556: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Unit, Bool>>(), [], [])
            @Expect("assertion#7557: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7558: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Unit, Bool>>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7559: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7560: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Unit, Bool>>(), [], [()])
            @Expect("assertion#7561: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7562: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int8, Unit, Bool>>()
            .getStaticFunctions("classStaticMemberFunction_32")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int8, Unit, Bool>>(), [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#7563: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, Unit, Bool> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Unit, Bool>>(), [])
            @Expect("assertion#7564: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7565: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, Unit, Bool> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Unit, Bool>>(), [])
            @Expect("assertion#7566: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7567: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, Unit, Bool> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Unit, Bool>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7568: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7569: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, Unit, Bool> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Unit, Bool>>(), [()])
            @Expect("assertion#7570: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7571: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, Unit, Bool> got.")
        }
        // logger.info("testcase TestCase_249 ends.")
    }
}
