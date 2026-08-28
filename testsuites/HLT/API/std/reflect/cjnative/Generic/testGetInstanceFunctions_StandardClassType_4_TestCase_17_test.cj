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
    func TestCase_17(): Unit {
        // logger.info("testcase TestCase_17 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt8, Float64, Bool>>().getInstanceFunctions("classInstanceMemberFunction_18").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(StandardClassType<UInt8, Float64, Bool>(), [], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#494: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#495: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#496: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(StandardClassType<UInt8, Float64, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#497: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#498: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#499: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(StandardClassType<UInt8, Float64, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#500: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(StandardClassType<UInt8, Float64, Bool>(), [],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#501: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(StandardClassType<UInt8, Float64, Bool>(), [], [()])
            @Expect("assertion#502: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#503: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply("hello", [], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#504: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#505: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#506: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(1i64, [], [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#507: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#508: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt8, Float64, Bool>>()
            .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
            .apply(StandardClassType<UInt8, Float64, Bool>(), [GenericClassWith1TypeParameters<Bool>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#509: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt8, Float64, Bool>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#510: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt8, Float64, Bool>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(StandardClassType<UInt8, Float64, Bool>(), [])
            @Expect("assertion#511: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(1i64, [])
            @Expect("assertion#512: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply("hello", [])
            @Expect("assertion#513: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(StandardClassType<UInt8, Float64, Bool>(), [])
            @Expect("assertion#514: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(1i64, [])
            @Expect("assertion#515: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply("hello", [])
            @Expect("assertion#516: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(StandardClassType<UInt8, Float64, Bool>(),
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#517: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#518: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#519: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(StandardClassType<UInt8, Float64, Bool>(), [()])
            @Expect("assertion#520: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#521: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply("hello", [()])
            @Expect("assertion#522: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_17 ends.")
    }
}
