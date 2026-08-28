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
    func TestCase_345(): Unit {
        // logger.info("testcase TestCase_345 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int16, Float32, Bool>>().getStaticFunctions("classStaticMemberFunction_128").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float32, Bool>>(), [],
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#10017: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#10018: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10019: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float32, Bool>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10020: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float32, Bool>>(), [], [])
            @Expect("assertion#10021: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10022: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float32, Bool>>(), [],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10023: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10024: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float32, Bool>>(), [], [()])
            @Expect("assertion#10025: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10026: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int16, Float32, Bool>>()
            .getStaticFunctions("classStaticMemberFunction_128")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int16, Float32, Bool>>(), [GenericClassWith1TypeParameters<Unit>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#10027: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Float32, Bool> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float32, Bool>>(), [])
            @Expect("assertion#10028: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10029: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Float32, Bool> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float32, Bool>>(), [])
            @Expect("assertion#10030: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10031: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Float32, Bool> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float32, Bool>>(),
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10032: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10033: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Float32, Bool> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float32, Bool>>(), [()])
            @Expect("assertion#10034: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float32, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_128")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10035: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Float32, Bool> got.")
        }
        // logger.info("testcase TestCase_345 ends.")
    }
}
