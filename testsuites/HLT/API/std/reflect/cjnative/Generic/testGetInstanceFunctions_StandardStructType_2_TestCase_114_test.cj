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
class testGetInstanceFunctions_StandardStructType_2 {
    @TestCase
    func TestCase_114(): Unit {
        // logger.info("testcase TestCase_114 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_115").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt16>(), [], [true])
            @Expect("assertion#3623: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [true])
            @Expect("assertion#3624: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3625: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3626: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3627: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [true, 114.514000f64])
            @Expect("assertion#3628: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3629: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt16>(), [], [true, 114.514000f64])
            @Expect("assertion#3630: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt16>(), [], [()])
            @Expect("assertion#3631: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#3632: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply("hello", [], [true])
            @Expect("assertion#3633: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3634: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3635: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(1i64, [], [true, 114.514000f64])
            @Expect("assertion#3636: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#3637: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int32, Int8, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
            .apply(StandardStructType<Int32, Int8, UInt16>(), [true])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(1i64, [true])
            @Expect("assertion#3638: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int32, Int8, UInt16>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply("hello", [true])
            @Expect("assertion#3639: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int32, Int8, UInt16>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt16>(), [])
            @Expect("assertion#3640: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3641: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply("hello", [])
            @Expect("assertion#3642: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt16>(), [])
            @Expect("assertion#3643: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3644: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply("hello", [])
            @Expect("assertion#3645: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt16>(), [true, 114.514000f64])
            @Expect("assertion#3646: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(1i64, [true, 114.514000f64])
            @Expect("assertion#3647: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply("hello", [true, 114.514000f64])
            @Expect("assertion#3648: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt16>(), [()])
            @Expect("assertion#3649: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3650: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3651: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_114 ends.")
    }
}
