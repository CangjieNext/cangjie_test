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
class testGetInstanceFunctions_StandardClassType_5 {
    @TestCase
    func TestCase_21(): Unit {
        // logger.info("testcase TestCase_21 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, UInt32, Float64>>().getInstanceFunctions("classInstanceMemberFunction_22").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [], [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#610: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#611: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#612: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#613: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#614: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#615: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#616: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#617: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [], [()])
            @Expect("assertion#618: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#619: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply("hello", [], [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#620: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#621: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#622: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(1i64, [], [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#623: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#624: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt64, UInt32, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
            .apply(StandardClassType<UInt64, UInt32, Float64>(), [GenericClassWith1TypeParameters<Float64>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#625: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt64, UInt32, Float64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#626: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt64, UInt32, Float64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [])
            @Expect("assertion#627: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(1i64, [])
            @Expect("assertion#628: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply("hello", [])
            @Expect("assertion#629: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [])
            @Expect("assertion#630: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(1i64, [])
            @Expect("assertion#631: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply("hello", [])
            @Expect("assertion#632: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(),
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#633: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#634: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#635: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [()])
            @Expect("assertion#636: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#637: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply("hello", [()])
            @Expect("assertion#638: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_21 ends.")
    }
}
