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
class testGetInstanceFunctions_StandardClassType_6 {
    @TestCase
    func TestCase_25(): Unit {
        // logger.info("testcase TestCase_25 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Unit, UInt16, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_26").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt16>(), [], [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#726: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#727: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#728: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#729: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#730: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#731: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#732: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt16>(), [],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#733: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt16>(), [], [()])
            @Expect("assertion#734: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#735: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply("hello", [], [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#736: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#737: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#738: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(1i64, [], [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#739: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#740: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Unit, UInt16, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
            .apply(StandardClassType<Unit, UInt16, UInt16>(), [GenericClassWith2TypeParameters<Unit, Unit>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#741: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Unit, UInt16, UInt16>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#742: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Unit, UInt16, UInt16>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt16>(), [])
            @Expect("assertion#743: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(1i64, [])
            @Expect("assertion#744: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply("hello", [])
            @Expect("assertion#745: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt16>(), [])
            @Expect("assertion#746: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(1i64, [])
            @Expect("assertion#747: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply("hello", [])
            @Expect("assertion#748: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt16>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#749: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#750: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#751: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt16>(), [()])
            @Expect("assertion#752: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#753: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply("hello", [()])
            @Expect("assertion#754: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_25 ends.")
    }
}
