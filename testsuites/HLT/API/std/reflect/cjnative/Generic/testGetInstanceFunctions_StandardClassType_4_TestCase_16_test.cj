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
class testGetInstanceFunctions_StandardClassType_4 {
    @TestCase
    func TestCase_16(): Unit {
        // logger.info("testcase TestCase_16 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>().getInstanceFunctions("classInstanceMemberFunction_17").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(StandardClassType<Int64, UInt32, Float64>(), [], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#465: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#466: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#467: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(StandardClassType<Int64, UInt32, Float64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#468: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#469: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#470: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(StandardClassType<Int64, UInt32, Float64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#471: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(StandardClassType<Int64, UInt32, Float64>(), [],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#472: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(StandardClassType<Int64, UInt32, Float64>(), [], [()])
            @Expect("assertion#473: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#474: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply("hello", [], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#475: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#476: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#477: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(1i64, [], [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#478: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#479: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int64, UInt32, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
            .apply(StandardClassType<Int64, UInt32, Float64>(), [GenericClassWith1TypeParameters<Int64>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#480: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int64, UInt32, Float64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#481: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int64, UInt32, Float64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(StandardClassType<Int64, UInt32, Float64>(), [])
            @Expect("assertion#482: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(1i64, [])
            @Expect("assertion#483: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply("hello", [])
            @Expect("assertion#484: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(StandardClassType<Int64, UInt32, Float64>(), [])
            @Expect("assertion#485: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(1i64, [])
            @Expect("assertion#486: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply("hello", [])
            @Expect("assertion#487: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(StandardClassType<Int64, UInt32, Float64>(),
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#488: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#489: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#490: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(StandardClassType<Int64, UInt32, Float64>(), [()])
            @Expect("assertion#491: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#492: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply("hello", [()])
            @Expect("assertion#493: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_16 ends.")
    }
}
