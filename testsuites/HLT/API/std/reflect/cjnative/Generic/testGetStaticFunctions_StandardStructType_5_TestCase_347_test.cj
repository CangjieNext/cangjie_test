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
    func TestCase_347(): Unit {
        // logger.info("testcase TestCase_347 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt64, Int16, Int8>>().getStaticFunctions("classStaticMemberFunction_130").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int16, Int8>>(), [],
                    [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#10055: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#10056: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10057: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int16, Int8>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10058: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int16, Int8>>(), [], [])
            @Expect("assertion#10059: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10060: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int16, Int8>>(), [],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#10061: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#10062: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int16, Int8>>(), [], [()])
            @Expect("assertion#10063: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10064: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt64, Int16, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_130")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt64, Int16, Int8>>(), [GenericClassWith1TypeParameters<Int16>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#10065: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Int16, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int16, Int8>>(), [])
            @Expect("assertion#10066: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10067: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Int16, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int16, Int8>>(), [])
            @Expect("assertion#10068: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10069: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Int16, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int16, Int8>>(),
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#10070: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#10071: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Int16, Int8> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int16, Int8>>(), [()])
            @Expect("assertion#10072: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_130")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10073: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Int16, Int8> got.")
        }
        // logger.info("testcase TestCase_347 ends.")
    }
}
