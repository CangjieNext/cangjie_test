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
class testGetInstanceFunctions_StandardStructType_6 {
    @TestCase
    func TestCase_134(): Unit {
        // logger.info("testcase TestCase_134 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, Int64, Unit>>().getInstanceFunctions("classInstanceMemberFunction_135").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(StandardStructType<UInt8, Int64, Unit>(), [], [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#4203: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#4204: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4205: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(StandardStructType<UInt8, Int64, Unit>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4206: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4207: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#4208: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(StandardStructType<UInt8, Int64, Unit>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4209: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(StandardStructType<UInt8, Int64, Unit>(), [],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#4210: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(StandardStructType<UInt8, Int64, Unit>(), [], [()])
            @Expect("assertion#4211: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4212: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply("hello", [], [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#4213: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4214: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4215: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(1i64, [], [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#4216: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4217: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt8, Int64, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
            .apply(StandardStructType<UInt8, Int64, Unit>(), [GenericClassWith2TypeParameters<UInt8, UInt8>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#4218: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt8, Int64, Unit>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#4219: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt8, Int64, Unit>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(StandardStructType<UInt8, Int64, Unit>(), [])
            @Expect("assertion#4220: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4221: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply("hello", [])
            @Expect("assertion#4222: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(StandardStructType<UInt8, Int64, Unit>(), [])
            @Expect("assertion#4223: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4224: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply("hello", [])
            @Expect("assertion#4225: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(StandardStructType<UInt8, Int64, Unit>(),
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#4226: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#4227: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#4228: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(StandardStructType<UInt8, Int64, Unit>(), [()])
            @Expect("assertion#4229: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4230: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4231: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_134 ends.")
    }
}
