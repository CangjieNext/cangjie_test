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
    func TestCase_132(): Unit {
        // logger.info("testcase TestCase_132 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float32, UInt64, Unit>>().getInstanceFunctions("classInstanceMemberFunction_133").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(StandardStructType<Float32, UInt64, Unit>(), [], [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4145: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4146: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4147: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(StandardStructType<Float32, UInt64, Unit>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4148: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4149: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4150: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(StandardStructType<Float32, UInt64, Unit>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4151: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(StandardStructType<Float32, UInt64, Unit>(), [],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4152: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(StandardStructType<Float32, UInt64, Unit>(), [], [()])
            @Expect("assertion#4153: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4154: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply("hello", [], [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4155: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4156: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4157: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(1i64, [], [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4158: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4159: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float32, UInt64, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
            .apply(StandardStructType<Float32, UInt64, Unit>(), [GenericClassWith2TypeParameters<Bool, Bool>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4160: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float32, UInt64, Unit>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4161: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float32, UInt64, Unit>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(StandardStructType<Float32, UInt64, Unit>(), [])
            @Expect("assertion#4162: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4163: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply("hello", [])
            @Expect("assertion#4164: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(StandardStructType<Float32, UInt64, Unit>(), [])
            @Expect("assertion#4165: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4166: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply("hello", [])
            @Expect("assertion#4167: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(StandardStructType<Float32, UInt64, Unit>(),
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4168: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4169: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4170: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(StandardStructType<Float32, UInt64, Unit>(), [()])
            @Expect("assertion#4171: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4172: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4173: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_132 ends.")
    }
}
