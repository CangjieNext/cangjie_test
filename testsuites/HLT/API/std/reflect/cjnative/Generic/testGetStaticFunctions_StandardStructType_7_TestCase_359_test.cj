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
class testGetStaticFunctions_StandardStructType_7 {
    @TestCase
    func TestCase_359(): Unit {
        // logger.info("testcase TestCase_359 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, Bool, Float32>>().getStaticFunctions("classStaticMemberFunction_142").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float32>>(), [], [NonGenericStruct()])
            @Expect("assertion#10283: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#10284: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10285: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float32>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10286: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float32>>(), [], [])
            @Expect("assertion#10287: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10288: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float32>>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#10289: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#10290: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float32>>(), [], [()])
            @Expect("assertion#10291: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10292: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt16, Bool, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_142")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float32>>(), [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#10293: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Bool, Float32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float32>>(), [])
            @Expect("assertion#10294: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10295: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Bool, Float32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float32>>(), [])
            @Expect("assertion#10296: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10297: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Bool, Float32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float32>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#10298: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#10299: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Bool, Float32> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float32>>(), [()])
            @Expect("assertion#10300: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10301: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Bool, Float32> got.")
        }
        // logger.info("testcase TestCase_359 ends.")
    }
}
