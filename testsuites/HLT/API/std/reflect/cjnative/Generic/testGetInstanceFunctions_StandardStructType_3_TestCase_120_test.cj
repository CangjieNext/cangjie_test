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
class testGetInstanceFunctions_StandardStructType_3 {
    @TestCase
    func TestCase_120(): Unit {
        // logger.info("testcase TestCase_120 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, UInt8, UInt32>>().getInstanceFunctions("classInstanceMemberFunction_121").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
                .apply(StandardStructType<Int64, UInt8, UInt32>(), [], [NonGenericClass()])
            @Expect("assertion#3797: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#3798: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3799: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
                .apply(StandardStructType<Int64, UInt8, UInt32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3800: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3801: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3802: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
                .apply(StandardStructType<Int64, UInt8, UInt32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3803: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
                .apply(StandardStructType<Int64, UInt8, UInt32>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3804: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
                .apply(StandardStructType<Int64, UInt8, UInt32>(), [], [()])
            @Expect("assertion#3805: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#3806: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
                .apply("hello", [], [NonGenericClass()])
            @Expect("assertion#3807: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3808: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3809: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
                .apply(1i64, [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3810: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#3811: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int64, UInt8, UInt32>>()
            .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
            .apply(StandardStructType<Int64, UInt8, UInt32>(), [NonGenericClass()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#3812: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int64, UInt8, UInt32>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#3813: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int64, UInt8, UInt32>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
                .apply(StandardStructType<Int64, UInt8, UInt32>(), [])
            @Expect("assertion#3814: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3815: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
                .apply("hello", [])
            @Expect("assertion#3816: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
                .apply(StandardStructType<Int64, UInt8, UInt32>(), [])
            @Expect("assertion#3817: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3818: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
                .apply("hello", [])
            @Expect("assertion#3819: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
                .apply(StandardStructType<Int64, UInt8, UInt32>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3820: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3821: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3822: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
                .apply(StandardStructType<Int64, UInt8, UInt32>(), [()])
            @Expect("assertion#3823: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3824: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_121")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3825: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_120 ends.")
    }
}
