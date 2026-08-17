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
    func TestCase_251(): Unit {
        // logger.info("testcase TestCase_251 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Bool, Float32>>().getStaticFunctions("classStaticMemberFunction_34").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Float32>>(), [], [NonGenericStruct()])
            @Expect("assertion#7591: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#7592: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7593: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Float32>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7594: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Float32>>(), [], [])
            @Expect("assertion#7595: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7596: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Float32>>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7597: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7598: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Float32>>(), [], [()])
            @Expect("assertion#7599: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7600: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt64, Bool, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_34")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Float32>>(), [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#7601: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Bool, Float32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Float32>>(), [])
            @Expect("assertion#7602: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7603: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Bool, Float32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Float32>>(), [])
            @Expect("assertion#7604: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7605: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Bool, Float32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Float32>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7606: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7607: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Bool, Float32> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Float32>>(), [()])
            @Expect("assertion#7608: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7609: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Bool, Float32> got.")
        }
        // logger.info("testcase TestCase_251 ends.")
    }
}
