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
class testGetInstanceFunctions_StandardStructType_7 {
    @TestCase
    func TestCase_141(): Unit {
        // logger.info("testcase TestCase_141 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, UInt8, Int16>>().getInstanceFunctions("classInstanceMemberFunction_142").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int16>(), [], [NonGenericStruct()])
            @Expect("assertion#4406: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#4407: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4408: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4409: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4410: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4411: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4412: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int16>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4413: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int16>(), [], [()])
            @Expect("assertion#4414: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4415: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply("hello", [], [NonGenericStruct()])
            @Expect("assertion#4416: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4417: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4418: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(1i64, [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4419: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4420: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, UInt8, Int16>>()
            .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
            .apply(StandardStructType<Float64, UInt8, Int16>(), [NonGenericStruct()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#4421: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float64, UInt8, Int16>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#4422: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float64, UInt8, Int16>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int16>(), [])
            @Expect("assertion#4423: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4424: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply("hello", [])
            @Expect("assertion#4425: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int16>(), [])
            @Expect("assertion#4426: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4427: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply("hello", [])
            @Expect("assertion#4428: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int16>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4429: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4430: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4431: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int16>(), [()])
            @Expect("assertion#4432: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4433: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4434: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_141 ends.")
    }
}
