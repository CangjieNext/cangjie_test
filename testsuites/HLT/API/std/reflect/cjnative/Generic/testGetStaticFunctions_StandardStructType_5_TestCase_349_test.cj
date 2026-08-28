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
class testGetStaticFunctions_StandardStructType_5 {
    @TestCase
    func TestCase_349(): Unit {
        // logger.info("testcase TestCase_349 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, Unit, Int8>>().getStaticFunctions("classStaticMemberFunction_132").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Int8>>(), [],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#10093: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#10094: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10095: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Int8>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10096: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Int8>>(), [], [])
            @Expect("assertion#10097: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10098: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Int8>>(), [],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#10099: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#10100: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Int8>>(), [], [()])
            @Expect("assertion#10101: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10102: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, Unit, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_132")[0i64]
            .apply(TypeInfo.of<StandardStructType<Float64, Unit, Int8>>(),
                [GenericClassWith2TypeParameters<Int64, Int64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#10103: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Unit, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Int8>>(), [])
            @Expect("assertion#10104: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10105: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Unit, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Int8>>(), [])
            @Expect("assertion#10106: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10107: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Unit, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Int8>>(),
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#10108: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#10109: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Unit, Int8> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Int8>>(), [()])
            @Expect("assertion#10110: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_132")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10111: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Unit, Int8> got.")
        }
        // logger.info("testcase TestCase_349 ends.")
    }
}
