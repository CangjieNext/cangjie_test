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
class testGetStaticFunctions_StandardStructType_4 {
    @TestCase
    func TestCase_344(): Unit {
        // logger.info("testcase TestCase_344 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt32, Int8, Int16>>().getStaticFunctions("classStaticMemberFunction_127").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Int8, Int16>>(), [],
                    [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#9998: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#9999: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10000: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Int8, Int16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10001: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Int8, Int16>>(), [], [])
            @Expect("assertion#10002: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10003: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Int8, Int16>>(), [],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#10004: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#10005: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Int8, Int16>>(), [], [()])
            @Expect("assertion#10006: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10007: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt32, Int8, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_127")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt32, Int8, Int16>>(), [GenericClassWith1TypeParameters<Bool>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#10008: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, Int8, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Int8, Int16>>(), [])
            @Expect("assertion#10009: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10010: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, Int8, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Int8, Int16>>(), [])
            @Expect("assertion#10011: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10012: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, Int8, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Int8, Int16>>(),
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#10013: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#10014: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, Int8, Int16> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Int8, Int16>>(), [()])
            @Expect("assertion#10015: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_127")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10016: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, Int8, Int16> got.")
        }
        // logger.info("testcase TestCase_344 ends.")
    }
}
