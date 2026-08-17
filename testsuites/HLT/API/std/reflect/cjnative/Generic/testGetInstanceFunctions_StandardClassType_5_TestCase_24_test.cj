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
    func TestCase_24(): Unit {
        // logger.info("testcase TestCase_24 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, Float32, Bool>>().getInstanceFunctions("classInstanceMemberFunction_25").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(StandardClassType<Int32, Float32, Bool>(), [], [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#697: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#698: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#699: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(StandardClassType<Int32, Float32, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#700: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#701: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#702: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(StandardClassType<Int32, Float32, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#703: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(StandardClassType<Int32, Float32, Bool>(), [],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#704: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(StandardClassType<Int32, Float32, Bool>(), [], [()])
            @Expect("assertion#705: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#706: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply("hello", [], [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#707: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#708: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#709: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(1i64, [], [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#710: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#711: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int32, Float32, Bool>>()
            .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
            .apply(StandardClassType<Int32, Float32, Bool>(), [GenericClassWith2TypeParameters<Unit, Unit>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#712: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int32, Float32, Bool>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#713: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int32, Float32, Bool>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(StandardClassType<Int32, Float32, Bool>(), [])
            @Expect("assertion#714: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(1i64, [])
            @Expect("assertion#715: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply("hello", [])
            @Expect("assertion#716: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(StandardClassType<Int32, Float32, Bool>(), [])
            @Expect("assertion#717: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(1i64, [])
            @Expect("assertion#718: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply("hello", [])
            @Expect("assertion#719: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(StandardClassType<Int32, Float32, Bool>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#720: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#721: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#722: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(StandardClassType<Int32, Float32, Bool>(), [()])
            @Expect("assertion#723: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#724: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply("hello", [()])
            @Expect("assertion#725: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_24 ends.")
    }
}
