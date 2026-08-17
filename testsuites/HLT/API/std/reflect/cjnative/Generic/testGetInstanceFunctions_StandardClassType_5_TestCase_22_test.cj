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
    func TestCase_22(): Unit {
        // logger.info("testcase TestCase_22 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float64, Int64, Float32>>().getInstanceFunctions("classInstanceMemberFunction_23").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(StandardClassType<Float64, Int64, Float32>(), [],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#639: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#640: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#641: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(StandardClassType<Float64, Int64, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#642: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#643: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#644: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(StandardClassType<Float64, Int64, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#645: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(StandardClassType<Float64, Int64, Float32>(), [],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#646: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(StandardClassType<Float64, Int64, Float32>(), [], [()])
            @Expect("assertion#647: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#648: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply("hello", [], [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#649: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#650: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#651: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(1i64, [], [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#652: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#653: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float64, Int64, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
            .apply(StandardClassType<Float64, Int64, Float32>(), [GenericClassWith2TypeParameters<Int64, Int64>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#654: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Float64, Int64, Float32>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#655: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Float64, Int64, Float32>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(StandardClassType<Float64, Int64, Float32>(), [])
            @Expect("assertion#656: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(1i64, [])
            @Expect("assertion#657: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply("hello", [])
            @Expect("assertion#658: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(StandardClassType<Float64, Int64, Float32>(), [])
            @Expect("assertion#659: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(1i64, [])
            @Expect("assertion#660: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply("hello", [])
            @Expect("assertion#661: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(StandardClassType<Float64, Int64, Float32>(),
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#662: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#663: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#664: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(StandardClassType<Float64, Int64, Float32>(), [()])
            @Expect("assertion#665: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#666: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply("hello", [()])
            @Expect("assertion#667: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_22 ends.")
    }
}
