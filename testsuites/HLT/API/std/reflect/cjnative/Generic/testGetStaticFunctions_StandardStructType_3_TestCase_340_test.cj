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
    func TestCase_340(): Unit {
        // logger.info("testcase TestCase_340 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>().getStaticFunctions("classStaticMemberFunction_123").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(), [], [NonGenericClass()])
            @Expect("assertion#9922: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#9923: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#9924: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9925: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(), [], [])
            @Expect("assertion#9926: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9927: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9928: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9929: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(), [], [()])
            @Expect("assertion#9930: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#9931: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int32, Unit, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_123")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(), [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#9932: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Unit, UInt16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(), [])
            @Expect("assertion#9933: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9934: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Unit, UInt16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(), [])
            @Expect("assertion#9935: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9936: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Unit, UInt16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9937: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9938: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Unit, UInt16> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(), [()])
            @Expect("assertion#9939: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9940: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Unit, UInt16> got.")
        }
        // logger.info("testcase TestCase_340 ends.")
    }
}
