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
    func TestCase_19(): Unit {
        // logger.info("testcase TestCase_19 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Bool, Int32, Float64>>().getInstanceFunctions("classInstanceMemberFunction_20").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(StandardClassType<Bool, Int32, Float64>(), [], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#552: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#553: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#554: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(StandardClassType<Bool, Int32, Float64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#555: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#556: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#557: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(StandardClassType<Bool, Int32, Float64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#558: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(StandardClassType<Bool, Int32, Float64>(), [],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#559: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(StandardClassType<Bool, Int32, Float64>(), [], [()])
            @Expect("assertion#560: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#561: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply("hello", [], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#562: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#563: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#564: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(1i64, [], [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#565: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#566: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Bool, Int32, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
            .apply(StandardClassType<Bool, Int32, Float64>(), [GenericClassWith1TypeParameters<Bool>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#567: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Bool, Int32, Float64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#568: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Bool, Int32, Float64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(StandardClassType<Bool, Int32, Float64>(), [])
            @Expect("assertion#569: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(1i64, [])
            @Expect("assertion#570: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply("hello", [])
            @Expect("assertion#571: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(StandardClassType<Bool, Int32, Float64>(), [])
            @Expect("assertion#572: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(1i64, [])
            @Expect("assertion#573: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply("hello", [])
            @Expect("assertion#574: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(StandardClassType<Bool, Int32, Float64>(),
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#575: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#576: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#577: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(StandardClassType<Bool, Int32, Float64>(), [()])
            @Expect("assertion#578: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#579: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply("hello", [()])
            @Expect("assertion#580: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_19 ends.")
    }
}
