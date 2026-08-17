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
class testGetStaticFunctions_StandardStructType_9 {
    @TestCase
    func TestCase_370(): Unit {
        // logger.info("testcase TestCase_370 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, Float64, Int16>>().getStaticFunctions("classStaticMemberFunction_153").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Int16>>(), [],
                    [GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#10492: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#10493: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10494: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Int16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10495: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Int16>>(), [], [])
            @Expect("assertion#10496: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10497: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Int16>>(), [],
                    [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#10498: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#10499: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Int16>>(), [], [()])
            @Expect("assertion#10500: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10501: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, Float64, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_153")[0i64]
            .apply(TypeInfo.of<StandardStructType<Float64, Float64, Int16>>(),
                [GenericStructWith2TypeParameters<Float64, Float64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#10502: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Float64, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Int16>>(), [])
            @Expect("assertion#10503: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10504: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Float64, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Int16>>(), [])
            @Expect("assertion#10505: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10506: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Float64, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Int16>>(),
                    [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#10507: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#10508: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Float64, Int16> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Int16>>(), [()])
            @Expect("assertion#10509: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10510: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Float64, Int16> got.")
        }
        // logger.info("testcase TestCase_370 ends.")
    }
}
