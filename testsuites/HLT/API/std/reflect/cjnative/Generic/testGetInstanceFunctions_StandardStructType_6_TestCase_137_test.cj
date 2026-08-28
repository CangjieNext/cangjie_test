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
    func TestCase_137(): Unit {
        // logger.info("testcase TestCase_137 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, UInt8, Int8>>().getInstanceFunctions("classInstanceMemberFunction_138").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int8>(), [], [NonGenericStruct()])
            @Expect("assertion#4290: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#4291: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4292: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4293: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4294: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4295: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4296: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int8>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4297: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int8>(), [], [()])
            @Expect("assertion#4298: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4299: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply("hello", [], [NonGenericStruct()])
            @Expect("assertion#4300: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4301: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4302: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(1i64, [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4303: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4304: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, UInt8, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
            .apply(StandardStructType<Float64, UInt8, Int8>(), [NonGenericStruct()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#4305: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float64, UInt8, Int8>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#4306: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float64, UInt8, Int8>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int8>(), [])
            @Expect("assertion#4307: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4308: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply("hello", [])
            @Expect("assertion#4309: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int8>(), [])
            @Expect("assertion#4310: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4311: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply("hello", [])
            @Expect("assertion#4312: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int8>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4313: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4314: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4315: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int8>(), [()])
            @Expect("assertion#4316: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4317: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4318: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_137 ends.")
    }
}
