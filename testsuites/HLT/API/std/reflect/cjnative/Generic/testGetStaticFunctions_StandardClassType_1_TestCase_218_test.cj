/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
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
class testGetStaticFunctions_StandardClassType_1 {
    @TestCase
    func TestCase_218(): Unit {
        // logger.info("testcase TestCase_218 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt16, Float64, Unit>>().getStaticFunctions("classStaticMemberFunction_1").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_1")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float64, Unit>>(), [], [])
            @Expect("assertion#6954: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_1")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#6955: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_1")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [114.514000f64])
            @Expect("assertion#6956: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_1")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float64, Unit>>(), [TypeInfo.of<Float32>()],
                    [114.514000f64])
            @Expect("assertion#6957: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt16, Float64, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_1")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt16, Float64, Unit>>(), [])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_1")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#6958: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, Float64, Unit> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_1")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float64, Unit>>(), [114.514000f64])
            @Expect("assertion#6959: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_1")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#6960: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, Float64, Unit> got.")
        }
        // logger.info("testcase TestCase_218 ends.")
    }
}
