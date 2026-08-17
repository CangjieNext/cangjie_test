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
class testGetStaticFunctions_StandardStructType_1 {
    @TestCase
    func TestCase_331(): Unit {
        // logger.info("testcase TestCase_331 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, Int32, Int8>>().getStaticFunctions("classStaticMemberFunction_114").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int32, Int8>>(), [], [123i64])
            @Expect("assertion#9751: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [123i64])
            @Expect("assertion#9752: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#9753: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int32, Int8>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9754: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int32, Int8>>(), [], [])
            @Expect("assertion#9755: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9756: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int32, Int8>>(), [], [123i64, 114.514000f64])
            @Expect("assertion#9757: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [123i64, 114.514000f64])
            @Expect("assertion#9758: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int32, Int8>>(), [], [114.514000f64])
            @Expect("assertion#9759: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#9760: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt8, Int32, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_114")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt8, Int32, Int8>>(), [123i64])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64])
            @Expect("assertion#9761: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Int32, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int32, Int8>>(), [])
            @Expect("assertion#9762: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9763: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Int32, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int32, Int8>>(), [])
            @Expect("assertion#9764: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9765: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Int32, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int32, Int8>>(), [123i64, 114.514000f64])
            @Expect("assertion#9766: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64, 114.514000f64])
            @Expect("assertion#9767: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Int32, Int8> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int32, Int8>>(), [114.514000f64])
            @Expect("assertion#9768: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_114")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#9769: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Int32, Int8> got.")
        }
        // logger.info("testcase TestCase_331 ends.")
    }
}
