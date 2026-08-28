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
class testGetInstanceFunctions_StandardStructType_5 {
    @TestCase
    func TestCase_131(): Unit {
        // logger.info("testcase TestCase_131 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int16, Int8, UInt8>>().getInstanceFunctions("classInstanceMemberFunction_132").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(StandardStructType<Int16, Int8, UInt8>(), [], [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#4116: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#4117: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4118: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(StandardStructType<Int16, Int8, UInt8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4119: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4120: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4121: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(StandardStructType<Int16, Int8, UInt8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4122: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(StandardStructType<Int16, Int8, UInt8>(), [],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4123: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(StandardStructType<Int16, Int8, UInt8>(), [], [()])
            @Expect("assertion#4124: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4125: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply("hello", [], [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#4126: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4127: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4128: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(1i64, [], [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4129: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4130: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int16, Int8, UInt8>>()
            .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
            .apply(StandardStructType<Int16, Int8, UInt8>(), [GenericClassWith2TypeParameters<Int64, Int64>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#4131: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int16, Int8, UInt8>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#4132: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int16, Int8, UInt8>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(StandardStructType<Int16, Int8, UInt8>(), [])
            @Expect("assertion#4133: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4134: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply("hello", [])
            @Expect("assertion#4135: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(StandardStructType<Int16, Int8, UInt8>(), [])
            @Expect("assertion#4136: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4137: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply("hello", [])
            @Expect("assertion#4138: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(StandardStructType<Int16, Int8, UInt8>(),
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4139: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4140: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4141: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(StandardStructType<Int16, Int8, UInt8>(), [()])
            @Expect("assertion#4142: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4143: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4144: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_131 ends.")
    }
}
