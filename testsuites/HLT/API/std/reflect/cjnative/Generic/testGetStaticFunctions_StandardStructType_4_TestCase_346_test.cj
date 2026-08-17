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
    func TestCase_346(): Unit {
        // logger.info("testcase TestCase_346 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, UInt8, Bool>>().getStaticFunctions("classStaticMemberFunction_129").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Bool>>(), [],
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#10036: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#10037: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10038: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Bool>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10039: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Bool>>(), [], [])
            @Expect("assertion#10040: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10041: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Bool>>(), [],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10042: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10043: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Bool>>(), [], [()])
            @Expect("assertion#10044: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10045: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Unit, UInt8, Bool>>()
            .getStaticFunctions("classStaticMemberFunction_129")[0i64]
            .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Bool>>(), [GenericClassWith1TypeParameters<Unit>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#10046: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, Bool> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Bool>>(), [])
            @Expect("assertion#10047: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10048: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, Bool> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Bool>>(), [])
            @Expect("assertion#10049: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10050: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, Bool> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Bool>>(),
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10051: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10052: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, Bool> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Bool>>(), [()])
            @Expect("assertion#10053: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_129")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10054: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, Bool> got.")
        }
        // logger.info("testcase TestCase_346 ends.")
    }
}
