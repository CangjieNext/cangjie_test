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
class testGetStaticFunctions_StandardStructType_2 {
    @TestCase
    func TestCase_332(): Unit {
        // logger.info("testcase TestCase_332 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, UInt32, Float32>>().getStaticFunctions("classStaticMemberFunction_115").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float32>>(), [], [true])
            @Expect("assertion#9770: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [true])
            @Expect("assertion#9771: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#9772: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float32>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9773: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float32>>(), [], [])
            @Expect("assertion#9774: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9775: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float32>>(), [], [true, 114.514000f64])
            @Expect("assertion#9776: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [true, 114.514000f64])
            @Expect("assertion#9777: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float32>>(), [], [()])
            @Expect("assertion#9778: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#9779: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt16, UInt32, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_115")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float32>>(), [true])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<Int64>(), [true])
            @Expect("assertion#9780: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, UInt32, Float32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float32>>(), [])
            @Expect("assertion#9781: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9782: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, UInt32, Float32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float32>>(), [])
            @Expect("assertion#9783: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9784: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, UInt32, Float32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float32>>(), [true, 114.514000f64])
            @Expect("assertion#9785: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<Int64>(), [true, 114.514000f64])
            @Expect("assertion#9786: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, UInt32, Float32> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float32>>(), [()])
            @Expect("assertion#9787: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9788: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, UInt32, Float32> got.")
        }
        // logger.info("testcase TestCase_332 ends.")
    }
}
