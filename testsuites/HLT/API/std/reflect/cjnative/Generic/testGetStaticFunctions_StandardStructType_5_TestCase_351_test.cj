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
    func TestCase_351(): Unit {
        // logger.info("testcase TestCase_351 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, Int16, Int8>>().getStaticFunctions("classStaticMemberFunction_134").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Int8>>(), [],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#10131: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#10132: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10133: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Int8>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10134: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Int8>>(), [], [])
            @Expect("assertion#10135: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10136: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Int8>>(), [],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#10137: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#10138: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Int8>>(), [], [()])
            @Expect("assertion#10139: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10140: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt16, Int16, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_134")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Int8>>(),
                [GenericClassWith2TypeParameters<Unit, Unit>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#10141: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int16, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Int8>>(), [])
            @Expect("assertion#10142: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10143: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int16, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Int8>>(), [])
            @Expect("assertion#10144: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10145: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int16, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Int8>>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#10146: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#10147: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int16, Int8> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Int8>>(), [()])
            @Expect("assertion#10148: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_134")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10149: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int16, Int8> got.")
        }
        // logger.info("testcase TestCase_351 ends.")
    }
}
