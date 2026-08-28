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
    func TestCase_115(): Unit {
        // logger.info("testcase TestCase_115 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, Int32, Unit>>().getInstanceFunctions("classInstanceMemberFunction_116").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(StandardStructType<Float64, Int32, Unit>(), [], [()])
            @Expect("assertion#3652: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#3653: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3654: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(StandardStructType<Float64, Int32, Unit>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3655: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3656: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [(), 114.514000f64])
            @Expect("assertion#3657: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(StandardStructType<Float64, Int32, Unit>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3658: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(StandardStructType<Float64, Int32, Unit>(), [], [(), 114.514000f64])
            @Expect("assertion#3659: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(StandardStructType<Float64, Int32, Unit>(), [], [123i64])
            @Expect("assertion#3660: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [123i64])
            @Expect("assertion#3661: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#3662: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3663: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3664: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(1i64, [], [(), 114.514000f64])
            @Expect("assertion#3665: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply("hello", [], [123i64])
            @Expect("assertion#3666: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, Int32, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
            .apply(StandardStructType<Float64, Int32, Unit>(), [()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3667: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float64, Int32, Unit>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3668: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float64, Int32, Unit>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(StandardStructType<Float64, Int32, Unit>(), [])
            @Expect("assertion#3669: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3670: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply("hello", [])
            @Expect("assertion#3671: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(StandardStructType<Float64, Int32, Unit>(), [])
            @Expect("assertion#3672: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3673: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply("hello", [])
            @Expect("assertion#3674: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(StandardStructType<Float64, Int32, Unit>(), [(), 114.514000f64])
            @Expect("assertion#3675: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(1i64, [(), 114.514000f64])
            @Expect("assertion#3676: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply("hello", [(), 114.514000f64])
            @Expect("assertion#3677: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(StandardStructType<Float64, Int32, Unit>(), [123i64])
            @Expect("assertion#3678: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(1i64, [123i64])
            @Expect("assertion#3679: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply("hello", [123i64])
            @Expect("assertion#3680: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_115 ends.")
    }
}
